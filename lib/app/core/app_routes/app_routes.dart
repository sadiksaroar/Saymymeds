import 'package:go_router/go_router.dart';
import 'package:saymymeds/app/views/screens/auth/enter_code.dart';
import 'package:saymymeds/app/views/screens/auth/forget_password.dart';
import 'package:saymymeds/app/views/screens/auth/new_password.dart';

import 'package:saymymeds/app/views/screens/auth/sigin_in.dart';
import 'package:saymymeds/app/views/screens/auth/sign_up.dart';
import 'package:saymymeds/app/views/screens/auth/verifiy_code.dart';

import 'package:saymymeds/app/views/screens/home/views/home_view.dart';
import 'package:saymymeds/app/views/screens/home/views/screens/SubscriptionCard/subscription_card.dart';
import 'package:saymymeds/app/views/screens/medications/view/medication.dart';
import 'package:saymymeds/app/views/screens/scan/image_scanner_screen.dart';
import 'package:saymymeds/app/views/screens/settings/view/edit_profile.dart';
import 'package:saymymeds/app/views/screens/settings/view/language_selection.dart';
import 'package:saymymeds/app/views/screens/settings/view/setting_page.dart';
import 'package:saymymeds/app/views/screens/splash/splash_screen.dart';
import 'package:saymymeds/app/views/screens/view_details/view_detils.dart';
import 'package:saymymeds/app/views/screens/welcome/weal_come_screen.dart';

class AppRoutes {
  static const String splashScreen = "/";
  static const String welcomeScreen = "/welcome";
  // auth start
  static const String siginIn = "/signin"; // /signin
  static const String forgetPasswordScreen = "/forgetPasswordScreen";
  static const String enterCode = "/enterCode";
  static const String newPassword = "/newPassword";
  static const String signUp = "/signUp";
  static const String bottomNav = "/bottomNav";
  static const String verifyCode = '/verifyCode';
  // home page
  static const String homeViewPage = "/homeViewPage";
  static const String medicineDetailPage = "/medicineDetailPage";
  static const String subscriptionCard = "/subscriptionCard";
  static const String settingPage = "/settingPage";
  static const String editProfile = "/editProfile";
  static const String languageSelection = "/languageSelection";

  static const String medication = "/medication";
  static const String imageScannerScreen = '/imageScannerScreen';

  ///////////////

  /* ------------------------------------------------------------------------------------------------------*/

  static final GoRouter router = GoRouter(
    initialLocation: splashScreen,
    routes: [
      //
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

      // GoRoute(
      //   path: forgetPasswordScreen,
      //   builder: (context, state) =>
      //       const ForgotPasswordScreen(), // fixed spelling
      // ),
      // // GoRoute(
      // //   path: enterCode, //
      // //   builder: (context, state) => const EnterCode(),
      // // ),

      // // In your app_routes.dart or routing file
      // GoRoute(
      //   path: enterCode, // e.g., '/enter-code'
      //   builder: (context, state) {
      //     // Handle both String and Map types for extra
      //     String? email;

      //     if (state.extra != null) {
      //       if (state.extra is String) {
      //         email = state.extra as String;
      //       } else if (state.extra is Map<String, dynamic>) {
      //         email = (state.extra as Map<String, dynamic>)['email'];
      //       }
      //     }

      //     return const EnterCode();
      //   },
      // ),
      // // GoRoute(
      // //   path: newPassword,
      // //   builder: (context, state) => const NewPassword(),
      // // ),
      // GoRoute(
      //   path: newPassword,
      //   builder: (context, state) {
      //     // ✅ Safely get the reset token from either .extra or ?token=
      //     final token =
      //         state.extra as String? ??
      //         state.uri.queryParameters['token'] ??
      //         '';
      //     print('GoRouter passed token: $token');
      //     return NewPassword(resetToken: token);
      //   },
      // ),

      // ✅ Step 1: Forgot Password Screen
      GoRoute(
        path: AppRoutes.forgetPasswordScreen, // '/forgotPassword'
        builder: (context, state) => const ForgotPasswordScreen(),
      ),

      // ✅ Step 2: Enter OTP Code Screen
      GoRoute(
        path: AppRoutes.enterCode, // '/enterCode'
        builder: (context, state) {
          // Get email from navigation
          String? email;

          if (state.extra != null) {
            if (state.extra is String) {
              email = state.extra as String;
            } else if (state.extra is Map<String, dynamic>) {
              email = (state.extra as Map<String, dynamic>)['email'];
            }
          }

          return const EnterCode();
        },
      ),

      // ✅ Step 3: Set New Password Screen
      GoRoute(
        path: AppRoutes.newPassword, // '/newPassword'
        builder: (context, state) {
          // Get reset_token from navigation
          final token =
              state.extra as String? ??
              state.uri.queryParameters['token'] ??
              '';

          print('🚀 GoRouter passed token to NewPassword: $token');

          return NewPassword(resetToken: token);
        },
      ),

      // sign up screen
      GoRoute(
        path: signUp, //  sa
        builder: (context, state) => const SignUp(),
      ),
      GoRoute(
        path: homeViewPage, //
        builder: (context, state) => HomeViewPage(),
      ),

      GoRoute(
        path: verifyCode,
        builder: (context, state) {
          String email = '';

          // Handle different types of extra data
          if (state.extra != null) {
            if (state.extra is String) {
              // If it's a String, use it directly
              email = state.extra as String;
            } else if (state.extra is Map) {
              // If it's a Map, extract the email key
              final map = state.extra as Map;
              email = map['email']?.toString() ?? '';
            }
          }

          // Debug print
          print("Email received in route: $email");

          return VerifyCode(email: email);
        },
      ),
      GoRoute(
        path: medicineDetailPage,
        builder: (context, state) => const MedicineDetailPage(),
      ),
      GoRoute(
        path: subscriptionCard,
        builder: (context, state) => const SubscriptionCard(),
      ),

      GoRoute(
        path: settingPage, //
        builder: (context, state) => SettingPage(),
      ),

      GoRoute(
        path: editProfile, //
        builder: (context, state) => EditProfile(),
      ),
      GoRoute(
        path: languageSelection,
        builder: (context, state) => LanguageSelection(),
      ),
      GoRoute(
        path: medication, //
        builder: (context, state) => Medication(),
      ),

      GoRoute(
        path: imageScannerScreen,
        builder: (context, state) => ImageScannerScreen(),
      ),
    ],
  );
}
