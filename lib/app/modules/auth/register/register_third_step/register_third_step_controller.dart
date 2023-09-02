import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:mychat/app/models/user.dart';
import 'package:mychat/app/repositories/auth_repository/auth_repository.dart';
import 'package:mychat/app/repositories/auth_repository/auth_repository_impl.dart';

class RegisterThirdStepController extends GetxController {
  final AuthRepository _authRepository = AuthRepositoryImpl();
  final _storage = const FlutterSecureStorage();

  final phone = Get.arguments;

  Future register(User user) async {
    final response = await _authRepository.register(user: user);
    if (response['status_code'] == 201) {
      login(user.phoneNumber, user.password);
    } else {
      Get.snackbar(
        'error',
        response['message'],
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future login(String phone, String password) async {
    final token = await _authRepository.login(
      phoneNumber: phone,
      password: password,
    );
    if (token != null) {
      await _storage.write(key: 'accessToken', value: token['access_token']);
      Get.offAllNamed('/conversations');
    } else {
      Get.snackbar(
        'error',
        'something went wrong',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
