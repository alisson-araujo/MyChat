import 'package:contacts_service/contacts_service.dart';
import 'package:get/get.dart';
import 'package:mychat/app/models/chat.dart';
import 'package:mychat/app/repositories/sqlite/chat_sqlite.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsController extends GetxController {
  @override
  void onInit() {
    _askPermission();
    super.onInit();
  }

  final chatSqlite = ChatSqlite();
  List<Contact>? contatos;
  RxBool isComplete = false.obs;

  Future<void> _askPermission() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      contatos = await ContactsService.getContacts(withThumbnails: false);
      contatos?.removeWhere((element) => element.phones == null);
      contatos?.removeWhere((element) => element.givenName == null);
      isComplete.toggle();
    } else {
      _handleInvalidPermissions(permissionStatus);
    }
  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      Get.snackbar(
        'Attention',
        'Access to contact data denied',
        duration: const Duration(seconds: 5),
      );
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      Get.snackbar(
        'Attention',
        'Contact data not available on device',
        duration: const Duration(seconds: 5),
      );
    }
  }

  Future<void> getChat(numberContact, nameContact) async {
    final chats = chatSqlite.chats;
    for (var chat in chats) {
      if (chat['numberContact'] == numberContact) {
        final messages = await chatSqlite.getMessages(chat['id']);
        final chatObj = Chat(
          id: chat['id'],
          numberContact: chat['numberContact'],
          nameContact: chat['nameContact'],
          lastMsgTime: chat['lastMsgTime'],
          lastMsg: chat['lastMsg'],
        );
        Get.toNamed('/chat', arguments: [chatObj, messages]);
      }
    }

    Get.toNamed('/chat', arguments: [
      Chat(
        numberContact: numberContact,
        nameContact: nameContact,
      )
    ]);
  }
}
