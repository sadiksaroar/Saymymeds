import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:saymymeds/app/core/app_routes/app_routes.dart';

// // void main() => runApp(
// //   DevicePreview(
// //     enabled: !kReleaseMode,
// //     builder: (context) => const MyApp(), // Wrap your app
// //   ),
// // );

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       minTextAdapt: true,
//       splitScreenMode: true,
//       designSize: const Size(375, 812), // Example design size, adjust as needed
//       child: GetMaterialApp.router(
//         // ✅ Replaced with GetMaterialApp
//         debugShowCheckedModeBanner: false,
//         routerDelegate: AppRoutes.router.routerDelegate, //  GetX + GoRouter
//         routeInformationParser: AppRoutes.router.routeInformationParser,
//         routeInformationProvider: AppRoutes.router.routeInformationProvider,
//         title: 'Say My Meds',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//       ),
//     );
//   }
// }

import 'package:get/get.dart';
import 'package:saymymeds/app/views/multi_langus/app_transle.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(), // Wrap your app
  ),
);

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      child: GetMaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: AppRoutes.router.routerDelegate,
        routeInformationParser: AppRoutes.router.routeInformationParser,
        routeInformationProvider: AppRoutes.router.routeInformationProvider,
        title: 'Say My Meds',
        // ✅ এই দুটি লাইন যোগ করুন
        translations: AppTranslations(), // ট্রান্সলেশন ক্লাস
        locale: Get.deviceLocale, // ডিভাইস ল্যাঙ্গুয়েজ সেট করুন
        fallbackLocale: const Locale('en', 'US'), // ডিফল্ট ল্যাঙ্গুয়েজ
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
