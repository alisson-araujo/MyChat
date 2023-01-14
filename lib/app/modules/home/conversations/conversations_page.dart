import 'package:flutter/material.dart';
import 'package:mychat/app/modules/home/widgets/conversation_widget.dart';

class ConversationsPage extends StatelessWidget {
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
          children: const [
            ConversationWidget(
              userName: 'Carla Araujo',
              lastMsg: 'hello, how are you?',
              lastMsgTime: '14:20',
              numberMsgNotRead: '1',
              arguments: ['Carla Araujo'],
            ),
            ConversationWidget(
              userName: 'Mother',
              lastMsg: 'go to supermarket for me',
              lastMsgTime: '13:01',
              numberMsgNotRead: '3',
              arguments: ['Mother'],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.message),
      ),
    );
  }
}
