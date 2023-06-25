import 'package:get/get.dart';
import 'package:mychat/app/modules/home/conversations/conversations_controller.dart';

class ConversationsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConversationsController());
  }
}
