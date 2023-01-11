import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mychat/app/modules/register/register_first_step/register_first_step_page.dart';
import 'package:mychat/app/routes/register_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RegisterFirstStepPage(),
      getPages: [
        ...RegisterRouters.routes,
      ],
    );
  }
}
