import 'package:http/http.dart' as http;
import 'package:saymymeds/app/utlies/storage_helper.dart';
import 'dart:convert';

import 'package:saymymeds/app/views/screens/medications/data/model/medication_api_model.dart';

class MedicationApiService {
  static const String baseUrl = 'http://10.10.7.24:8002/api/core/medications/';

  static Future<MedicationApiModel> getMedications() async {
    try {
      // StorageHelper থেকে token নিচ্ছি
      final token = await StorageHelper.getToken();

      if (token == null || token.isEmpty) {
        throw Exception('No authentication token found');
      }

      final response = await http.get(
        Uri.parse('$baseUrl?lang=en'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return MedicationApiModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized - Token expired');
      } else {
        throw Exception('Failed to load medications: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
