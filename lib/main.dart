// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:saymymeds/app/core/app_routes/app_routes.dart';

// void main() => runApp(
//   DevicePreview(
//     enabled: !kReleaseMode,
//     builder: (context) => MyApp(), // Wrap your app
//   ),
// );
// // void main() {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
// //   runApp(MyApp());
// // }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       minTextAdapt: true,
//       splitScreenMode: true,
//       designSize: Size(375, 812), // Example design size, adjust as needed
//       child: MaterialApp.router(
//         debugShowCheckedModeBanner: false,
//         routerConfig:
//             AppRoutes.router, // Using the router configuration from AppRoutes
//         title: 'Say My Meds', // Changed to your app name
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true, // Consider adding this for Material 3 design
//         ),
//       ),
//     );
//   }
// }

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // ✅ GetX import
import 'package:saymymeds/app/core/app_routes/app_routes.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(), // Wrap your app
  ),
);

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812), // Example design size, adjust as needed
      child: GetMaterialApp.router(
        // ✅ Replaced with GetMaterialApp
        debugShowCheckedModeBanner: false,
        routerDelegate: AppRoutes.router.routerDelegate, // ✅ GetX + GoRouter
        routeInformationParser: AppRoutes.router.routeInformationParser,
        routeInformationProvider: AppRoutes.router.routeInformationProvider,
        title: 'Say My Meds',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
