import 'package:get/get.dart';
import 'package:mychat/app/modules/auth/splash/splash_controller.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}