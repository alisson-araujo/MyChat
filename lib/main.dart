import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mychat/app/routes/splash_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
        initialLocation: '/splash',
        routes: [
          ...mainRoutes,
        ],
      ),
    );
  }
}
