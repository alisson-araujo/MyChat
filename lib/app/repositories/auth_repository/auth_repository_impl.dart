import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mychat/app/models/user.dart';
import 'package:mychat/app/repositories/auth_repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final dio = Dio();
  final secureStorage = const FlutterSecureStorage();
  final _baseUrl = 'http://localhost:8000';

  @override
  Future login({required String phoneNumber, required String password}) async {
    try {
      final response = await dio.post(
        '$_baseUrl/token',
        data: FormData.fromMap({
          'username': phoneNumber,
          'password': password,
        }),
      );

      await secureStorage.write(
        key: 'accessToken',
        value: response.data['access_token'],
      );

      return response.data;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future refresh() async {
    try {
      final accessToken = await secureStorage.read(key: 'accessToken');
      final response = await dio.post(
        '$_baseUrl/token/refresh',
        options: Options(
          headers: {'token': 'Bearer $accessToken'},
        ),
      );
      if (response.data['access_token'] != null) {
        await secureStorage.write(
          key: 'accessToken',
          value: response.data['access_token'],
        );
      }
      return response.data;
    } on DioException catch (e) {
      log('Error: ${e.message}');
      return {'accessToken': null};
    }
  }

  @override
  Future register({required User user}) async {
    try {
      final response = await dio.post(
        '$_baseUrl/register-user',
        data: {
          'username': user.username,
          'phone': user.phoneNumber,
          'password': user.password,
        },
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
