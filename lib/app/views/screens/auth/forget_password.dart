import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/components/AppHeadingText/app_hedaing_text.dart';
import 'package:saymymeds/app/views/components/AppSubtitleText/app_subtitle_text.dart';
import 'package:saymymeds/app/views/components/CustomButton/custom_button.dart';
import 'package:saymymeds/app/views/components/CustomTextField/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  bool isEmailFilled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {
        isEmailFilled = emailController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void onVerifyPressed() {
    final email = emailController.text.trim();

    if (email.isEmpty || !email.contains("@")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid email address")),
      );
      return;
    }

    // Navigate to next screen (enter code)
    context.go('/enterCode');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        centerTitle: true,
        elevation: 0,
        title: Image.asset("assets/images/Logo 4.png", height: 83, width: 88),
        leading: IconButton(
          icon: Image.asset(
            "assets/icons/Back_Icon.png",
            height: 44,
            width: 44,
          ),
          onPressed: () => context.go('/signin'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
                child: Center(child: AppHeadingText("Forgot Password")),
              ),
              const SizedBox(height: 8),
              const Text(
                "Provide the email linked to your account. We’ll send a password reset link to your inbox.",
                style: TextStyle(
                  color: Color(0xFF848484),
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  height: 1.5,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 24),

              // Email Field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSubtitleText('Email'),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hintText: "emilysm@gmail.com",
                    controller: emailController,
                    opatictyColor:
                        '', // keep empty string if required by your widget
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Verify Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                  onPressed: isEmailFilled ? onVerifyPressed : null,
                  backgroundColor: isEmailFilled
                      ? AppColors.primary
                      : const Color(0x804F85AA),
                  borderRadius: 15,
                  child: Text(
                    "Verify Code",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: const Color(0xFFF8F9FB),
                      fontWeight: FontWeight.w600,
                      height: 1.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
