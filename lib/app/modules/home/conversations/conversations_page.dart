import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mychat/app/modules/home/conversations/conversations_controller.dart';
import 'package:mychat/app/modules/home/widgets/conversation_widget.dart';

class ConversationsPage extends StatefulWidget {
  const ConversationsPage({super.key});

  @override
  State<ConversationsPage> createState() => _ConversationsPageState();
}

class _ConversationsPageState extends State<ConversationsPage>
    with WidgetsBindingObserver {
  final controller = Get.put(ConversationsController());

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      controller.loadChats();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    final grey = Colors.grey[300];
    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        title: Text(
          'Chats',
          style: TextStyle(color: Colors.grey[800]),
        ),
        backgroundColor: grey,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.chats.length,
                  itemBuilder: (context, index) {
                    final dateParse = DateTime.tryParse(
                        controller.chats[index].lastMsgTime ?? '');
                    return GestureDetector(
                      onTap: () => controller.getChat(controller.chats[index]),
                      child: ConversationWidget(
                        userName: controller.chats[index].nameContact,
                        lastMsg: controller.chats[index].lastMsg,
                        lastMsgTime: DateFormat('HH:mm')
                            .format(dateParse ?? DateTime.now()),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/contacts'),
        child: const Icon(Icons.message),
      ),
    );
  }
}
