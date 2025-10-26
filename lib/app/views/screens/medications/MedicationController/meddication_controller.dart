// import 'package:audioplayers/audioplayers.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:saymymeds/app/utlies/storage_helper.dart';
// import 'dart:convert';
// import 'package:saymymeds/app/views/screens/medications/data/model/medication_api_model.dart';

// class MedicationController extends GetxController {
//   static const String baseUrl = 'http://10.10.7.24:8002/api/core';

//   // Reactive variables
//   final medications = <Results>[].obs;
//   final isLoading = false.obs;
//   final searchQuery = ''.obs;
//   final selectedLanguage = 'en'.obs;
//   final isPlaying = false.obs;
//   final medicationId = 0.obs;
//   final languageCode = 'en'.obs;
//   final noteText = ''.obs;
//   final errorMessage = ''.obs;

//   late final AudioPlayer audioPlayer;
//   String authToken = '';

//   @override
//   void onInit() {
//     super.onInit();
//     audioPlayer = AudioPlayer();
//     _setupAudioListeners();
//     fetchMedications();
//   }

//   void _setupAudioListeners() {
//     audioPlayer.onPlayerStateChanged.listen((state) {
//       isPlaying.value = state == PlayerState.playing;
//     });

//     audioPlayer.onPlayerComplete.listen((_) {
//       isPlaying.value = false;
//     });
//   }

//   @override
//   void onClose() {
//     audioPlayer.dispose();
//     super.onClose();
//   }

//   void setAuthToken(String token) {
//     authToken = token;
//   }

//   Future<void> fetchMedications() async {
//     try {
//       isLoading.value = true;
//       errorMessage.value = '';

//       final token = await StorageHelper.getToken();
//       if (token == null) {
//         errorMessage.value = 'No authentication token found';
//         print('❌ ${errorMessage.value}');
//         return;
//       }

//       final response = await http
//           .get(
//             Uri.parse('$baseUrl/medications/?lang=${selectedLanguage.value}'),
//             headers: {
//               'Authorization': 'Bearer $token',
//               'Content-Type': 'application/json',
//             },
//           )
//           .timeout(
//             const Duration(seconds: 10),
//             onTimeout: () {
//               throw Exception('Request timeout');
//             },
//           );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final model = MedicationApiModel.fromJson(data);
//         medications.value =
//             model.results?.where((e) => e.id != null).toList() ?? [];
//         print('✅ Medications loaded: ${medications.length}');
//       } else {
//         throw Exception('Failed: ${response.statusCode}');
//       }
//     } catch (e) {
//       errorMessage.value = e.toString();
//       print('⚠️ Error: $e');
//       Get.snackbar('Error', 'Failed to load medications');
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<bool> deleteMedication(int medId) async {
//     try {
//       final token = await StorageHelper.getToken();
//       if (token == null) {
//         Get.snackbar('Error', 'No authentication token');
//         return false;
//       }

//       final response = await http.delete(
//         Uri.parse('$baseUrl/medications/$medId/'),
//         headers: {'Authorization': 'Bearer $token'},
//       );

//       if (response.statusCode == 200 || response.statusCode == 204) {
//         medications.removeWhere((med) => med.id == medId);
//         Get.snackbar('Success', 'Medication deleted');
//         print('✅ Medication deleted');
//         return true;
//       } else {
//         throw Exception('Failed: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('⚠️ Error: $e');
//       Get.snackbar('Error', 'Failed to delete medication');
//       return false;
//     }
//   }

//   String _buildAudioUrl() {
//     return '$baseUrl/audio/medication/${medicationId.value}/?lang=${languageCode.value}';
//   }

//   Future<void> toggleAudio() async {
//     try {
//       if (isPlaying.value) {
//         await audioPlayer.pause();
//       } else {
//         final audioUrl = _buildAudioUrl();
//         // The audioplayers package does not support headers in UrlSource.
//         await audioPlayer.play(UrlSource(audioUrl));
//       }
//     } catch (e) {
//       Get.snackbar('Error', 'Audio playback failed');
//       print('Error: $e');
//     }
//   }

//   Future<void> stopAudio() async {
//     try {
//       await audioPlayer.stop();
//       isPlaying.value = false;
//     } catch (e) {
//       print('Error stopping audio: $e');
//     }
//   }

//   List<Results> get filteredMedications {
//     if (searchQuery.value.isEmpty) return medications;
//     final query = searchQuery.value.toLowerCase();
//     return medications.where((med) {
//       return (med.genericName?.toLowerCase().contains(query) ?? false) ||
//           (med.brandName?.toLowerCase().contains(query) ?? false);
//     }).toList();
//   }

//   Future<void> changeLanguage(String lang) async {
//     selectedLanguage.value = lang;
//     languageCode.value = lang;
//     await fetchMedications();
//   }

//   void updateSearchQuery(String query) {
//     searchQuery.value = query;
//   }

//   void setMedicationId(int id) {
//     medicationId.value = id;
//   }

//   void updateNoteText(String note) {
//     noteText.value = note;
//   }
// }
//
//
//
//
//

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:saymymeds/app/core/consants/api_constants.dart';
import 'package:saymymeds/app/utlies/storage_helper.dart';
import 'dart:convert';
import 'package:saymymeds/app/views/screens/medications/data/model/medication_api_model.dart';

class MedicationController extends GetxController {
  static const String baseUrl = ApiConstants.baseUrl;
  static const String mediaBaseUrl = ApiConstants.baseUrl;

  // Reactive variables
  final medications = <Results>[].obs;
  final isLoading = false.obs;
  final searchQuery = ''.obs;
  final selectedLanguage = 'en'.obs;
  final isPlaying = false.obs;
  final medicationId = 0.obs;
  final languageCode = 'en'.obs;
  final noteText = ''.obs;
  final errorMessage = ''.obs;

  late final AudioPlayer audioPlayer;
  String authToken = '';

  @override
  void onInit() {
    super.onInit();
    audioPlayer = AudioPlayer();
    _setupAudioListeners();
    fetchMedications();
  }

  void _setupAudioListeners() {
    audioPlayer.onPlayerStateChanged.listen((state) {
      isPlaying.value = state == PlayerState.playing;
    });

    audioPlayer.onPlayerComplete.listen((_) {
      isPlaying.value = false;
    });
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }

  void setAuthToken(String token) {
    authToken = token;
  }

  /// ✅ Build proper image URL from relative path
  String _buildImageUrl(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return '';
    }

    final trimmedPath = imagePath.trim();

    // If already a complete URL, return as is
    if (trimmedPath.startsWith('http://') ||
        trimmedPath.startsWith('https://')) {
      return trimmedPath;
    }

    // Remove leading slash if exists
    final cleanPath = trimmedPath.startsWith('/')
        ? trimmedPath.substring(1)
        : trimmedPath;

    // Combine with media base URL (not API base URL)
    return '$mediaBaseUrl/$cleanPath';
  }

  /// ✅ Fetch Medications from API
  Future<void> fetchMedications() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final token = await StorageHelper.getToken();
      if (token == null) {
        errorMessage.value = 'No authentication token found';
        print('❌ ${errorMessage.value}');
        return;
      }

      final response = await http
          .get(
            Uri.parse('$baseUrl/medications/?lang=${selectedLanguage.value}'),
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
          )
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () {
              throw Exception('Request timeout');
            },
          );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final model = MedicationApiModel.fromJson(data);
        final results =
            model.results?.where((e) => e.id != null).toList() ?? [];

        // ✅ Fix relative image URL → absolute full path
        for (var med in results) {
          if (med.originalImage != null && med.originalImage!.isNotEmpty) {
            med.originalImage = _buildImageUrl(med.originalImage);
          } else {
            med.originalImage = null;
          }
        }

        medications.value = results;
        print('✅ Medications loaded: ${medications.length}');

        // Debug: print first medication's image URL
        if (medications.isNotEmpty) {
          print('🖼️ First med image URL: ${medications[0].originalImage}');
        }
      } else {
        throw Exception('Failed: ${response.statusCode}');
      }
    } catch (e) {
      errorMessage.value = e.toString();
      print('⚠️ Error: $e');
      Get.snackbar('Error', 'Failed to load medications');
    } finally {
      isLoading.value = false;
    }
  }

  /// ✅ Delete medication
  Future<bool> deleteMedication(int medId) async {
    try {
      final token = await StorageHelper.getToken();
      if (token == null) {
        Get.snackbar('Error', 'No authentication token');
        return false;
      }

      final response = await http.delete(
        Uri.parse('$baseUrl/medications/$medId/'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        medications.removeWhere((med) => med.id == medId);
        Get.snackbar('Success', 'Medication deleted');
        print('✅ Medication deleted');
        return true;
      } else {
        throw Exception('Failed: ${response.statusCode}');
      }
    } catch (e) {
      print('⚠️ Error: $e');
      Get.snackbar('Error', 'Failed to delete medication');
      return false;
    }
  }

  /// ✅ Build Audio URL
  String _buildAudioUrl() {
    return '$baseUrl/audio/medication/${medicationId.value}/?lang=${languageCode.value}';
  }

  /// ✅ Toggle Audio Play/Pause
  Future<void> toggleAudio() async {
    try {
      if (isPlaying.value) {
        await audioPlayer.pause();
      } else {
        final audioUrl = _buildAudioUrl();
        await audioPlayer.play(UrlSource(audioUrl));
      }
    } catch (e) {
      Get.snackbar('Error', 'Audio playback failed');
      print('Error: $e');
    }
  }

  /// ✅ Stop Audio
  Future<void> stopAudio() async {
    try {
      await audioPlayer.stop();
      isPlaying.value = false;
    } catch (e) {
      print('Error stopping audio: $e');
    }
  }

  /// ✅ Filtered medications by search
  List<Results> get filteredMedications {
    if (searchQuery.value.isEmpty) return medications;
    final query = searchQuery.value.toLowerCase();
    return medications.where((med) {
      return (med.genericName?.toLowerCase().contains(query) ?? false) ||
          (med.brandName?.toLowerCase().contains(query) ?? false);
    }).toList();
  }

  /// ✅ Change language and refetch data
  Future<void> changeLanguage(String lang) async {
    selectedLanguage.value = lang;
    languageCode.value = lang;
    await fetchMedications();
  }

  /// ✅ Simple setters
  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void setMedicationId(int id) {
    medicationId.value = id;
  }

  void updateNoteText(String note) {
    noteText.value = note;
  }
}
