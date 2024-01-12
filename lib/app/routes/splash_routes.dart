import 'package:go_router/go_router.dart';
import 'package:mychat/app/modules/auth/splash/splash_page.dart';
import 'package:mychat/app/routes/home_routes.dart';
import 'package:mychat/app/routes/register_routes.dart';

List<GoRoute> mainRoutes = [
  GoRoute(
    path: '/splash',
    builder: (context, state) => const SplashPage(),
  ),
  ...authRoutes,
  ...chatRoutes,
];
