import 'package:get/get.dart';
import 'package:mychat/app/modules/home/chat/chat_page.dart';
import 'package:mychat/app/modules/home/conversations/conversations_bindings.dart';
import 'package:mychat/app/modules/home/conversations/conversations_page.dart';

import '../modules/home/chat/chat_bindings.dart';

class HomeRouters {
  HomeRouters._();

  static final routes = <GetPage>[
    GetPage(
      name: '/conversations',
      binding: ConversationsBindings(),
      page: () => const ConversationsPage(),
    ),
    GetPage(
      name: '/chat',
      binding: ChatBindings(),
      page: () => const ChatPage(),
    ),
  ];
}
