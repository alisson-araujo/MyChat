import 'package:get/get.dart';
import 'package:mychat/app/models/user.dart';
import 'package:mychat/app/repositories/auth_repository/auth_repository.dart';
import 'package:mychat/app/repositories/auth_repository/auth_repository_impl.dart';

class RegisterThirdStepController extends GetxController {
  final AuthRepository _authRepository = AuthRepositoryImpl();

  final phone = Get.arguments;

  Future register(User user) async {
    final response = await _authRepository.register(user: user);
    return response;
  }
}
