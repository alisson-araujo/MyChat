import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:mychat/app/repositories/auth_repository/auth_repository_impl.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    checkToken();
    super.onInit();
  }

  final _authRepository = AuthRepositoryImpl();

  checkToken() async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: 'accessToken');
    if (token != null) {
      final refreshToken = await _authRepository.refresh();
      if (refreshToken?["access_token"] != null) {
        Get.offAllNamed('/conversations');
      } else {
        Get.offAllNamed('/login');
      }
    } else {
      Get.offAllNamed('/register-first-step');
    }
  }
}
