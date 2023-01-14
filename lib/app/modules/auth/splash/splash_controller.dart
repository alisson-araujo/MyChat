import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: verificar se o usuario ja fez login
  @override
  void onReady() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed('/conversations');
    super.onReady();
  }
}
