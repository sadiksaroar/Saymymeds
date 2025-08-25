import 'package:go_router/go_router.dart';
import 'package:saymymeds/app/views/screens/auth/enter_code/view/enter_code.dart';
import 'package:saymymeds/app/views/screens/auth/forget_password/view/forget_password_screen.dart';
import 'package:saymymeds/app/views/screens/auth/new_password/view/new_password.dart';
import 'package:saymymeds/app/views/screens/auth/sign_in/views/sigin_in_views.dart';
import 'package:saymymeds/app/views/screens/auth/sign_up/view/sign_up.dart';
import 'package:saymymeds/app/views/screens/home/views/bottom_nav.dart';
import 'package:saymymeds/app/views/screens/splash/splash_screen.dart';
import 'package:saymymeds/app/views/screens/view_details/view_detils.dart';
import 'package:saymymeds/app/views/screens/welcome/weal_come_screen.dart';

class AppRoutes {
  ////////////////
  static const String splashScreen = "/";
  static const String welcomeScreen = "/welcome";
  // auth start
  static const String siginIn = "/signin"; // /signin
  static const String forgetPasswordScreen = "/forgetPasswordScreen";
  static const String enterCode = "/enterCode";
  static const String newPassword = "/newPassword";
  static const String signUp = "/signUp";
  // auth end

  // bottomNav start here
  static const String bottomNav = "/bottomNav";
  // view dittels screen
  static const String medicineDetailPage = "/medicineDetailPage";
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
      GoRoute(path: signUp, builder: (context, state) => const SignUp()), // dd
      GoRoute(path: bottomNav, builder: (context, state) => const BottomNav()),

      GoRoute(
        path: medicineDetailPage,
        builder: (context, state) => const MedicineDetailPage(),
      ),
    ],
  );
}
