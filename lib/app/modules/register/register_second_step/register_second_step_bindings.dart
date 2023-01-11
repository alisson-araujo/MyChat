import 'package:get/get.dart';
import 'package:mychat/app/modules/register/register_second_step/register_second_step_controller.dart';

class RegisterSecondStepBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterSecondStepController());
  }
}
