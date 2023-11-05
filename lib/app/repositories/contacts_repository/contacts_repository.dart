abstract class ContactsRepository {
  Future<Map<String, dynamic>> getContactsWithRegistration(List phoneNumbers);
}
