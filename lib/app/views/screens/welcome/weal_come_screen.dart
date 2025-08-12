import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/widgets/CustomButton/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🖼️ Top Image
              SizedBox(height: 20),
              SizedBox(
                height: 506,
                width: 500,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: -109,
                      child: Image.asset(
                        "assets/images/Hand_jar.png",
                        width: 633,
                        height: 509,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),

              // 📄 Text and Button Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Headline
                    Text(
                      "Identify Your Medication Instantly",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Description
                    Text(
                      "Scan any pill bottle or package with AI and get accurate details, dosage, and safety information right on your device.",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Get Started Button
                    CustomButton(
                      backgroundColor: AppColors.buttonColor,
                      text: "Get start",
                      onPressed: () {
                        // Your onPressed action here
                        context.go('/signin');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
