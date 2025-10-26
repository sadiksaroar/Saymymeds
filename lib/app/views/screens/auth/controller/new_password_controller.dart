import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:saymymeds/app/core/consants/api_constants.dart';

class NewPasswordController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // Define the base URL
  final String baseUrl = ApiConstants.baseUrl;

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
        Uri.parse(
          '$baseUrl/account/set-new-password/',
        ), // Use the baseUrl variable
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
