import 'package:go_router/go_router.dart';
import 'package:mychat/app/modules/auth/login/login_page.dart';
import 'package:mychat/app/modules/auth/register/register_first_step/register_first_step_page.dart';
import 'package:mychat/app/modules/auth/register/register_second_step/register_second_step_page.dart';
import 'package:mychat/app/modules/auth/register/register_third_step/register_third_step_page.dart';

final authRoutes = <GoRoute>[
  GoRoute(
    path: '/register-first-step',
    builder: (context, state) => const RegisterFirstStepPage(),
  ),
  GoRoute(
    path: '/register-second-step',
    builder: (context, state) => const RegisterSecondStepPage(),
  ),
  GoRoute(
    path: '/register-third-step',
    builder: (context, state) => const RegisterThirdStepPage(),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginPage(),
  ),
];
