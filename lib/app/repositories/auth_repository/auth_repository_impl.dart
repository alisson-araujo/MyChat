import 'package:dio/dio.dart';
import 'package:mychat/app/models/user.dart';
import 'package:mychat/app/repositories/auth_repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final dio = Dio();

  @override
  Future login({required String phoneNumber, required String password}) async {
    try {
      final response = await dio.post(
        'http://localhost:8000/token',
        data: FormData.fromMap({
          'username': phoneNumber,
          'password': password,
        }),
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future register({required User user}) async {
    try {
      final response = await dio.post(
        'http://localhost:8000/register-user',
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
