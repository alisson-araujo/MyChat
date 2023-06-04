import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mychat/app/models/chat.dart';
import 'package:mychat/app/models/message.dart';
import 'package:mychat/app/repositories/sqlite/chat_sqlite.dart';

import '../widgets/message_widget.dart';

class ChatController extends GetxController {
  @override
  void onInit() {
    loadMessages();
    super.onInit();
  }

  final sqliteRepository = ChatSqlite();
  List<Widget> mensagens = [];
  RxList lista = [].obs;
  Map contact = Get.arguments[0];

  Future<int> _setChat() async {
    for (var chat in sqliteRepository.chats) {
      if (chat['numberContact'] == Get.arguments[0]['numberContact']) {
        debugPrint('chaaaaaaaaaaaaaat: $chat');
        return chat['id'];
      }
    }

    int id = await sqliteRepository.setChat(
      Chat(
        numberContact: Get.arguments[0]['numberContact'],
        nameContact: Get.arguments[0]['nameContact'],
      ),
    );
    return id;
  }

  void sendMessage(String message) async {
    int id = await _setChat();
    await sqliteRepository.setMessage(
      Message(
        idChat: id,
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
        lista.add((MessageWidget(text: message['content'])));
      }
    }
  }
}
