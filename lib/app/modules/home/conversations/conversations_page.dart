import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mychat/app/modules/home/conversations/conversations_controller.dart';
import 'package:mychat/app/modules/home/widgets/conversation_widget.dart';

class ConversationsPage extends GetView<ConversationsController> {
  const ConversationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
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
                    return GestureDetector(
                      onTap: () => controller.getChat(
                        controller.chats[index]['numberContact'],
                        controller.chats[index]['nameContact'],
                      ),
                      child: ConversationWidget(
                        userName: controller.chats[index]['nameContact'],
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
