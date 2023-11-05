import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mychat/app/repositories/contacts_repository/contacts_repository.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  final dio = Dio();
  final secureStorage = const FlutterSecureStorage();
  final _baseUrl = 'http://localhost:8000';

  @override
  Future<Map<String, dynamic>> getContactsWithRegistration(
      List phoneNumbers) async {
    try {
      final token = await secureStorage.read(key: 'accessToken');
      final response = await dio.post(
        '$_baseUrl/users',
        data: {
          'list_phone_number': phoneNumbers,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return response.data;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
