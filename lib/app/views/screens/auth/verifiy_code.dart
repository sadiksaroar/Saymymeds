import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/components/AppHeadingText/app_hedaing_text.dart';
import 'package:saymymeds/app/views/components/CustomButton/custom_button.dart';
import 'package:saymymeds/app/views/screens/auth/controller/auth_controller.dart';

class VerifyCode extends StatefulWidget {
  final String email;
  const VerifyCode({super.key, required this.email});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final AuthController otpController = Get.put(AuthController());

  // ✅ Add the missing variable declarations
  final TextEditingController otpTextController = TextEditingController();
  final otpCode = ''.obs; // RxString for OTP input
  final isCodeFilled = false.obs; // RxBool for button enable/disable

  @override
  void initState() {
    super.initState();
    // ✅ Debug: Check if email is properly received
    print("Received email in VerifyCode: ${widget.email}");
  }

  @override
  void dispose() {
    // ✅ Clean up the controller when the widget is disposed
    otpTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Center(child: AppHeadingText("Check your email")),
              const SizedBox(height: 30),

              // ✅ Show the email for debugging
              Text(
                "Verification code sent to: ${widget.email}",
                style: GoogleFonts.poppins(color: Colors.grey, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              /// OTP Pin Code Field
              FittedBox(
                fit: BoxFit.scaleDown,
                child: SizedBox(
                  width: screenWidth * 0.9,
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    controller: otpTextController,
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
                      otpCode.value = value;
                      isCodeFilled.value = value.length == 6;
                    },
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// Verify Button
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    onPressed: isCodeFilled.value
                        ? () {
                            // ✅ Debug: Print before calling verifyOtp
                            print(
                              "Sending OTP verification for email: ${widget.email}",
                            );
                            print("OTP code: ${otpTextController.text.trim()}");

                            otpController.verifyOtp(
                              context,
                              widget.email, // ✅ Use widget.email directly
                              otpTextController.text.trim(),
                            );
                          }
                        : null,
                    backgroundColor: isCodeFilled.value
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
