import 'package:get/get.dart';
import 'package:mychat/app/modules/auth/register/register_third_step/register_third_step_controller.dart';

class RegisterThirdStepBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterThirdStepController());
  }
}
