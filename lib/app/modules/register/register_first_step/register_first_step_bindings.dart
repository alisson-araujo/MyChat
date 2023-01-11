import 'package:get/get.dart';
import 'package:mychat/app/modules/register/register_first_step/register_first_step_controller.dart';

class RegisterFirstStepBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterFirstStepController());
  }
}
