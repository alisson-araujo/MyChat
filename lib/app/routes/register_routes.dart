import 'package:get/get.dart';
import 'package:mychat/app/modules/register/register_first_step/register_first_step_bindings.dart';
import 'package:mychat/app/modules/register/register_first_step/register_first_step_page.dart';
import 'package:mychat/app/modules/register/register_second_step/register_second_step_bindings.dart';
import 'package:mychat/app/modules/register/register_second_step/register_second_step_page.dart';
import 'package:mychat/app/modules/register/register_third_step/register_third_step_bindings.dart';
import 'package:mychat/app/modules/register/register_third_step/register_third_step_page.dart';

class RegisterRouters {
  RegisterRouters._();
  
  static final routes = <GetPage>[
    GetPage(
      name: '/register-first-step',
      binding: RegisterFirstStepBindings(),
      page: () => const RegisterFirstStepPage(),
    ),
    GetPage(
      name: '/register-second-step',
      binding: RegisterSecondStepBindings(),
      page: () => const RegisterSecondStepPage(),
    ),
    GetPage(
      name: '/register-third-step',
      binding: RegisterThirdStepBindings(),
      page: () => const RegisterThirdStepPage(),
    ),
  ];
}
