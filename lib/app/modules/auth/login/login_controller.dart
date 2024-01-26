import 'package:get/get.dart';
import 'package:mychat/app/repositories/auth_repository/auth_repository_impl.dart';

class LoginController extends GetxController {
  final _repository = AuthRepositoryImpl();

  Future login(String phoneNumber, String password) async {
    final response = await _repository.login(
      phoneNumber: phoneNumber,
      password: password,
    );

    if (response is Exception) {
      return {
        'success': false,
        'message': response.toString(),
      };
    }
    return {
      'success': true,
      'message': 'Login successfully!',
    };
  }
}
