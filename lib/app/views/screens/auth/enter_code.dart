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

// GetX Controller for EnterCode
class EnterCodeController extends GetxController {
  final RxString otp = ''.obs;
  final RxBool isCodeFilled = false.obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  // ✅ Verify OTP and get reset_token
  Future<void> verifyCode(String email, BuildContext context) async {
    if (otp.value.length != 6) {
      errorMessage.value = 'Please enter a valid 6-digit OTP';
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await http.post(
        Uri.parse('http://10.10.7.24:8002/account/reset-password-otp/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'otp': otp.value}),
      );

      print('✅ Verify Response: Status ${response.statusCode}');
      print('✅ Response Body: ${response.body}');

      if (response.statusCode == 200) {
        // ✅ Extract reset_token from response
        final responseData = jsonDecode(response.body);
        final resetToken = responseData['reset_token'] as String?;

        print('🎫 Extracted reset_token: $resetToken');

        if (resetToken == null || resetToken.isEmpty) {
          errorMessage.value = 'Failed to get reset token from server';
          isLoading.value = false;
          return;
        }

        if (context.mounted) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('OTP verified successfully!'),
                backgroundColor: Colors.green,
              ),
            );

            // ✅ Navigate with reset_token
            print('🚀 Navigating to NewPassword with token: $resetToken');
            context.go('/newPassword', extra: resetToken);
          });
        }
      } else {
        String userError = _parseFastApiError(response.body);
        errorMessage.value = userError.isNotEmpty
            ? userError
            : 'Verification failed. Please try again.';

        if (context.mounted) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage.value),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          });
        }
      }
    } catch (e) {
      errorMessage.value = 'Network error. Please check your connection.';
      print('❌ Verify Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // ✅ Resend OTP
  Future<void> resendCode(String email, BuildContext context) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await http.post(
        Uri.parse('http://10.10.7.24:8002/account/send-reset-password-email/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );

      print('✅ Resend Response: Status ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        otp.value = '';
        isCodeFilled.value = false;

        if (context.mounted) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('New OTP sent to your email!'),
                backgroundColor: Colors.green,
              ),
            );
          });
        }
      } else {
        String userError = _parseFastApiError(response.body);
        errorMessage.value = userError.isNotEmpty
            ? userError
            : 'Failed to resend OTP. Please try again.';

        if (context.mounted) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage.value),
                backgroundColor: Colors.orange,
              ),
            );
          });
        }
      }
    } catch (e) {
      errorMessage.value = 'Network error. Please try again.';
      print('❌ Resend Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  String _parseFastApiError(String body) {
    try {
      final Map<String, dynamic> jsonBody = jsonDecode(body);

      if (jsonBody.containsKey('non_field_errors')) {
        final errors = jsonBody['non_field_errors'];
        if (errors is List && errors.isNotEmpty) {
          return errors.first.toString();
        }
      }

      if (jsonBody.containsKey('detail')) {
        final detail = jsonBody['detail'];
        if (detail is String) {
          return detail;
        } else if (detail is List && detail.isNotEmpty) {
          final firstError = detail.firstWhere(
            (e) => e['msg'] != null,
            orElse: () => null,
          );
          return firstError?['msg'] ?? 'Invalid request';
        }
      }

      for (var key in jsonBody.keys) {
        if (jsonBody[key] is List && (jsonBody[key] as List).isNotEmpty) {
          return '${key}: ${jsonBody[key][0]}';
        }
      }
    } catch (e) {
      print('❌ Error parsing API response: $e');
      return '';
    }
    return '';
  }

  void updateOtp(String value) {
    otp.value = value;
    isCodeFilled.value = value.length == 6;
    if (errorMessage.value.isNotEmpty) {
      errorMessage.value = '';
    }
  }
}

class EnterCode extends StatelessWidget {
  const EnterCode({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final controller = Get.put(EnterCodeController());

    // Get email from GoRouter
    final state = GoRouterState.of(context);
    String email = 'mytrek@gmail.com';

    if (state.extra != null) {
      if (state.extra is String) {
        email = state.extra as String;
      } else if (state.extra is Map<String, dynamic>) {
        email = (state.extra as Map<String, dynamic>)['email'] ?? email;
      }
    }

    print('📧 EnterCode received email: $email');

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
          onPressed: () => context.go('/signin'),
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

              // Resend code
              Obx(
                () => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Haven't got the email yet?",
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
                          : () => controller.resendCode(email, context),
                      child: Text(
                        "Resend code",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                          height: 1.5,
                          color: controller.isLoading.value
                              ? const Color(0xFF848484)
                              : const Color(0xFF4F85AA),
                        ),
                      ),
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
