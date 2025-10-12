import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:http/http.dart' as http;
import 'package:saymymeds/app/core/app_routes/app_routes.dart';
import 'package:saymymeds/app/core/consants/api_constants.dart';
import 'package:saymymeds/app/utlies/storage_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  RxBool isCodeFilled = false.obs;

  /* log in start hree */
  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    // Validate inputs
    if (email.isEmpty || password.isEmpty) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Both Email and Password are required")),
        );
      }
      isLoading.value = false;
      return;
    }

    try {
      final url = Uri.parse(ApiConstants.login);

      final response = await http
          .post(
            url,
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/x-www-form-urlencoded",
            },
            body: {"email": email, "password": password},
          )
          .timeout(
            const Duration(seconds: 30),
            onTimeout: () {
              throw Exception('Connection timeout');
            },
          );

      // Validate response body before parsing
      if (response.body.isEmpty) {
        throw Exception('Empty response from server');
      }

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Save authentication data
        if (data['token'] != null) {
          await _saveAuthData(data['token'], data['user']);
        }

        if (!context.mounted) return;

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Login Successful ✅")));

        context.go(AppRoutes.homeViewPage);
      } else if (response.statusCode == 400 || response.statusCode == 401) {
        if (!context.mounted) return;

        final message = data["message"] ?? "Invalid credentials ❌";
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(message)));
      } else {
        if (!context.mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Server error (${response.statusCode}). Please try again!",
            ),
          ),
        );
      }
    } on SocketException {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("No internet connection ❌")));
    } on TimeoutException {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Connection timeout. Please try again ⏱️"),
        ),
      );
    } on FormatException {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Invalid server response")));
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
    } finally {
      isLoading.value = false;
    }
  }

  /* end  */
  Future<void> register({
    required BuildContext context, // ✅ add context
    required String name,
    required String email,
    required String password,
    required String password2,
  }) async {
    isLoading.value = true;
    final url = Uri.parse(ApiConstants.signup);

    try {
      final response = await http.post(
        url,
        headers: {"Accept": "application/json"},
        body: {
          "name": name,
          "email": email,
          "password": password,
          "password2": password2,
        },
      );

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      late Map<String, dynamic> data;
      try {
        data = jsonDecode(response.body);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid server response")),
        );
        return;
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Registration successful")),
        );

        // ✅ GoRouter navigation
        // ignore: use_build_context_synchronously
        context.push(AppRoutes.verifyCode, extra: {"email": email});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Server Error: ${response.statusCode}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    } finally {
      isLoading.value = false;
    }
  }

  /*  verify code start here*/

  Future<void> verifyOtp(BuildContext context, String email, String otp) async {
    try {
      // ✅ Validate inputs
      if (email.isEmpty) {
        _showSnackBar(context, "Email is required");
        return;
      }

      if (otp.isEmpty || otp.length != 6) {
        _showSnackBar(context, "Please enter a valid 6-digit OTP");
        return;
      }

      isLoading.value = true;
      print("🔹 Sending OTP verification for email: $email");
      print("🔹 OTP code: $otp");

      final response = await http.post(
        Uri.parse(ApiConstants.otpVerify),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: {"email": email.trim(), "otp": otp.trim()},
      );

      print("🔹 Response Status: ${response.statusCode}");
      print("🔹 Response Body: ${response.body}");

      if (response.statusCode == 200) {
        // ✅ Success Case
        final data = jsonDecode(response.body);
        print("✅ Decoded Data: $data");

        final bool status = data["status"] == true;

        if (status) {
          _showSnackBar(
            context,
            data["message"] ?? "OTP Verified Successfully",
            isSuccess: true,
          );

          // ✅ Save token if available
          final token = data["token"];
          if (token != null && token.toString().isNotEmpty) {
            await StorageHelper.saveToken(token.toString());
            print("🔐 Token saved: $token");
          }

          // ✅ Navigate to sign in
          if (context.mounted) {
            context.go(AppRoutes.siginIn);
          }
        } else {
          _showSnackBar(
            context,
            data["message"] ?? "Invalid OTP. Please try again.",
          );
        }
      } else if (response.statusCode == 400) {
        // ⚠️ Handle client-side or validation errors
        final errorData = jsonDecode(response.body);
        print("⚠️ Error Data: $errorData");

        String errorMessage =
            "Invalid request. Please check your email and OTP.";

        // Extract nested error message if present
        if (errorData["errors"] is Map &&
            errorData["errors"]["non_field_errors"] != null) {
          errorMessage = errorData["errors"]["non_field_errors"].join(", ");
        } else if (errorData["message"] != null) {
          errorMessage = errorData["message"];
        }

        _showSnackBar(context, errorMessage);

        // ✅ Redirect to Sign In if account already activated
        if (errorMessage.toLowerCase().contains("already activated")) {
          _showSnackBar(
            context,
            "Account is already activated. Please sign in.",
            isSuccess: true,
          );
          if (context.mounted) {
            context.go(AppRoutes.siginIn);
          }
        }
      } else if (response.statusCode == 404) {
        _showSnackBar(context, "OTP verification endpoint not found");
      } else {
        _showSnackBar(
          context,
          "Server Error: ${response.statusCode}. Please try again later.",
        );
      }
    } on http.ClientException catch (e) {
      print("🌐 Network Error: $e");
      _showSnackBar(context, "Network error. Please check your connection.");
    } on FormatException catch (e) {
      print("🧩 Format Error: $e");
      _showSnackBar(context, "Invalid response from server");
    } catch (e) {
      print("🔥 Unexpected Error: $e");
      _showSnackBar(context, "Something went wrong: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  /*  verify code end here*/
  /* resend code */
  Future<void> resendOtp(BuildContext context, String email) async {
    OverlayEntry? overlayEntry;

    try {
      // Show loading overlay
      overlayEntry = OverlayEntry(
        builder: (context) => Container(
          color: Colors.black54,
          child: const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ),
      );

      Overlay.of(context).insert(overlayEntry);

      final response = await http.post(
        Uri.parse(ApiConstants.resendOtp),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );

      // Remove loading overlay
      overlayEntry.remove();
      overlayEntry = null;

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                data['message'] ?? 'OTP has been resent to your email',
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 3),
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(16),
            ),
          );
        }
      } else if (response.statusCode == 400) {
        final errorData = jsonDecode(response.body);
        String errorMessage = 'Failed to resend OTP';

        if (errorData['errors'] != null) {
          final errors = errorData['errors'];
          if (errors['email'] != null && errors['email'].isNotEmpty) {
            errorMessage = errors['email'][0];
          } else if (errors['message'] != null) {
            errorMessage = errors['message'];
          }
        } else if (errorData['message'] != null) {
          errorMessage = errorData['message'];
        }

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                errorMessage,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.orange,
              duration: const Duration(seconds: 4),
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(16),
            ),
          );
        }
      } else {
        final errorData = jsonDecode(response.body);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                errorData['message'] ?? 'Failed to resend OTP',
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(16),
            ),
          );
        }
      }
    } catch (e) {
      // Remove loading overlay if still showing
      overlayEntry?.remove();

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Network error: Please check your connection',
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(16),
          ),
        );
      }
      print('Resend OTP Error: $e');
    }
  }

  /* resend end hre */

  /*  log in start here*/

  // Helper method to save authentication data
  Future<void> _saveAuthData(dynamic token, dynamic userData) async {
    final prefs = await SharedPreferences.getInstance();

    // Normalize token to a String safely (handles String or Map)
    String tokenStr = '';
    try {
      if (token == null) {
        tokenStr = '';
      } else if (token is String) {
        tokenStr = token;
      } else if (token is Map) {
        // common token keys returned by APIs
        tokenStr =
            (token['token'] ??
                    token['access'] ??
                    token['access_token'] ??
                    token['auth_token'])
                ?.toString() ??
            token.toString();
      } else {
        tokenStr = token.toString();
      }
    } catch (_) {
      tokenStr = token?.toString() ?? '';
    }

    if (tokenStr.isNotEmpty) {
      await prefs.setString('auth_token', tokenStr);
    } else {
      // remove existing saved token if nothing valid to save
      await prefs.remove('auth_token');
    }

    // Store user data as JSON string (if provided)
    if (userData != null) {
      final userJson = userData is String ? userData : jsonEncode(userData);
      await prefs.setString('user_data', userJson);
    } else {
      await prefs.remove('user_data');
    }
  }

  /*  log in end here*/

  /*  forgwt password satrt here  */

  /*
  Future<Map<String, dynamic>> resetPasswordOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final url = Uri.parse('$baseUrl/api/user/reset-password-otp/');
      
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'otp': otp,
        }),
      );
      
      final responseData = jsonDecode(response.body);
      
      if (response.statusCode == 200) {
        return {
          'success': true,
          'message': responseData['message'] ?? 'OTP verified successfully',
          'data': responseData,
        };
      } else {
        return {
          'success': false,
          'message': responseData['message'] ?? 'Failed to verify OTP',
          'error': responseData,
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'An error occurred: ${e.toString()}',
        'error': e.toString(),
      };
    }
  }
}

*/

  /*  forgwt password end  here  */

  /* set new password start here {{saymymeds}}accounts/user/set-new-password/ */

  /* set new password end  here {{saymymeds}}accounts/user/set-new-password/ */

  void _showSnackBar(
    BuildContext context,
    String message, {
    bool isSuccess = false,
  }) {
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isSuccess ? Colors.green : Colors.red,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

/*   Verifiy  code end here   */
