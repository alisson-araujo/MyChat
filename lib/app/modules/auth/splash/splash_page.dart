import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mychat/app/modules/auth/splash/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = SplashController();

  @override
  void initState() {
    controller.checkToken().then((value) => context.go(value));
    super.initState();
  }

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
