import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mychat/app/modules/home/chat/chat_controller.dart';
import 'package:mychat/app/modules/home/widgets/message_widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final controller = Get.find<ChatController>();
  final mensageEd = TextEditingController();
  final grey = Colors.grey[300];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
    KeyboardVisibilityController().onChange.listen((bool visible) async {
      controller.keyboardOpen.value = visible;
      if (visible) {
        await Future.delayed(const Duration(milliseconds: 300));
        _scrollToBottom();
      }
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 50) {
        controller.isScrollAtBottom.value = true;
      } else {
        controller.isScrollAtBottom.value = false;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    mensageEd.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(
        _scrollController.position.maxScrollExtent,
      );
    }
  }

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
        bottomNavigationBar: SafeArea(
          child: Obx(
            () => Padding(
              padding: controller.keyboardOpen.value
                  ? EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom)
                  : EdgeInsets.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.05,
                        right: width * 0.03,
                        top: height * 0.01,
                      ),
                      child: TextFormField(
                        minLines: 1,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'Message',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.only(
                            left: width * 0.05,
                            top: height * 0.01,
                            bottom: height * 0.01,
                          ),
                        ),
                        controller: mensageEd,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.05),
                    child: IconButton(
                      hoverColor: Colors.amber,
                      onPressed: () {
                        if (mensageEd.text.isEmpty) return;
                        controller.listMsg.add(MessageWidget(
                          text: mensageEd.text,
                          time: DateFormat('HH:mm').format(DateTime.now()),
                        ));
                        controller.sendMessage(mensageEd.text);
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _scrollToBottom();
                        });
                        mensageEd.clear();
                      },
                      icon: const Icon(Icons.send),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => SizedBox(
                  height: controller.keyboardOpen.value
                      ? height -
                          kToolbarHeight -
                          (MediaQuery.of(context).viewInsets.bottom * 1.3)
                      : height -
                          kToolbarHeight -
                          (kBottomNavigationBarHeight * 2),
                  child: Obx(
                    () => controller.listMsg.isNotEmpty
                        ? ListView.builder(
                            // key: UniqueKey(),
                            controller: _scrollController,
                            itemCount: controller.listMsg.length,
                            itemBuilder: (context, index) {
                              return controller.listMsg[index];
                            },
                            padding: const EdgeInsets.only(
                                bottom: kBottomNavigationBarHeight),
                          )
                        : const SizedBox(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
