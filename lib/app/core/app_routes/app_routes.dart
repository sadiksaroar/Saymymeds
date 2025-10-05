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
      GoRoute(
        path: forgetPasswordScreen,
        builder: (context, state) =>
            const ForgetPasswordScreen(), // fixed spelling
      ),
      GoRoute(
        path: enterCode, //
        builder: (context, state) => const EnterCode(),
      ),
      GoRoute(
        path: newPassword,
        builder: (context, state) => const NewPassword(),
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
        path: verifyCode, //
        builder: (context, state) => VerifyCode(email: ''),
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
