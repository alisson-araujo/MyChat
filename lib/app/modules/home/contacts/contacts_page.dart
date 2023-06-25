import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mychat/app/modules/home/contacts/contacts_controller.dart';

class ContactsPage extends GetView<ContactsController> {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final grey = Colors.grey[300];
    return Scaffold(
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
            onTap: () => ContactsService.openContactForm(),
          ),
          const ListTile(
            title: Text('Invite contacts to MyChat'),
          ),
          Obx(
            () => Expanded(
              child: controller.isComplete.isTrue
                  ? ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: controller.contatos?.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () => {
                            controller.getChat(
                                controller.contatos?[index].phones?[0].value
                                    ?.replaceAll(RegExp(r'[^\d]+'), ''),
                                controller.contatos?[index].givenName),
                          },
                          title: Text(
                              controller.contatos?[index].givenName ?? ''),
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
    );
  }
}
