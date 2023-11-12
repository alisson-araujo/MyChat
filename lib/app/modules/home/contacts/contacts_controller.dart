import 'package:contacts_service/contacts_service.dart';
import 'package:get/get.dart';
import 'package:mychat/app/models/chat.dart';
import 'package:mychat/app/repositories/contacts_repository/contacts_repository_impl.dart';
import 'package:mychat/app/repositories/sqlite/chat_sqlite.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsController extends GetxController {
  @override
  void onInit() {
    _askPermission();

    super.onInit();
  }

  final _contactsRepository = ContactsRepositoryImpl();
  final chatSqlite = ChatSqlite();

  List<Contact>? contactsFromDevice;
  List phoneNumbers = [];
  List contactsWithRegistration = [];
  RxBool isComplete = false.obs;

  RxList alreadyRegistered = [].obs;
  RxList notRegistered = [].obs;

  Future<void> _askPermission() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      contactsFromDevice =
          await ContactsService.getContacts(withThumbnails: false);
      contactsFromDevice?.removeWhere((element) => element.phones == null);
      contactsFromDevice?.removeWhere((element) => element.givenName == null);
      for (var contato in contactsFromDevice!) {
        for (var phone in contato.phones!) {
          phoneNumbers.add(phone.value!.replaceAll(RegExp(r'[^\d]+'), ''));
        }
      }
      await getContactsWithRegistration(phoneNumbers);
      combineTwoList(contactsFromDevice!, contactsWithRegistration);
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

  Future getContactsWithRegistration(List phoneNumbers) async {
    try {
      final response =
          await _contactsRepository.getContactsWithRegistration(phoneNumbers);

      if (response['status_code'] == 200) {
        contactsWithRegistration = response['body']['data'];
      }

      return response;
    } catch (e) {
      Get.snackbar(
        'Attention',
        'Error getting contacts',
        duration: const Duration(seconds: 5),
      );
    }
  }

  void combineTwoList(
      List<Contact> allContacts, List contactsWithRegistration) {
    if (contactsWithRegistration.isEmpty) {
      for (var contact in allContacts) {
        notRegistered.add({
          'name': contact.givenName,
          'phone': contact.phones?.first.value,
        });
      }
    } else {
      for (var contact in allContacts) {
        for (var contactWithRegistration in contactsWithRegistration) {
          if (contact.phones?.first.value == contactWithRegistration['phone']) {
            alreadyRegistered.add({
              'name': contact.givenName,
              'phone': contact.phones?.first.value,
            });
          } else {
            notRegistered.add({
              'name': contact.givenName,
              'phone': contact.phones?.first.value,
            });
          }
        }
      }
    }
  }
}
