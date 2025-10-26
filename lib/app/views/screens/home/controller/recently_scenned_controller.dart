import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:saymymeds/app/core/consants/api_constants.dart';
import 'package:saymymeds/app/utlies/storage_helper.dart';
import 'package:saymymeds/app/views/screens/home/model/recently_scanned_model.dart';
import 'dart:convert';

class RecentlyScannedController extends GetxController {
  static const String baseUrl = ApiConstants.baseUrl;
  static const String apiPath = '/api/core';

  var medicines = <Medication>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRecentlyScanned();
  }

  Future<void> fetchRecentlyScanned() async {
    try {
      isLoading(true);
      errorMessage('');

      final token = await StorageHelper.getToken();
      if (token == null) {
        errorMessage('No authentication token found');
        isLoading(false);
        return;
      }

      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final url = Uri.parse('$baseUrl$apiPath/medications');
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final recentlyScanned = RecentlyScanned.fromJson(jsonResponse);

        // ✅ Null-safe handling
        final results = recentlyScanned.results ?? [];

        if (results.isEmpty) {
          medicines.value = [];
        } else if (results.length > 3) {
          // ✅ Get last 3 medicines
          medicines.value = results.sublist(results.length - 3);
        } else {
          medicines.value = results;
        }

        medicines.refresh();
      } else {
        errorMessage('Failed to load medications: ${response.statusCode}');
      }
    } catch (e) {
      errorMessage('Error: $e');
      print('❌ Error fetching medications: $e');
    } finally {
      isLoading(false);
    }
  }
}
