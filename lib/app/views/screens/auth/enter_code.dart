// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:saymymeds/app/utlies/apps_color.dart';
// import 'package:saymymeds/app/views/components/AppHeadingText/app_hedaing_text.dart';
// import 'package:saymymeds/app/views/components/CustomButton/custom_button.dart';

// class EnterCode extends StatefulWidget {
//   const EnterCode({super.key});

//   @override
//   State<EnterCode> createState() => _EnterCodeState();
// }

// class _EnterCodeState extends State<EnterCode> {
//   bool isCodeFilled = false;

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         toolbarHeight: 80,
//         centerTitle: true,
//         title: Image.asset("assets/images/Logo 4.png", height: 83, width: 88),
//         leading: IconButton(
//           icon: Image.asset(
//             "assets/icons/Back_Icon.png",
//             height: 44,
//             width: 44,
//           ),
//           onPressed: () {
//             context.push('/signin');
//           },
//         ),
//         elevation: 0,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 20),
//               const Center(child: AppHeadingText("Check your email")),
//               const SizedBox(height: 20),
//               const Text(
//                 "We sent a reset link to mytrek@gmail.com. Enter the 6-digit code mentioned in the email.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Color(0xFF848484),
//                   fontFamily: 'Inter',
//                   fontWeight: FontWeight.w400,
//                   fontSize: 16.0,
//                   height: 1.5,
//                 ),
//               ),
//               const SizedBox(height: 30),

//               // Pin Code Field wrapped in FittedBox to avoid overflow
//               FittedBox(
//                 fit: BoxFit.scaleDown,
//                 child: SizedBox(
//                   width: screenWidth * 0.9, // 90% of screen width
//                   child: PinCodeTextField(
//                     appContext: context,
//                     length: 6,
//                     obscureText: false,
//                     animationType: AnimationType.fade,
//                     pinTheme: PinTheme(
//                       shape: PinCodeFieldShape.box,
//                       borderRadius: BorderRadius.circular(16),
//                       fieldHeight: 60,
//                       fieldWidth: 50,
//                       inactiveFillColor: Colors.white,
//                       activeFillColor: Colors.white,
//                       selectedFillColor: Colors.white,
//                       inactiveColor: Colors.grey.shade300,
//                       activeColor: Colors.blue,
//                       selectedColor: Colors.blue,
//                     ),
//                     animationDuration: const Duration(milliseconds: 300),
//                     enableActiveFill: true,
//                     onChanged: (value) {
//                       setState(() {
//                         isCodeFilled = value.length == 6;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),

//               // Verify Button
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: CustomButton(
//                   onPressed: isCodeFilled
//                       ? () {
//                           context.go('/newPassword');
//                         }
//                       : null,
//                   backgroundColor: isCodeFilled
//                       ? AppColors.primary
//                       : const Color(0x804F85AA),
//                   borderRadius: 15,
//                   child: Text(
//                     "Verify Code",
//                     style: GoogleFonts.poppins(
//                       color: Colors.white,
//                       fontSize: 24,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),

//               // Resend code section
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Text(
//                     "Haven’t got the email yet?",
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w400,
//                       fontSize: 16.0,
//                       height: 1.5,
//                       color: Color(0xFF848484),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   GestureDetector(
//                     onTap: () {
//                       // TODO: Add resend logic
//                     },
//                     child: const Text(
//                       "Resend code",
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w700,
//                         fontSize: 16.0,
//                         height: 1.5,
//                         color: Color(0xFF4F85AA),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/components/AppHeadingText/app_hedaing_text.dart';
import 'package:saymymeds/app/views/components/CustomButton/custom_button.dart';

// API Constants
class ApiConstants {
  static const String resetPasswordOtp =
      "http://10.10.7.24:8002/api/user/reset-password-otp/";
}

// GetX Controller for EnterCode
class EnterCodeController extends GetxController {
  final RxString otp = ''.obs;
  final RxBool isCodeFilled = false.obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  // Verify OTP function with FastAPI error parsing
  Future<void> verifyCode(String email, BuildContext context) async {
    if (otp.value.length != 6) {
      errorMessage.value = 'Please enter a valid 6-digit OTP';
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await http.post(
        Uri.parse(ApiConstants.resetPasswordOtp),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'otp': otp.value}),
      );

      print(
        'Verify Response: Status ${response.statusCode}, Body: ${response.body}',
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'OTP verified!');
        context.go('/newPassword');
      } else {
        String userError = _parseFastApiError(response.body);
        errorMessage.value = userError.isNotEmpty
            ? userError
            : 'Verification failed. Please try again.';
      }
    } catch (e) {
      errorMessage.value = 'Network error. Please check your connection.';
      print('Verify Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Resend OTP function
  Future<void> resendCode(String email) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await http.post(
        Uri.parse(ApiConstants.resetPasswordOtp),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );

      print(
        'Resend Response: Status ${response.statusCode}, Body: ${response.body}',
      );

      if (response.statusCode == 200) {
        errorMessage.value = 'OTP resent successfully. Check your email.';
        Get.snackbar('Success', 'New OTP sent!');
        otp.value = ''; // Clear OTP field
        isCodeFilled.value = false;
      } else {
        String userError = _parseFastApiError(response.body);
        errorMessage.value = userError.isNotEmpty
            ? userError
            : 'Failed to resend OTP. Please try again.';
      }
    } catch (e) {
      errorMessage.value = 'Network error. Please try again.';
      print('Resend Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Parse FastAPI error responses
  String _parseFastApiError(String body) {
    try {
      final Map<String, dynamic> jsonBody = jsonDecode(body);
      if (jsonBody.containsKey('detail')) {
        final detail = jsonBody['detail'];
        if (detail is String) {
          return detail; // e.g., "Invalid OTP"
        } else if (detail is List) {
          final firstError = detail.firstWhere(
            (e) => e['msg'] != null,
            orElse: () => null,
          );
          return firstError?['msg'] ?? 'Invalid request';
        }
      }
    } catch (e) {
      return '';
    }
    return '';
  }

  // Update OTP and check length
  void updateOtp(String value) {
    otp.value = value;
    isCodeFilled.value = value.length == 6;
    if (errorMessage.value.isNotEmpty)
      errorMessage.value = ''; // Clear error on input
  }
}

class EnterCode extends StatelessWidget {
  const EnterCode({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final controller = Get.put(EnterCodeController());
    final String email =
        Get.arguments?['email'] ??
        'mytrek@gmail.com'; // Dynamic email or fallback

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
              const SizedBox(height: 20),
              const Center(child: AppHeadingText("Check your email")),
              const SizedBox(height: 20),
              Text(
                "We sent a reset link to $email. Enter the 6-digit code mentioned in the email.",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF848484),
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 30),

              // Pin Code Field
              FittedBox(
                fit: BoxFit.scaleDown,
                child: SizedBox(
                  width: screenWidth * 0.9,
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(16),
                      fieldHeight: 60,
                      fieldWidth: 50,
                      inactiveFillColor: Colors.white,
                      activeFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      inactiveColor: Colors.grey.shade300,
                      activeColor: Colors.blue,
                      selectedColor: Colors.blue,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onChanged: controller.updateOtp,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Error Message
              Obx(
                () => controller.errorMessage.value.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          controller.errorMessage.value,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),

              // Verify Button
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    onPressed:
                        controller.isCodeFilled.value &&
                            !controller.isLoading.value
                        ? () => controller.verifyCode(email, context)
                        : null,
                    backgroundColor: controller.isCodeFilled.value
                        ? AppColors.primary
                        : const Color(0x804F85AA),
                    borderRadius: 15,
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            "Verify Code",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Resend code section
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Haven’t got the email yet?",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                      height: 1.5,
                      color: Color(0xFF848484),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: controller.isLoading.value
                        ? null
                        : () => controller.resendCode(email),
                    child: const Text(
                      "Resend code",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                        height: 1.5,
                        color: Color(0xFF4F85AA),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
