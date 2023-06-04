import 'package:get/get.dart';

import '../../../repositories/sqlite/chat_sqlite.dart';

class ConversationsController extends GetxController {
  @override
  void onInit() {
    loadChats();
    super.onInit();
  }

  final chatsql = ChatSqlite();
  RxList chats = [].obs;

  Future<void> loadChats() async {
    final resp = await chatsql.getChats();
    chats.value = resp;
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
