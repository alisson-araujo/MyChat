import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mychat/app/routes/home_routes.dart';
import 'package:mychat/app/routes/register_routes.dart';
import 'package:mychat/app/routes/splash_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      getPages: [
        ...SplashRouters.routes,
        ...RegisterRouters.routes,
        ...HomeRouters.routes,
      ],
    );
  }
}
