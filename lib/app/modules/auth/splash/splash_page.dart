import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mychat/app/modules/auth/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/MyCHAT.png'),
      ),
    );
  }
}