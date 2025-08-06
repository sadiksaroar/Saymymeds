import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // This replaces the get_connect import
import 'package:saymymeds/app/core/app_routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: Size(375, 812), // Example design size, adjust as needed
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig:
            AppRoutes.router, // Using the router configuration from AppRoutes
        title: 'Say My Meds', // Changed to your app name
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true, // Consider adding this for Material 3 design
        ),
      ),
    );
  }
}
