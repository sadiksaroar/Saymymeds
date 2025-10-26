// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:saymymeds/app/utlies/storage_helper.dart';

// class ProfileController extends GetxController {
//   var name = ''.obs;
//   var email = ''.obs;
//   var image = ''.obs;
//   var isLoading = false.obs;

//   final String baseUrl = "http://10.10.7.24:8002";

//   @override
//   void onInit() {
//     super.onInit();
//     fetchProfile();
//   }

//   // API থেকে Profile Data Fetch করা
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

//   // Profile Update করা
//   Future<bool> updateProfile({
//     required String newName,
//     required String? newImage,
//   }) async {
//     try {
//       isLoading.value = true;
//       String? token = await StorageHelper.getToken();

//       var headers = {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token',
//       };

//       var body = jsonEncode({"name": newName});

//       var response = await http.patch(
//         Uri.parse('$baseUrl/account/profile/'),
//         headers: headers,
//         body: body,
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         name.value = data['name'] ?? newName;
//         email.value = data['email'] ?? '';
//         image.value = data['image'] ?? '';
//         print("✅ Profile Updated Successfully");
//         return true;
//       } else {
//         print("❌ Update Error: ${response.statusCode}");
//         return false;
//       }
//     } catch (e) {
//       print("❌ Exception: $e");
//       return false;
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // Truncate Name করা (যদি বেশি লম্বা হয়)
//   String getTruncatedName(int maxLength) {
//     if (name.value.length > maxLength) {
//       return name.value.substring(0, maxLength) + '...';
//     }
//     return name.value;
//   }

//   // Full Image URL তৈরি করা
//   String getFullImageUrl() {
//     if (image.value.isEmpty) {
//       return '';
//     }
//     if (image.value.startsWith('http')) {
//       return image.value;
//     }
//     return '$baseUrl${image.value}';
//   }
// }

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:saymymeds/app/core/consants/api_constants.dart';
import 'dart:convert';
import 'package:saymymeds/app/utlies/storage_helper.dart';

class ProfileController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var image = ''.obs;
  var isLoading = false.obs;

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
        print("✅ Profile Loaded: ${data['name']}");
      } else {
        print("❌ Error: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ Exception: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // ✅ Update profile (supports image upload)
  Future<bool> updateProfile({
    required String newName,
    String? newImage,
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
        print("✅ Profile Updated Successfully");

        // Re-fetch updated info
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
