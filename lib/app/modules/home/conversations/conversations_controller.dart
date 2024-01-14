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
  RxList<Chat> chats = [Chat()].obs;

  Future<void> loadChats() async {
    final List resp = await chatsql.getChats();
    debugPrint('resp: $resp');
    chats.clear();
    for (int i = 0; i < resp.length; i++) {
      chats.add(Chat.fromMap(resp[i]));
    }
    if (chats.length > 1 && chats[0].lastMsgTime != null) {
      chats.sort((a, b) => b.lastMsgTime!.compareTo(a.lastMsgTime!));
    }
  }

  Future<List> getChat(Chat chat) async {
    final talk = await chatsql.getChat(chat.id!);
    if (talk.isNotEmpty) {
      final messages = await chatsql.getMessages(chat.id!);
      return messages;
    }

    return [];
  }
}
