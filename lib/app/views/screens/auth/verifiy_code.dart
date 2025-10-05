import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/components/AppHeadingText/app_hedaing_text.dart';
import 'package:saymymeds/app/views/components/CustomButton/custom_button.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key, required String email});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  bool isCodeFilled = false;
  String otpCode = "";
  // final String email;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   toolbarHeight: 80,
      //   centerTitle: true,
      //   elevation: 0,
      //   title: Image.asset("assets/images/Logo 4.png", height: 83, width: 88),
      //   leading: IconButton(
      //     icon: Image.asset(
      //       "assets/icons/Back_Icon.png",
      //       height: 44,
      //       width: 44,
      //     ),
      //     onPressed: () {
      //       context.go(
      //         '/signin',
      //       ); // ✅ use go() instead of push() for proper navigation
      //     },
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Center(child: AppHeadingText("Check your email")),

              const SizedBox(height: 30),

              /// ===============================
              /// OTP Pin Code Field
              /// ===============================
              FittedBox(
                fit: BoxFit.scaleDown,
                child: SizedBox(
                  width: screenWidth * 0.9,
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(12),
                      fieldHeight: 60,
                      fieldWidth: 50,
                      inactiveFillColor: Colors.white,
                      activeFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      inactiveColor: Colors.grey.shade300,
                      activeColor: AppColors.primary,
                      selectedColor: AppColors.primary,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onChanged: (value) {
                      setState(() {
                        otpCode = value;
                        isCodeFilled = value.length == 6;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// ===============================
              /// Verify Button
              /// ===============================
              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                  onPressed: isCodeFilled
                      ? () {
                          // ✅ Call verify logic or navigate
                          context.go('/newPassword');
                        }
                      : null,
                  backgroundColor: isCodeFilled
                      ? AppColors.primary
                      : const Color(0x804F85AA),
                  borderRadius: 15,
                  child: Text(
                    "Verify Code",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// ===============================
              /// Resend Code Section
              /// ===============================
            ],
          ),
        ),
      ),
    );
  }
}
