import 'package:flutter/material.dart';

class ConversationWidget extends StatelessWidget {
  final String? urlImage;
  final String? userName;
  final String? lastMsg;
  final String? lastMsgTime;
  final String? numberMsgNotRead;
  const ConversationWidget({
    super.key,
    this.urlImage,
    this.userName,
    this.lastMsg,
    this.lastMsgTime,
    this.numberMsgNotRead,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 30,
                  child: urlImage != null
                      ? Image.network(urlImage!)
                      : const Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      lastMsg ?? 'msgs not found',
                      style: const TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(lastMsgTime ?? ''),
                const SizedBox(height: 5),
                CircleAvatar(
                  radius: 12,
                  child: Text(
                    numberMsgNotRead ?? '',
                    style: const TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
