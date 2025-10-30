// import 'package:audioplayers/audioplayers.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:saymymeds/app/core/consants/api_constants.dart';
// import 'package:saymymeds/app/utlies/storage_helper.dart';
// import 'dart:convert';
// import 'package:saymymeds/app/views/screens/medications/controler/model/medication_api_model.dart';

// class MedicationController extends GetxController {
//   static const String baseUrl = ApiConstants.baseUrl + '/api/core';
//   String mediaBaseUrlForImages = ApiConstants.baseUrl;

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

//   String _buildImageUrl(String? imagePath) {
//     if (imagePath == null || imagePath.isEmpty) {
//       return ''; // Return an empty string if the image path is invalid
//     }

//     final trimmedPath = imagePath.trim();

//     // If the path is already a full URL (starts with http:// or https://), return as is
//     if (trimmedPath.startsWith('http://') ||
//         trimmedPath.startsWith('https://')) {
//       return trimmedPath;
//     }

//     // If the path is relative, prepend the base URL
//     final cleanPath = trimmedPath.startsWith('/')
//         ? trimmedPath.substring(1) // Remove leading slash
//         : trimmedPath;

//     // Here we assume the base URL for your media files is 'http://10.10.7.24:8002/media/'
//     return '$mediaBaseUrlForImages$cleanPath';
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

//       print('API Response: ${response.body}'); // Log the API response

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final model = MedicationApiModel.fromJson(data);

//         if (model.results != null && model.results!.isNotEmpty) {
//           // Fix image URLs
//           for (var med in model.results!) {
//             med.originalImage = _buildImageUrl(med.originalImage);
//           }
//           medications.value = model.results!;
//           print('✅ Medications loaded: ${medications.length}');
//         } else {
//           errorMessage.value = 'No medications available';
//           print('⚠️ No medications found');
//         }
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
//     final filtered = medications.where((med) {
//       return (med.genericName?.toLowerCase().contains(query) ?? false) ||
//           (med.brandName?.toLowerCase().contains(query) ?? false);
//     }).toList();

//     print(
//       'Filtered medications count: ${filtered.length}',
//     ); // Log the count of filtered medications
//     return filtered;
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

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:saymymeds/app/core/consants/api_constants.dart';
import 'package:saymymeds/app/utlies/storage_helper.dart';
import 'dart:convert';
import 'package:saymymeds/app/views/screens/medications/controler/model/medication_api_model.dart';

class MedicationController extends GetxController {
  static const String baseUrl = ApiConstants.baseUrl + '/api/core';
  String mediaBaseUrlForImages = ApiConstants.baseUrl;

  final medications = <Results>[].obs;
  final isLoading = false.obs;
  final searchQuery = ''.obs;
  final selectedLanguage = 'en'.obs;
  final isPlaying = false.obs;
  final medicationId = 0.obs;
  final languageCode = 'en'.obs;
  final noteText = ''.obs;
  final errorMessage = ''.obs;
  final globalLanguageCode = 'en'.obs; // ✅ Track global language

  late final AudioPlayer audioPlayer;
  String authToken = '';

  final Map<String, String> languageCodes = {
    'English': 'en',
    'Spanish': 'es',
    'French': 'fr',
    'Portugese': 'pt',
    'Portuguese': 'pt',
    'Creole': 'ht',
    'Chinese': 'zh-CN',
    'Russian': 'ru',
  };

  @override
  void onInit() {
    super.onInit();
    audioPlayer = AudioPlayer();
    _setupAudioListeners();

    // ✅ Watch global language changes
    ever(globalLanguageCode, (_) {
      _syncLanguageFromGlobal();
    });

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

  // ✅ Sync language when global language changes
  void _syncLanguageFromGlobal() {
    final newLang = globalLanguageCode.value;

    if (selectedLanguage.value != newLang) {
      selectedLanguage.value = newLang;
      languageCode.value = newLang;
      fetchMedications();
      print('✅ Medication: Language synced to $newLang');
    }
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }

  void setAuthToken(String token) {
    authToken = token;
  }

  String _buildImageUrl(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return '';
    }

    final trimmedPath = imagePath.trim();

    if (trimmedPath.startsWith('http://') ||
        trimmedPath.startsWith('https://')) {
      return trimmedPath;
    }

    final cleanPath = trimmedPath.startsWith('/')
        ? trimmedPath.substring(1)
        : trimmedPath;

    return '$mediaBaseUrlForImages$cleanPath';
  }

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

      print('API Response: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final model = MedicationApiModel.fromJson(data);

        if (model.results != null && model.results!.isNotEmpty) {
          for (var med in model.results!) {
            med.originalImage = _buildImageUrl(med.originalImage);
          }
          medications.value = model.results!;
          print(
            '✅ Medications loaded: ${medications.length} (Lang: ${selectedLanguage.value})',
          );
        } else {
          errorMessage.value = 'No medications available';
          print('⚠️ No medications found');
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

  String _buildAudioUrl() {
    return '$baseUrl/audio/medication/${medicationId.value}/?lang=${languageCode.value}';
  }

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

  Future<void> stopAudio() async {
    try {
      await audioPlayer.stop();
      isPlaying.value = false;
    } catch (e) {
      print('Error stopping audio: $e');
    }
  }

  List<Results> get filteredMedications {
    if (searchQuery.value.isEmpty) return medications;

    final query = searchQuery.value.toLowerCase();
    final filtered = medications.where((med) {
      return (med.genericName?.toLowerCase().contains(query) ?? false) ||
          (med.brandName?.toLowerCase().contains(query) ?? false);
    }).toList();

    print('Filtered medications count: ${filtered.length}');
    return filtered;
  }

  Future<void> changeLanguage(String displayLang) async {
    final langCode = languageCodes[displayLang] ?? 'en';

    if (selectedLanguage.value == langCode) return;

    selectedLanguage.value = langCode;
    languageCode.value = langCode;
    await fetchMedications();
    print('✅ Medication language changed to: $displayLang ($langCode)');
  }

  // ✅ Function to sync global language
  void updateGlobalLanguage(String langCode) {
    globalLanguageCode.value = langCode;
  }

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
