import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/widgets/AppHeadingText/app_hedaing_text.dart';
import 'package:saymymeds/app/widgets/AppSubtitleText/app_subtitle_text.dart';
import 'package:saymymeds/app/widgets/CustomButton/custom_button.dart';
import 'package:saymymeds/app/widgets/CustomTextField/custom_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool rememberMe = false;
  bool isPasswordVisible = false;

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
              Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: 250,
                      height: 60,
                      decoration: BoxDecoration(
                        // color: const Color(0xFF5B9BD5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(child: AppHeadingText("Sign Up")),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSubtitleText('Name'),
                  const SizedBox(height: 12),
                  CustomTextField(
                    // label: "Email",
                    // icon: Icons.email, // You need to specify an icon here
                    hintText: "Emily smith",
                    controller: nameController,
                    opatictyColor: '', // Optional, only if needed
                  ),
                  const SizedBox(height: 12),
                  const AppSubtitleText('Email'),
                  const SizedBox(height: 12),
                  CustomTextField(
                    // label: "Email",
                    // icon: Icons.email, // You need to specify an icon here
                    hintText: "emilysm@gmail.com",
                    controller: emailController,
                    opatictyColor: '', // Optional, only if needed
                  ),
                  const SizedBox(height: 12),
                  const AppSubtitleText('Password'),
                  const SizedBox(height: 12),
                  CustomTextField(
                    hintText: "*********",
                    controller: passwordController,
                    isPassword: true,
                    opatictyColor: '', // This enables suffixIcon toggle
                  ),
                  const SizedBox(height: 12),
                  const AppSubtitleText('Confirm Password'),
                  const SizedBox(height: 12),
                  CustomTextField(
                    hintText: "*********",
                    controller: confirmPasswordController,
                    isPassword: true,
                    opatictyColor: '', // This enables suffixIcon toggle
                  ),
                ],
              ),

              SizedBox(height: 25),

              CustomButton(
                backgroundColor: AppColors.buttonColor,
                text: "Sign up",
                onPressed: () {
                  // Your action here
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50, // adjust this width as needed
                    child: Divider(thickness: 0.8, color: Colors.grey),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "or",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    width: 50, // adjust this width as needed
                    child: Divider(thickness: 0.8, color: Colors.grey),
                  ),
                ],
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/Google.png", height: 70, width: 70),
                  const SizedBox(width: 16),
                  Image.asset("assets/icons/Apple.png", height: 70, width: 70),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
