import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:mychat/app/repositories/auth_repository/auth_repository_impl.dart';

class SplashController extends GetxController {
  final _authRepository = AuthRepositoryImpl();

  Future<String> checkToken() async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: 'accessToken');
    await Future.delayed(const Duration(seconds: 1));
    if (token != null) {
      final refreshToken = await _authRepository.refresh();
      if (refreshToken?["access_token"] != null) {
        return '/conversations';
      } else {
        return '/login';
      }
    } else {
      return '/register-first-step';
    }
  }
}
