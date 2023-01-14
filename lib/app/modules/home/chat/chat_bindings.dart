import 'package:get/get.dart';
import 'package:mychat/app/modules/home/chat/chat_controller.dart';

class ChatBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }
}
