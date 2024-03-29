import 'package:get/get.dart';
import 'package:mychat/app/repositories/auth_repository/auth_repository_impl.dart';

class LoginController extends GetxController {
  final _repository = AuthRepositoryImpl();

  Future<String> login(String phoneNumber, String password) async {
    try {
      final response = await _repository.login(
        phoneNumber: phoneNumber,
        password: password,
      );
      if (response['access_token'] != null) {
        return 'ok';
      }
      return response['detail'];
    } on Exception catch (e) {
      return e.toString();
    }
  }
}
