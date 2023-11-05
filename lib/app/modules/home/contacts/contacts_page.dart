import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mychat/app/modules/home/contacts/contacts_controller.dart';

class ContactsPage extends GetView<ContactsController> {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final grey = Colors.grey[300];
    return WillPopScope(
      onWillPop: () {
        Get.offAllNamed('/conversations');
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: grey,
        appBar: AppBar(
          title: Text(
            'Contacts',
            style: TextStyle(color: Colors.grey[800]),
          ),
          backgroundColor: grey,
          foregroundColor: Colors.grey[800],
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            ListTile(
              title: const Text('New contact'),
              leading: const Icon(Icons.person_add),
              onTap: () => debugPrint(controller.alreadyRegistered
                  .toString()), //ContactsService.openContactForm(),
            ),
            const ListTile(
              title: Text(
                'Already on MyChat',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Obx(
              () => Flexible(
                child: controller.isComplete.isTrue
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.alreadyRegistered.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () => {
                              controller.getChat(
                                  controller.alreadyRegistered[index]['phone']
                                      .replaceAll(RegExp(r'[^\d]+'), ''),
                                  controller.alreadyRegistered[index]['name']),
                            },
                            title: Text(controller.alreadyRegistered[index]
                                    ['name'] ??
                                ''),
                          );
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ),
            const ListTile(
              title: Text(
                'Invite contacts to MyChat',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Obx(
              () => Expanded(
                child: controller.isComplete.isTrue
                    ? ListView.builder(
                        itemCount: controller.notRegistered.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () => {
                              controller.getChat(
                                  controller.notRegistered[index]['phone']
                                      .replaceAll(RegExp(r'[^\d]+'), ''),
                                  controller.notRegistered[index]['name']),
                            },
                            title: Text(
                                controller.notRegistered[index]['name'] ?? ''),
                            trailing: TextButton(
                              onPressed: () {},
                              child: const Text('Invite'),
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
