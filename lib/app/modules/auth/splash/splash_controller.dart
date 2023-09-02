import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    checkToken();
    super.onInit();
  }

  checkToken() async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: 'accessToken');
    if (token != null) {
      // TODO: check token in api
      Get.offAllNamed('/conversations');
    } else {
      Get.offAllNamed('/register-first-step');
    }
  }
}
