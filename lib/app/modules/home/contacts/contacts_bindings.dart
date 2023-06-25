import 'package:get/get.dart';
import 'package:mychat/app/modules/home/contacts/contacts_controller.dart';

class ContactsBidings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactsController());
  }
}
