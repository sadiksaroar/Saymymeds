import 'package:go_router/go_router.dart';
import 'package:saymymeds/app/views/screens/enter_code/view/enter_code.dart';
import 'package:saymymeds/app/views/screens/forget_password/view/forget_password_screen.dart';
import 'package:saymymeds/app/views/screens/new_password/view/new_password.dart';
import 'package:saymymeds/app/views/screens/sign_in/views/sigin_in_views.dart';
import 'package:saymymeds/app/views/screens/sign_up/view/sign_up.dart';
import 'package:saymymeds/app/views/screens/splash/splash_screen.dart';
import 'package:saymymeds/app/views/screens/welcome/weal_come_screen.dart';

class AppRoutes {
  ////////////////
  static const String splashScreen = "/";
  static const String welcomeScreen = "/welcome";
  static const String siginIn = "/signin"; // /signin
  static const String forgetPasswordScreen = "/forgetPasswordScreen";
  static const String enterCode = "/enterCode";
  static const String newPassword = "/newPassword";
  static const String signUp = "/signUp";

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
      GoRoute(
        path: forgetPasswordScreen,
        builder: (context, state) =>
            const ForgetPasswordScreen(), // fixed spelling
      ),
      GoRoute(
        path: enterCode,
        builder: (context, state) => const EnterCode(), // fixed spelling
      ),
      GoRoute(
        path: newPassword,
        builder: (context, state) => const NewPassword(),
      ),
      // sign up screen
      GoRoute(path: signUp, builder: (context, state) => const SignUp()),
    ],
  );
}
