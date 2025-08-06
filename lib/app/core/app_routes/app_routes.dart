import 'package:go_router/go_router.dart';
import 'package:saymymeds/app/views/screens/splash/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = "/";
  static const String wealcomeScreen = "/WealComeScreen";

  //  app routes

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: wealcomeScreen,
        builder: (context, state) => const WealComeScreen(),
      ),
    ],
  );
}
