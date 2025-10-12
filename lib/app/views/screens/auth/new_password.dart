// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:saymymeds/app/utlies/apps_color.dart';
// import 'package:saymymeds/app/views/components/AppSubtitleText/app_subtitle_text.dart';
// import 'package:saymymeds/app/views/screens/auth/congratulations_popup.dart';
// import 'package:saymymeds/app/views/components/AppHeadingText/app_hedaing_text.dart';
// import 'package:saymymeds/app/views/components/CustomButton/custom_button.dart';
// import 'package:saymymeds/app/views/components/CustomTextField/custom_text_field.dart';
// // import 'CongratulationsPopup.dart'; // Import the CongratulationsPopup class

// class NewPassword extends StatefulWidget {
//   const NewPassword({super.key});

//   @override
//   State<NewPassword> createState() => _NewPasswordState();
// }

// class _NewPasswordState extends State<NewPassword> {
//   final TextEditingController newPasswordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();

//   @override
//   Widget build(BuildContext context) {
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
//               Column(
//                 children: [
//                   Center(
//                     child: Container(
//                       width: 805,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       child: Center(child: AppHeadingText("Set new password")),
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   Center(
//                     child: Container(
//                       width: 805,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       child: Center(
//                         child: Text(
//                           "Please enter a new password and re-enter to confirm.",
//                           style: TextStyle(
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w400,
//                             fontSize: 18.0,
//                             color: Color(0xFF848484),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                 ],
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const AppSubtitleText('New Password'),
//                   SizedBox(height: 10),
//                   CustomTextField(
//                     hintText: "*********",
//                     controller: newPasswordController,
//                     isPassword: true,
//                     opatictyColor: '',
//                   ),
//                 ],
//               ),
//               SizedBox(height: 25),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const AppSubtitleText('Confirm Password'),
//                   SizedBox(height: 10),
//                   CustomTextField(
//                     hintText: "*********",
//                     controller: confirmPasswordController,
//                     isPassword: true,
//                     opatictyColor: '',
//                   ),
//                 ],
//               ),
//               SizedBox(height: 25),
//               CustomButton(
//                 backgroundColor: AppColors.buttonColor,
//                 text: "Continue",
//                 onPressed: () => CongratulationsPopup.show(context),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/components/AppSubtitleText/app_subtitle_text.dart';
import 'package:saymymeds/app/views/screens/auth/congratulations_popup.dart';
import 'package:saymymeds/app/views/components/AppHeadingText/app_hedaing_text.dart';
import 'package:saymymeds/app/views/components/CustomButton/custom_button.dart';
import 'package:saymymeds/app/views/components/CustomTextField/custom_text_field.dart';

class NewPasswordController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<bool> setNewPassword({
    required String resetToken,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await http.post(
        Uri.parse('http://10.10.7.24:8002/accounts/user/set-new-password/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'reset_token': resetToken,
          'new_password': newPassword,
          'new_password2': confirmPassword,
        }),
      );

      isLoading.value = false;

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        final responseData = jsonDecode(response.body);
        errorMessage.value =
            responseData['message'] ?? 'Failed to reset password';
        return false;
      }
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = 'Network error: ${e.toString()}';
      return false;
    }
  }
}

class NewPassword extends StatefulWidget {
  final String? resetToken; // Optional, can be passed from previous screen

  const NewPassword({super.key, this.resetToken});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final NewPasswordController controller = Get.put(NewPasswordController());

  String? _resetToken;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Get reset token from route arguments or widget parameter
    final routeState = GoRouterState.of(context);
    _resetToken =
        widget.resetToken ??
        routeState.extra as String? ??
        routeState.uri.queryParameters['token'];
  }

  void _handlePasswordReset() async {
    // Call API
    final success = await controller.setNewPassword(
      resetToken: _resetToken ?? '',
      newPassword: newPasswordController.text,
      confirmPassword: confirmPasswordController.text,
    );

    if (success) {
      CongratulationsPopup.show(context);
    }
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
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
              Column(
                children: [
                  Center(
                    child: Container(
                      width: 805,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(child: AppHeadingText("Set new password")),
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Container(
                      width: 805,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          "Please enter a new password and re-enter to confirm.",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 18.0,
                            color: Color(0xFF848484),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSubtitleText('New Password'),
                  SizedBox(height: 10),
                  CustomTextField(
                    hintText: "*********",
                    controller: newPasswordController,
                    isPassword: true,
                    opatictyColor: '',
                  ),
                ],
              ),
              SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSubtitleText('Confirm Password'),
                  SizedBox(height: 10),
                  CustomTextField(
                    hintText: "*********",
                    controller: confirmPasswordController,
                    isPassword: true,
                    opatictyColor: '',
                  ),
                ],
              ),
              SizedBox(height: 25),
              // Wrapped CustomButton with Obx for reactive UI
              Obx(
                () => controller.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.buttonColor,
                        ),
                      )
                    : CustomButton(
                        backgroundColor: AppColors.buttonColor,
                        text: "Continue",
                        onPressed: _handlePasswordReset,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/components/AppSubtitleText/app_subtitle_text.dart';
import 'package:saymymeds/app/views/screens/auth/congratulations_popup.dart';
import 'package:saymymeds/app/views/components/AppHeadingText/app_hedaing_text.dart';
import 'package:saymymeds/app/views/components/CustomButton/custom_button.dart';
import 'package:saymymeds/app/views/components/CustomTextField/custom_text_field.dart';

class NewPasswordController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // Save token to SharedPreferences
  Future<void> saveResetToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('reset_token', token);
      print('✅ Token saved to SharedPreferences: $token');
    } catch (e) {
      print('❌ Error saving token: $e');
    }
  }

  // Get token from SharedPreferences
  Future<String?> getResetToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('reset_token');
      print('📱 Token from SharedPreferences: $token');
      return token;
    } catch (e) {
      print('❌ Error getting token: $e');
      return null;
    }
  }

  // Clear token from SharedPreferences
  Future<void> clearResetToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('reset_token');
      print('🗑️ Token cleared from SharedPreferences');
    } catch (e) {
      print('❌ Error clearing token: $e');
    }
  }

  Future<bool> setNewPassword({
    required String resetToken,
    required String newPassword,
    required String confirmPassword,
  }) async {
    // Clear previous error
    errorMessage.value = '';

    if (resetToken.isEmpty) {
      errorMessage.value = 'Reset token is missing';
      return false;
    }
    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      errorMessage.value = 'Password fields cannot be empty';
      return false;
    }
    if (newPassword != confirmPassword) {
      errorMessage.value = 'Passwords do not match';
      return false;
    }

    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse('http://10.10.7.24:8002/accounts/user/set-new-password/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'reset_token': resetToken,
          'new_password': newPassword,
          'new_password2': confirmPassword,
        }),
      );

      isLoading.value = false;

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Clear token after successful password reset
        await clearResetToken();
        return true;
      } else {
        final responseData = jsonDecode(response.body);
        errorMessage.value =
            responseData['message'] ?? 'Failed to reset password';
        return false;
      }
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = 'Network error: ${e.toString()}';
      return false;
    }
  }
}

class NewPassword extends StatefulWidget {
  final String? resetToken;

  const NewPassword({super.key, this.resetToken});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final NewPasswordController controller = Get.put(NewPasswordController());

  String _resetToken = '';

  @override
  void initState() {
    super.initState();
    print('🚀 initState called');
    print('🎫 Widget resetToken: ${widget.resetToken}');
    _initializeToken();
  }

  Future<void> _initializeToken() async {
    String? token;

    // Step 1: Check widget parameter
    if (widget.resetToken != null && widget.resetToken!.isNotEmpty) {
      token = widget.resetToken!;
      print('✅ Token from widget: $token');
    }
    // Step 2: Check SharedPreferences
    else {
      token = await controller.getResetToken();
      if (token != null && token.isNotEmpty) {
        print('✅ Token from SharedPreferences: $token');
      }
    }

    if (token != null && token.isNotEmpty) {
      setState(() {
        _resetToken = token!;
      });
      // Save to SharedPreferences for future use
      await controller.saveResetToken(token);
    } else {
      print('⚠️ No token found in widget or SharedPreferences');
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('🔄 didChangeDependencies called');

    // Only try to get from route if we don't have a token yet
    if (_resetToken.isEmpty) {
      try {
        final routeState = GoRouterState.of(context);

        // Check extra first
        if (routeState.extra != null) {
          final extraToken = routeState.extra as String?;
          if (extraToken != null && extraToken.isNotEmpty) {
            print('✅ Token from routeState.extra: $extraToken');
            setState(() {
              _resetToken = extraToken;
            });
            controller.saveResetToken(extraToken);
            return;
          }
        }

        // Check query parameters
        final queryToken = routeState.uri.queryParameters['token'];
        if (queryToken != null && queryToken.isNotEmpty) {
          print('✅ Token from query params: $queryToken');
          setState(() {
            _resetToken = queryToken;
          });
          controller.saveResetToken(queryToken);
          return;
        }

        print('⚠️ No token in route state');
      } catch (e) {
        print('❌ Error getting token from route: $e');
      }
    }
  }

  void _handlePasswordReset() async {
    print('🔐 Password reset button pressed');
    print('🎫 Current token: $_resetToken');

    // Clear previous errors
    controller.errorMessage.value = '';

    // Validate passwords first
    if (newPasswordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      controller.errorMessage.value = 'Password fields cannot be empty';
      return;
    }

    if (newPasswordController.text != confirmPasswordController.text) {
      controller.errorMessage.value = 'Passwords do not match';
      return;
    }

    // Check for token - try SharedPreferences one more time
    String? finalToken = _resetToken;
    if (finalToken.isEmpty) {
      finalToken = await controller.getResetToken();
      if (finalToken != null && finalToken.isNotEmpty) {
        setState(() {
          _resetToken = finalToken!;
        });
      }
    }

    if (finalToken == null || finalToken.isEmpty) {
      controller.errorMessage.value =
          'Reset token is missing. Please request a new password reset link.';
      print('❌ Token is empty, cannot proceed');
      return;
    }

    print('✅ Proceeding with token: $finalToken');

    final success = await controller.setNewPassword(
      resetToken: finalToken,
      newPassword: newPasswordController.text,
      confirmPassword: confirmPasswordController.text,
    );

    if (success && mounted) {
      CongratulationsPopup.show(context);
      // Navigate to signin after a short delay
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          context.go('/signin');
        }
      });
    }
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
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
            context.go('/signin');
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
                children: [
                  Center(child: AppHeadingText("Set new password")),
                  const SizedBox(height: 15),
                  Center(
                    child: Text(
                      "Please enter a new password and re-enter to confirm.",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0,
                        color: Color(0xFF848484),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Debug info (remove in production)
                  if (_resetToken.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        '✅ Token loaded',
                        style: TextStyle(color: Colors.green, fontSize: 12),
                      ),
                    ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSubtitleText('New Password'),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hintText: "*********",
                    controller: newPasswordController,
                    isPassword: true,
                    opatictyColor: '',
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSubtitleText('Confirm Password'),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hintText: "*********",
                    controller: confirmPasswordController,
                    isPassword: true,
                    opatictyColor: '',
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Obx(
                () => Column(
                  children: [
                    if (controller.errorMessage.value.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          controller.errorMessage.value,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    controller.isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.buttonColor,
                            ),
                          )
                        : CustomButton(
                            backgroundColor: AppColors.buttonColor,
                            text: "Continue",
                            onPressed: _handlePasswordReset,
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


*/

/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/components/AppSubtitleText/app_subtitle_text.dart';
import 'package:saymymeds/app/views/screens/auth/congratulations_popup.dart';
import 'package:saymymeds/app/views/components/AppHeadingText/app_hedaing_text.dart';
import 'package:saymymeds/app/views/components/CustomButton/custom_button.dart';
import 'package:saymymeds/app/views/components/CustomTextField/custom_text_field.dart';

// ================= Controller ==================
class NewPasswordController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<bool> setNewPassword({
    required String resetToken,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      print('Sending request to API...');
      print('Reset Token: $resetToken');
      print('New Password Length: ${newPassword.length}');

      final response = await http.post(
        Uri.parse('http://10.10.7.24:8002/account/set-new-password/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'reset_token': resetToken,
          'new_password': newPassword,
          'new_password2': confirmPassword,
        }),
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      isLoading.value = false;

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        try {
          final responseData = jsonDecode(response.body);
          if (responseData is Map) {
            errorMessage.value =
                responseData['message'] ??
                responseData['error'] ??
                responseData['detail'] ??
                responseData['non_field_errors']?.toString() ??
                'Failed to reset password';
            print('Error from API: $responseData');
          } else {
            errorMessage.value = 'Failed to reset password';
          }
        } catch (e) {
          errorMessage.value = 'Failed to reset password: ${response.body}';
        }
        return false;
      }
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = 'Network error: ${e.toString()}';
      print('Exception occurred: ${e.toString()}');
      return false;
    }
  }
}

// ================= Screen ==================
class NewPassword extends StatefulWidget {
  final String? resetToken; // Passed from GoRouter

  const NewPassword({super.key, this.resetToken});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final NewPasswordController controller = Get.put(NewPasswordController());

  late final String resetToken; // ✅ Use final token, not Get

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // ✅ Get token without using Get
    final GoRouterState routeState = GoRouterState.of(context);

    resetToken =
        widget.resetToken ??
        routeState.extra as String? ??
        routeState.uri.queryParameters['token'] ??
        '';

    print('✅ Final Reset Token: $resetToken');
  }

  void _handlePasswordReset() async {
    if (resetToken.isEmpty) {
      Get.snackbar('Error', 'Reset token is missing or invalid.');
      return;
    }

    final success = await controller.setNewPassword(
      resetToken: resetToken,
      newPassword: newPasswordController.text.trim(),
      confirmPassword: confirmPasswordController.text.trim(),
    );

    if (success) {
      CongratulationsPopup.show(context);
    } else {
      Get.snackbar('Error', controller.errorMessage.value);
    }
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
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
              Column(
                children: [
                  Center(
                    child: Container(
                      width: 805,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(child: AppHeadingText("Set new password")),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Container(
                      width: 805,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Text(
                          "Please enter a new password and re-enter to confirm.",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 18.0,
                            color: Color(0xFF848484),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSubtitleText('New Password'),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hintText: "*********",
                    controller: newPasswordController,
                    isPassword: true,
                    opatictyColor: '',
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSubtitleText('Confirm Password'),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hintText: "*********",
                    controller: confirmPasswordController,
                    isPassword: true,
                    opatictyColor: '',
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Obx(
                () => controller.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.buttonColor,
                        ),
                      )
                    : CustomButton(
                        backgroundColor: AppColors.buttonColor,
                        text: "Continue",
                        onPressed: _handlePasswordReset,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:saymymeds/app/core/app_routes/app_routes.dart';
import 'dart:convert';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/components/AppSubtitleText/app_subtitle_text.dart';
import 'package:saymymeds/app/views/screens/auth/congratulations_popup.dart';
import 'package:saymymeds/app/views/components/AppHeadingText/app_hedaing_text.dart';
import 'package:saymymeds/app/views/components/CustomButton/custom_button.dart';
import 'package:saymymeds/app/views/components/CustomTextField/custom_text_field.dart';

class NewPasswordController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // ✅ Set new password with reset_token
  Future<bool> setNewPassword({
    required String resetToken,
    required String newPassword,
    required String confirmPassword,
  }) async {
    errorMessage.value = '';

    if (resetToken.isEmpty) {
      errorMessage.value = 'Reset token is missing';
      return false;
    }
    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      errorMessage.value = 'Password fields cannot be empty';
      return false;
    }
    if (newPassword != confirmPassword) {
      errorMessage.value = 'Passwords do not match';
      return false;
    }

    try {
      isLoading.value = true;

      print('🔐 Sending password reset request...');
      print('🎫 Token: $resetToken');

      // ✅ Correct API endpoint
      final response = await http.post(
        Uri.parse('http://10.10.7.24:8002/account/set-new-password/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'reset_token': resetToken,
          'new_password': newPassword,
          'new_password2': confirmPassword,
        }),
      );

      print('✅ Response Status: ${response.statusCode}');
      print('✅ Response Body: ${response.body}');

      isLoading.value = false;

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        final responseData = jsonDecode(response.body);

        // Handle different error formats
        if (responseData.containsKey('non_field_errors')) {
          final errors = responseData['non_field_errors'];
          if (errors is List && errors.isNotEmpty) {
            errorMessage.value = errors.first.toString();
          }
        } else if (responseData.containsKey('detail')) {
          errorMessage.value = responseData['detail'].toString();
        } else if (responseData.containsKey('message')) {
          errorMessage.value = responseData['message'].toString();
        } else {
          errorMessage.value = 'Failed to reset password';
        }

        return false;
      }
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = 'Network error: ${e.toString()}';
      print('❌ Error: $e');
      return false;
    }
  }
}

class NewPassword extends StatefulWidget {
  final String? resetToken;

  const NewPassword({super.key, this.resetToken});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final NewPasswordController controller = Get.put(NewPasswordController());

  String _resetToken = '';

  @override
  void initState() {
    super.initState();
    print('🚀 NewPassword initState');

    // Get token from widget parameter
    if (widget.resetToken != null && widget.resetToken!.isNotEmpty) {
      _resetToken = widget.resetToken!;
      print('✅ Token from widget: $_resetToken');
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('🔄 NewPassword didChangeDependencies');

    // Only get from route if we don't have token yet
    if (_resetToken.isEmpty) {
      try {
        final routeState = GoRouterState.of(context);

        // Check extra parameter
        if (routeState.extra != null && routeState.extra is String) {
          final token = routeState.extra as String;
          if (token.isNotEmpty) {
            setState(() {
              _resetToken = token;
            });
            print('✅ Token from routeState.extra: $_resetToken');
            return;
          }
        }

        // Check query parameters
        final queryToken = routeState.uri.queryParameters['token'];
        if (queryToken != null && queryToken.isNotEmpty) {
          setState(() {
            _resetToken = queryToken;
          });
          print('✅ Token from query params: $_resetToken');
          return;
        }

        print('⚠️ No token found in route');
      } catch (e) {
        print('❌ Error getting token from route: $e');
      }
    }
  }

  void _handlePasswordReset() async {
    print('🔐 Password reset initiated');
    print('🎫 Current token: $_resetToken');

    controller.errorMessage.value = '';

    // Validate passwords
    if (newPasswordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      controller.errorMessage.value = 'Password fields cannot be empty';
      return;
    }

    if (newPasswordController.text != confirmPasswordController.text) {
      controller.errorMessage.value = 'Passwords do not match';
      return;
    }

    // Check token
    if (_resetToken.isEmpty) {
      controller.errorMessage.value =
          'Reset token is missing. Please request a new password reset link.';
      print('❌ Token is empty');
      return;
    }

    print('✅ Proceeding with password reset');

    final success = await controller.setNewPassword(
      resetToken: _resetToken,
      newPassword: newPasswordController.text,
      confirmPassword: confirmPasswordController.text,
    );

    if (success && mounted) {
      print('✅ Password reset successful');
      CongratulationsPopup.show(context);

      // Navigate to signin
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          context.go(AppRoutes.siginIn);
        }
      });
    } else {
      print('❌ Password reset failed: ${controller.errorMessage.value}');
    }
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
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
              Column(
                children: [
                  const Center(child: AppHeadingText("Set new password")),
                  const SizedBox(height: 15),
                  const Center(
                    child: Text(
                      "Please enter a new password and re-enter to confirm.",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0,
                        color: Color(0xFF848484),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSubtitleText('New Password'),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hintText: "*********",
                    controller: newPasswordController,
                    isPassword: true,
                    opatictyColor: '',
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSubtitleText('Confirm Password'),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hintText: "*********",
                    controller: confirmPasswordController,
                    isPassword: true,
                    opatictyColor: '',
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Obx(
                () => Column(
                  children: [
                    if (controller.errorMessage.value.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          controller.errorMessage.value,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    controller.isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.buttonColor,
                            ),
                          )
                        : CustomButton(
                            backgroundColor: AppColors.buttonColor,
                            text: "Continue",
                            onPressed: _handlePasswordReset,
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
