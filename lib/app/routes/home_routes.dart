import 'package:get/get.dart';
import 'package:mychat/app/modules/home/home_bindings.dart';
import 'package:mychat/app/modules/home/home_page.dart';

class HomeRouters {
  HomeRouters._();

  static final routes = <GetPage>[
    GetPage(
      name: '/home',
      binding: HomeBindings(),
      page: () => const HomePage(),
    ),
  ];
}
