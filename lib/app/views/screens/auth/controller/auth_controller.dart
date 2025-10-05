import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:saymymeds/app/core/consants/api_constants.dart';
import 'package:saymymeds/app/views/screens/auth/verifiy_code.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  /*   regisetr */
  Future<void> register({
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
        body: {
          "name": name,
          "email": email,
          "password": password,
          "password2": password2,
        },
      );

      // Debug prints
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      Map<String, dynamic> data = {};
      try {
        data = jsonDecode(response.body);
      } catch (e) {
        print("Failed to parse JSON: $e");
      }

      if ((response.statusCode >= 201 && response.statusCode < 300)) {
        Get.snackbar("Success", data["msg"] ?? "Registration successful");

        Get.to(() => VerifyCode(email: email));
      } else {
        // Show error snackbar
        Get.snackbar(
          "error",
          data["message"] ?? "Registration failed",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      // Show any exception as error
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  /*   regisetr end  */

  /*   Verifiy  code start here   */
  Future<void> verifiyOtp(String email, String otp) async{
    try{
      isLoading.value =  true;
    final response = await http.post(Uri.parse(ApiConstants.otpVerify),
       headers: {"Accept": "application/json"},
       body: {"email": email, "otp": otp});
       if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        print(response.body);
       }
  }
  /*   Verifiy  code end here   */
}
