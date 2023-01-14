import 'package:get/get.dart';
import 'package:mychat/app/modules/auth/splash/splash_bindings.dart';
import 'package:mychat/app/modules/auth/splash/splash_page.dart';

class SplashRouters {
  SplashRouters._();

  static final routes = <GetPage>[
    GetPage(
      name: '/splash',
      binding: SplashBindings(),
      page: () => const SplashPage(),
    ),
  ];
}
