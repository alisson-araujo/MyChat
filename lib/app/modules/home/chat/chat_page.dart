import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mychat/app/modules/home/chat/chat_controller.dart';
import 'package:mychat/app/modules/home/widgets/message_widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final controller = Get.put(ChatController());
  final mensageEd = TextEditingController();
  final grey = Colors.grey[300];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () {
        Get.offAllNamed('/conversations');
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: grey,
        appBar: AppBar(
          title: Row(
            children: [
              const CircleAvatar(child: Icon(Icons.person)),
              const SizedBox(width: 10),
              Text(
                controller.contact.nameContact ?? '',
                style: TextStyle(color: Colors.grey[800]),
              ),
            ],
          ),
          leadingWidth: width * 0.08,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
          toolbarHeight: height * 0.07,
          backgroundColor: grey,
          elevation: 0,
          foregroundColor: Colors.grey[800],
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(
                () => controller.listMsg.isNotEmpty
                    ? ListView.builder(
                        itemCount: controller.listMsg.length,
                        itemBuilder: (context, index) {
                          return controller.listMsg[index];
                        },
                      )
                    : const SizedBox(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: mensageEd,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (mensageEd.text.isEmpty) return;
                    controller.listMsg.add(MessageWidget(text: mensageEd.text));
                    controller.sendMessage(mensageEd.text);
                    mensageEd.clear();
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
