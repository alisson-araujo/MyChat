import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mychat/app/models/chat.dart';
import 'package:mychat/app/models/message.dart';
import 'package:mychat/app/repositories/sqlite/chat_sqlite.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

import '../widgets/message_widget.dart';

class ChatController extends GetxController {
  @override
  void onInit() {
    contact = Get.arguments[0];
    loadMessages();
    openWebSocket();
    super.onInit();
  }

  @override
  void onClose() {
    closeWebSocket();
    super.onClose();
  }

  final sqliteRepository = ChatSqlite();
  List<Widget> mensagens = [];
  RxList listMsg = [].obs;
  late Chat contact;
  late int? id = contact.id;
  RxBool keyboardOpen = false.obs;
  RxBool isScrollAtBottom = false.obs;
  late IOWebSocketChannel channel;

  Future<int?> _setChat() async {
    id = await sqliteRepository.setChat(contact);
    return id;
  }

  void _saveOnSqlite(String message, bool isReceived) async {
    id ??= await _setChat();
    await sqliteRepository.setMessage(
      Message(
        idChat: contact.id ?? id ?? 1,
        content: message,
        sendDate: DateTime.now(),
        isReceived: isReceived ? 1 : 0,
      ),
    );
  }

  void loadMessages() async {
    if (Get.arguments.length > 1) {
      List messages = Get.arguments[1];
      List messagesSorted = List.from(messages);
      messagesSorted.sort((a, b) => a['send_date'].compareTo(b['send_date']));
      for (var message in messagesSorted) {
        final parseTime = DateTime.tryParse(message['send_date']);
        listMsg.add((MessageWidget(
          text: message['content'],
          isReceived: message['is_received'] == 1,
          time: DateFormat('HH:mm').format(parseTime ?? DateTime.now()),
        )));
      }
    }
  }

  openWebSocket() async {
    channel = IOWebSocketChannel.connect('ws://192.168.0.195:8000/ws');

    await channel.ready;

    channel.stream.listen((event) {
      listMsg.add(MessageWidget(
        isReceived: true,
        text: event,
        time: DateFormat('HH:mm').format(DateTime.now()),
      ));
      _saveOnSqlite(event, true);
    }, onError: (error) {
      log('Error: $error');
    });
  }

  sendMessage(String message) {
    try {
      channel.sink.add(message);
      _saveOnSqlite(message, false);
    } catch (e) {
      log('Error: $e');
    }
  }

  closeWebSocket() {
    channel.sink.close(status.goingAway);
  }
}
