import 'package:go_router/go_router.dart';
import 'package:mychat/app/modules/home/chat/chat_page.dart';
import 'package:mychat/app/modules/home/contacts/contacts_page.dart';
import 'package:mychat/app/modules/home/conversations/conversations_page.dart';

final chatRoutes = <GoRoute>[
  GoRoute(
    path: '/conversations',
    builder: (context, state) => const ConversationsPage(),
  ),
  GoRoute(
    path: '/chat',
    builder: (context, state) => const ChatPage(),
  ),
  GoRoute(
    path: '/contacts',
    builder: (context, state) => const ContactsPage(),
  ),
];
