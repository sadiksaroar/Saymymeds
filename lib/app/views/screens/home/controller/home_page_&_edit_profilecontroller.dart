// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:saymymeds/app/core/consants/api_constants.dart';
// import 'dart:convert';
// import 'package:saymymeds/app/utlies/storage_helper.dart';

// class HomePageEditProfilecontroller extends GetxController {
//   var name = ''.obs;
//   var email = ''.obs;
//   var image = ''.obs;
//   var isLoading = false.obs;

//   final String baseUrl = ApiConstants.baseUrl;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchProfile();
//   }

//   // ✅ Fetch profile data from API
//   Future<void> fetchProfile() async {
//     try {
//       isLoading.value = true;
//       String? token = await StorageHelper.getToken();

//       var headers = {'Authorization': 'Bearer $token'};

//       var response = await http.get(
//         Uri.parse('$baseUrl/account/profile/'),
//         headers: headers,
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         name.value = data['name'] ?? '';
//         email.value = data['email'] ?? '';
//         image.value = data['image'] ?? '';
//         print("✅ Profile Loaded: ${data['name']}");
//       } else {
//         print("❌ Error: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("❌ Exception: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // ✅ Update profile (supports image upload)
//   Future<bool> updateProfile({
//     required String newName,
//     String? newImage,
//   }) async {
//     try {
//       isLoading.value = true;
//       String? token = await StorageHelper.getToken();

//       var headers = {'Authorization': 'Bearer $token'};

//       var request = http.MultipartRequest(
//         'PATCH',
//         Uri.parse('$baseUrl/account/profile/'),
//       );

//       request.headers.addAll(headers);
//       request.fields['name'] = newName;

//       // Include image if user selected one
//       if (newImage != null && newImage.isNotEmpty) {
//         request.files.add(await http.MultipartFile.fromPath('image', newImage));
//       }

//       var response = await request.send();
//       var responseData = await http.Response.fromStream(response);

//       if (response.statusCode == 200) {
//         final data = jsonDecode(responseData.body);
//         name.value = data['name'] ?? newName;
//         email.value = data['email'] ?? '';
//         image.value = data['image'] ?? '';
//         print("✅ Profile Updated Successfully");

//         // Re-fetch updated info
//         await fetchProfile();

//         return true;
//       } else {
//         print("❌ Update Error: ${response.statusCode}");
//         print("Response: ${responseData.body}");
//         return false;
//       }
//     } catch (e) {
//       print("❌ Exception: $e");
//       return false;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // Shorten long names
//   String getTruncatedName(int maxLength) {
//     if (name.value.length > maxLength) {
//       return name.value.substring(0, maxLength) + '...';
//     }
//     return name.value;
//   }

//   // Full image URL
//   String getFullImageUrl() {
//     if (image.value.isEmpty) return '';
//     if (image.value.startsWith('http')) return image.value;
//     return '$baseUrl${image.value}';
//   }
// }
/*
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:saymymeds/app/core/consants/api_constants.dart';
import 'dart:convert';
import 'package:saymymeds/app/utlies/storage_helper.dart';

class HomePageEditProfilecontroller extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var image = ''.obs;
  var isLoading = false.obs;
  var preferredLanguage = 'en'.obs; // ✅ Track selected language

  final String baseUrl = ApiConstants.baseUrl;

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  // ✅ Fetch profile data from API
  Future<void> fetchProfile() async {
    try {
      isLoading.value = true;
      String? token = await StorageHelper.getToken();

      var headers = {'Authorization': 'Bearer $token'};

      var response = await http.get(
        Uri.parse('$baseUrl/account/profile/'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        name.value = data['name'] ?? '';
        email.value = data['email'] ?? '';
        image.value = data['image'] ?? '';

        // ✅ Get language preference from backend
        preferredLanguage.value = data['preferred_language'] ?? 'en';

        print("✅ Profile Loaded: ${data['name']}");
        print("✅ Language Preference: ${preferredLanguage.value}");
      } else {
        print("❌ Error: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ Exception: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // ✅ Update profile with language preference support
  Future<bool> updateProfile({
    required String newName,
    String? newImage,
    String? languageCode, // ✅ Add language parameter
  }) async {
    try {
      isLoading.value = true;
      String? token = await StorageHelper.getToken();

      var headers = {'Authorization': 'Bearer $token'};

      var request = http.MultipartRequest(
        'PATCH',
        Uri.parse('$baseUrl/account/profile/'),
      );

      request.headers.addAll(headers);
      request.fields['name'] = newName;

      // ✅ Send language to backend if provided
      if (languageCode != null && languageCode.isNotEmpty) {
        request.fields['preferred_language'] = languageCode;
        preferredLanguage.value = languageCode;
        print("📤 Sending language to backend: $languageCode");
      }

      // Include image if user selected one
      if (newImage != null && newImage.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath('image', newImage));
      }

      var response = await request.send();
      var responseData = await http.Response.fromStream(response);

      if (response.statusCode == 200) {
        final data = jsonDecode(responseData.body);
        name.value = data['name'] ?? newName;
        email.value = data['email'] ?? '';
        image.value = data['image'] ?? '';

        // ✅ Update language from response
        preferredLanguage.value =
            data['preferred_language'] ?? languageCode ?? 'en';

        print("✅ Profile Updated Successfully");
        print("✅ Language updated to: ${preferredLanguage.value}");

        // Re-fetch updated info to ensure sync
        await fetchProfile();

        return true;
      } else {
        print("❌ Update Error: ${response.statusCode}");
        print("Response: ${responseData.body}");
        return false;
      }
    } catch (e) {
      print("❌ Exception: $e");
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // Shorten long names
  String getTruncatedName(int maxLength) {
    if (name.value.length > maxLength) {
      return name.value.substring(0, maxLength) + '...';
    }
    return name.value;
  }

  // Full image URL
  String getFullImageUrl() {
    if (image.value.isEmpty) return '';
    if (image.value.startsWith('http')) return image.value;
    return '$baseUrl${image.value}';
  }
}
*/

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:saymymeds/app/core/consants/api_constants.dart';
import 'dart:convert';
import 'package:saymymeds/app/utlies/storage_helper.dart';
import 'package:flutter/material.dart';

class HomePageEditProfilecontroller extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var image = ''.obs;
  var isLoading = false.obs;
  var preferredLanguage = 'en'.obs; // ✅ Track selected language

  final String baseUrl = ApiConstants.baseUrl;

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  // ✅ Fetch profile data from API
  Future<void> fetchProfile() async {
    try {
      isLoading.value = true;
      String? token = await StorageHelper.getToken();
      var headers = {'Authorization': 'Bearer $token'};

      var response = await http.get(
        Uri.parse('$baseUrl/account/profile/'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        name.value = data['name'] ?? '';
        email.value = data['email'] ?? '';
        image.value = data['image'] ?? '';

        // ✅ Get language preference from backend
        preferredLanguage.value = data['preferred_language'] ?? 'en';

        // ✅ Update locale right after fetching
        final locale = _getLocaleFromCode(preferredLanguage.value);
        Get.updateLocale(locale);

        print("✅ Profile Loaded: ${data['name']}");
        print("✅ Language Preference: ${preferredLanguage.value}");
      } else {
        print("❌ Error: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ Exception: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // ✅ Update profile with language preference support
  Future<bool> updateProfile({
    required String newName,
    String? newImage,
    String? languageCode, // ✅ Add language parameter
  }) async {
    try {
      isLoading.value = true;
      String? token = await StorageHelper.getToken();
      var headers = {'Authorization': 'Bearer $token'};

      var request = http.MultipartRequest(
        'PATCH',
        Uri.parse('$baseUrl/account/profile/'),
      );

      request.headers.addAll(headers);
      request.fields['name'] = newName;

      // ✅ Send language to backend if provided
      if (languageCode != null && languageCode.isNotEmpty) {
        request.fields['preferred_language'] = languageCode;
        preferredLanguage.value = languageCode;
        print("📤 Sending language to backend: $languageCode");
      }

      if (newImage != null && newImage.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath('image', newImage));
      }

      var response = await request.send();
      var responseData = await http.Response.fromStream(response);

      if (response.statusCode == 200) {
        final data = jsonDecode(responseData.body);
        name.value = data['name'] ?? newName;
        email.value = data['email'] ?? '';
        image.value = data['image'] ?? '';
        preferredLanguage.value =
            data['preferred_language'] ?? languageCode ?? 'en';

        // ✅ Update locale instantly
        final locale = _getLocaleFromCode(preferredLanguage.value);
        Get.updateLocale(locale);

        print("✅ Profile Updated Successfully");
        print("✅ Language updated to: ${preferredLanguage.value}");
        return true;
      } else {
        print("❌ Update Error: ${response.statusCode}");
        print("Response: ${responseData.body}");
        return false;
      }
    } catch (e) {
      print("❌ Exception: $e");
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // ✅ Utility: Convert language code to Locale
  Locale _getLocaleFromCode(String code) {
    // ✅ Handle both 'zh' and 'zh-CN' consistently
    if (code == 'zh' || code == 'zh-CN') {
      return const Locale('zh', 'CN');
    }

    switch (code) {
      case 'es':
        return const Locale('es', 'ES');
      case 'fr':
        return const Locale('fr', 'FR');
      case 'pt':
        return const Locale('pt', 'BR');
      case 'ht':
        return const Locale('ht', 'HT');
      case 'ru':
        return const Locale('ru', 'RU');
      default:
        return const Locale('en', 'US');
    }
  }

  // ✅ Add this helper method in HomePageEditProfilecontroller
  String _normalizeLanguageCode(String code) {
    if (code == 'zh' || code == 'zh-CN') {
      return 'zh-CN'; // Always use 'zh-CN' internally
    }
    return code;
  }

  // ✅ Update fetchProfile method

  String getTruncatedName(int maxLength) {
    if (name.value.length > maxLength) {
      return name.value.substring(0, maxLength) + '...';
    }
    return name.value;
  }

  String getFullImageUrl() {
    if (image.value.isEmpty) return '';
    if (image.value.startsWith('http')) return image.value;
    return '$baseUrl${image.value}';
  }
}
