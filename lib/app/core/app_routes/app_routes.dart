import 'package:go_router/go_router.dart';
import 'package:saymymeds/app/views/screens/sign_in/views/sigin_in_views.dart';
import 'package:saymymeds/app/views/screens/splash/splash_screen.dart';
import 'package:saymymeds/app/views/screens/welcome/weal_come_screen.dart';

class AppRoutes {
  ////////////////
  static const String splashScreen = "/";
  static const String welcomeScreen = "/welcome";
  static const String siginIn = "/signin";

  static final GoRouter router = GoRouter(
    initialLocation: splashScreen, // explicitly set initial route
    routes: [
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: welcomeScreen,
        builder: (context, state) => const WelcomeScreen(), // fixed spelling
      ),
      GoRoute(
        path: siginIn,
        builder: (context, state) => const SiginInViews(), // fixed spelling
      ),
    ],
  );
}
