import 'package:flutter/material.dart';
import 'package:mychat/app/utils/ui/triangle_message.dart';

class MessageWidget extends StatelessWidget {
  final String? text;
  final bool isReceived;
  final String? time;
  const MessageWidget({
    super.key,
    this.text,
    this.isReceived = false,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
      child: Row(
        mainAxisAlignment:
            isReceived ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isReceived
              ? const CustomPaint(
                  painter: Triangle(color: Colors.white),
                )
              : const SizedBox.shrink(),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: isReceived ? Colors.white : Colors.blue,
                borderRadius: isReceived
                    ? const BorderRadius.only(
                        topRight: Radius.circular(18),
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                      )
                    : const BorderRadius.only(
                        topLeft: Radius.circular(18),
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                      ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    text ?? '',
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Monstserrat',
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    time ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Monstserrat',
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          isReceived
              ? const SizedBox.shrink()
              : const CustomPaint(painter: Triangle(color: Colors.blue)),
        ],
      ),
    );
  }
}
