import 'package:get/get.dart';
import 'package:mychat/app/modules/home/contacts/contacts_controller.dart';
import 'package:mychat/app/modules/home/conversations/conversations_controller.dart';

class ConversationsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConversationsController());
    Get.put(ContactsController(), permanent: true);
  }
}
