import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mychat/app/models/chat.dart';
import 'package:mychat/app/models/message.dart';
import 'package:mychat/app/repositories/sqlite/chat_sqlite.dart';

import '../widgets/message_widget.dart';

class ChatController extends GetxController {
  @override
  void onInit() {
    contact = Get.arguments[0];
    loadMessages();
    super.onInit();
  }

  final sqliteRepository = ChatSqlite();
  List<Widget> mensagens = [];
  RxList listMsg = [].obs;
  late Chat contact;
  late int? id = contact.id;

  Future<int?> _setChat() async {
    id = await sqliteRepository.setChat(contact);
    return id;
  }

  void sendMessage(String message) async {
    id ??= await _setChat();
    await sqliteRepository.setMessage(
      Message(
        idChat: contact.id ?? id ?? 1,
        content: message,
        sendDate: DateTime.now(),
      ),
    );
  }

  void loadMessages() async {
    if (Get.arguments.length > 1) {
      List messages = Get.arguments[1];
      List messagesSorted = List.from(messages);
      messagesSorted.sort((a, b) => a['send_date'].compareTo(b['send_date']));
      for (var message in messagesSorted) {
        listMsg.add((MessageWidget(text: message['content'])));
      }
    }
  }
}
