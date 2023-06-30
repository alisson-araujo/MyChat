import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mychat/app/models/chat.dart';

import '../../../repositories/sqlite/chat_sqlite.dart';

class ConversationsController extends GetxController {
  @override
  void onInit() {
    loadChats();
    super.onInit();
  }

  final chatsql = ChatSqlite();
  RxList<Chat> chats = [Chat(numberContact: '')].obs;

  Future<void> loadChats() async {
    final List resp = await chatsql.getChats();
    debugPrint('resp: $resp');
    chats.removeAt(0);
    for (int i = 0; i < resp.length; i++) {
      chats.add(Chat.fromMap(resp[i]));
    }
    if (chats.length > 1) {
      chats.sort((a, b) => b.lastMsgTime!.compareTo(a.lastMsgTime!));
    }
  }

  Future<void> getChat(numberContact, nameContact) async {
    final chats = chatsql.chats;
    for (var chat in chats) {
      if (chat['numberContact'] == numberContact) {
        final messages = await chatsql.getMessages(chat['id']);
        Get.toNamed('/chat', arguments: [chat, messages]);
      }
    }
    final param = {
      'numberContact': numberContact,
      'nameContact': nameContact,
    };
    Get.toNamed('/chat', arguments: [param]);
  }
}
