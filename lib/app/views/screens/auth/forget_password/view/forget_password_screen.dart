import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/components/AppHeadingText/app_hedaing_text.dart';
import 'package:saymymeds/app/views/components/AppSubtitleText/app_subtitle_text.dart';
import 'package:saymymeds/app/views/components/CustomButton/custom_button.dart';
import 'package:saymymeds/app/views/components/CustomTextField/custom_text_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        centerTitle: true,
        title: Image.asset("assets/images/Logo 4.png", height: 83, width: 88),
        leading: IconButton(
          icon: Image.asset(
            "assets/icons/Back_Icon.png",
            height: 44,
            width: 44,
          ),
          onPressed: () {
            context.push('/signin');
          },
        ),

        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
                height: 60,
                child: Center(child: AppHeadingText("Forget password")),
              ),
              const SizedBox(height: 8),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Provide the email linked to your account. We’ll send a password reset link to your inbox.",
                  style: TextStyle(
                    color: Color(0xFF848484),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400, // Regular
                    fontStyle: FontStyle.normal, // Regular is normal style
                    fontSize: 16.0,
                    height:
                        1.5, // line-height: 24px (height = line height / font size)
                    letterSpacing: 0.0, // 0px letter-spacing
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSubtitleText('Email'),
                  const SizedBox(height: 10),
                  CustomTextField(
                    // label: "Email",
                    // icon: Icons.email, // You need to specify an icon here
                    hintText: "emilysm@gmail.com",
                    controller: emailController,
                    opatictyColor: '', // Optional, only if needed
                  ),
                ],
              ),
              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                  onPressed: isEmailFilled
                      ? () {
                          context.go('/enterCode');
                        }
                      : null,
                  backgroundColor: isEmailFilled
                      ? AppColors.primary
                      : const Color(0x804F85AA),
                  borderRadius: 15,
                  child: Text(
                    "Verify code",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Color(0xFFF8F9FB),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      height: 1.0,
                      letterSpacing: 0.0,
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
