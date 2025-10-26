// // import 'package:get/get.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// // import 'package:audioplayers/audioplayers.dart';
// // import 'package:saymymeds/app/utlies/storage_helper.dart';
// // import 'package:saymymeds/app/views/screens/medications/data/model/check_info_page_api_model.dart';

// // class CheckInfoController extends GetxController {
// //   static const String baseUrl = 'http://10.10.7.24:8002/api/core';

// //   final Rx<CheckInfoPageApiModel?> medicationDetails =
// //       Rx<CheckInfoPageApiModel?>(null);
// //   final RxBool isLoading = false.obs;
// //   final RxBool isPlaying = false.obs;
// //   final RxString selectedLanguage = 'en'.obs;
// //   final RxString noteText = ''.obs;

// //   final AudioPlayer audioPlayer = AudioPlayer();
// //   int medicationId = 0;

// //   final Map<String, String> languageCodes = {
// //     'English': 'en',
// //     'Spanish': 'es',
// //     'French': 'fr',
// //     'Portuguese': 'pt',
// //     'Creole': 'ht',
// //     'Chinese': 'zh-CN',
// //     'Russian': 'ru',
// //   };

// //   @override
// //   void onInit() {
// //     super.onInit();
// //     audioPlayer.onPlayerStateChanged.listen((state) {
// //       isPlaying.value = state == PlayerState.playing;
// //     });
// //   }

// //   @override
// //   void onClose() {
// //     audioPlayer.dispose();
// //     super.onClose();
// //   }

// //   // Fetch medication details
// //   Future<void> fetchMedicationDetails(int id) async {
// //     try {
// //       medicationId = id;
// //       isLoading.value = true;
// //       final token = await StorageHelper.getToken();

// //       if (token == null) {
// //         _showSnackbar('Error', 'No authentication token found');
// //         return;
// //       }

// //       final response = await http.get(
// //         Uri.parse('$baseUrl/medications/$id/?lang=${selectedLanguage.value}'),
// //         headers: {
// //           'Authorization': 'Bearer $token',
// //           'Content-Type': 'application/json',
// //         },
// //       );

// //       if (response.statusCode == 200) {
// //         final data = json.decode(response.body);
// //         medicationDetails.value = CheckInfoPageApiModel.fromJson(data);
// //       } else {
// //         _showSnackbar(
// //           'Error',
// //           'Failed to load details: ${response.statusCode}',
// //         );
// //       }
// //     } catch (e) {
// //       _showSnackbar('Error', 'Failed to fetch details: $e');
// //       print('Error fetching details: $e');
// //     } finally {
// //       isLoading.value = false;
// //     }
// //   }

// //   // Change language and reload
// //   Future<void> changeLanguage(String displayLang) async {
// //     final langCode = languageCodes[displayLang] ?? 'en';
// //     selectedLanguage.value = langCode;
// //     if (medicationId > 0) {
// //       await fetchMedicationDetails(medicationId);
// //     }
// //   }

// //   // Play/Pause audio (works on Flutter Web with auth)
// //   Future<void> toggleAudio() async {
// //     try {
// //       if (isPlaying.value) {
// //         await audioPlayer.pause();
// //       } else {
// //         final audioUrl = getAudioUrlForLanguage();
// //         if (audioUrl.isEmpty) {
// //           _showSnackbar('Error', 'Audio not available for this language');
// //           return;
// //         }

// //         final token = await StorageHelper.getToken();
// //         if (token == null) {
// //           _showSnackbar('Error', 'No authentication token found');
// //           return;
// //         }

// //         // Fetch audio bytes with authentication
// //         final response = await http.get(
// //           Uri.parse(audioUrl),
// //           headers: {'Authorization': 'Bearer $token'},
// //         );

// //         if (response.statusCode == 200) {
// //           final bytes = response.bodyBytes;
// //           await audioPlayer.play(BytesSource(bytes));
// //         } else {
// //           _showSnackbar(
// //             'Error',
// //             'Failed to load audio: ${response.statusCode}',
// //           );
// //         }
// //       }
// //     } catch (e) {
// //       _showSnackbar('Error', 'Failed to play audio: $e');
// //       print('Error playing audio: $e');
// //     }
// //   }

// //   // Get audio URL based on selected language
// //   String getAudioUrlForLanguage() {
// //     final details = medicationDetails.value;
// //     if (details == null) return '';

// //     String? url;
// //     switch (selectedLanguage.value) {
// //       case 'en':
// //         url = details.audioUrls.en;
// //         break;
// //       case 'es':
// //         url = details.audioUrls.es;
// //         break;
// //       case 'fr':
// //         url = details.audioUrls.fr;
// //         break;
// //       case 'pt':
// //         url = details.audioUrls.pt;
// //         break;
// //       case 'ht':
// //         url = details.audioUrls.ht;
// //         break;
// //       case 'zh-CN':
// //         url = details.audioUrls.zhCn;
// //         break;
// //       case 'ru':
// //         url = details.audioUrls.ru;
// //         break;
// //       default:
// //         url = details.audioDirectUrl;
// //     }

// //     if (url == null || url.isEmpty) return '';

// //     // Only prepend baseUrl if URL is relative
// //     if (!url.startsWith('http')) {
// //       return url.startsWith('/api')
// //           ? 'http://10.10.7.24:8002$url'
// //           : '$baseUrl/${url.replaceFirst(RegExp(r'^/'), '')}';
// //     }

// //     return url;
// //   }

// //   // Save/Update note
// //   Future<void> saveNote(int noteId) async {
// //     try {
// //       if (noteText.value.isEmpty) {
// //         _showSnackbar('Warning', 'Please enter a note');
// //         return;
// //       }

// //       final token = await StorageHelper.getToken();
// //       if (token == null) {
// //         _showSnackbar('Error', 'No authentication token found');
// //         return;
// //       }

// //       final response = await http.patch(
// //         Uri.parse('$baseUrl/notes/$noteId/'),
// //         headers: {
// //           'Authorization': 'Bearer $token',
// //           'Content-Type': 'application/json',
// //         },
// //         body: json.encode({'note': noteText.value, 'medication': medicationId}),
// //       );

// //       if (response.statusCode == 200) {
// //         _showSnackbar('Success', 'Note saved successfully');
// //         noteText.value = '';
// //       } else {
// //         _showSnackbar('Error', 'Failed to save note: ${response.statusCode}');
// //       }
// //     } catch (e) {
// //       _showSnackbar('Error', 'Failed to save note: $e');
// //       print('Error saving note: $e');
// //     }
// //   }

// //   // Create new note
// //   Future<void> createNote() async {
// //     try {
// //       if (noteText.value.isEmpty) {
// //         _showSnackbar('Warning', 'Please enter a note');
// //         return;
// //       }

// //       final token = await StorageHelper.getToken();
// //       if (token == null) {
// //         _showSnackbar('Error', 'No authentication token found');
// //         return;
// //       }

// //       final response = await http.post(
// //         Uri.parse('$baseUrl/notes/'),
// //         headers: {
// //           'Authorization': 'Bearer $token',
// //           'Content-Type': 'application/json',
// //         },
// //         body: json.encode({'note': noteText.value, 'medication': medicationId}),
// //       );

// //       if (response.statusCode == 200 || response.statusCode == 201) {
// //         _showSnackbar('Success', 'Note added successfully');
// //         noteText.value = '';
// //         await fetchMedicationDetails(medicationId);
// //       } else {
// //         _showSnackbar('Error', 'Failed to add note: ${response.statusCode}');
// //       }
// //     } catch (e) {
// //       _showSnackbar('Error', 'Failed to add note: $e');
// //       print('Error adding note: $e');
// //     }
// //   }

// //   // Helper method to safely show snackbar
// //   void _showSnackbar(String title, String message) {
// //     Future.microtask(() {
// //       if (Get.context != null) {
// //         Get.snackbar(title, message);
// //       } else {
// //         print('$title: $message');
// //       }
// //     });
// //   }
// // }

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:saymymeds/app/utlies/storage_helper.dart';
// import 'package:saymymeds/app/views/screens/medications/data/model/check_info_page_api_model.dart';

// class CheckInfoController extends GetxController {
//   static const String baseUrl = 'http://10.10.7.24:8002/api/core';

//   final Rx<CheckInfoPageApiModel?> medicationDetails =
//       Rx<CheckInfoPageApiModel?>(null);
//   final RxBool isLoading = false.obs;
//   final RxBool isAudioLoading = false.obs; // NEW: for audio loading state
//   final RxBool isPlaying = false.obs;
//   final RxString selectedLanguage = 'en'.obs;
//   final RxString noteText = ''.obs;

//   final AudioPlayer audioPlayer = AudioPlayer();
//   int medicationId = 0;

//   final Map<String, String> languageCodes = {
//     'English': 'en',
//     'Spanish': 'es',
//     'French': 'fr',
//     'Portuguese': 'pt',
//     'Creole': 'ht',
//     'Chinese': 'zh-CN',
//     'Russian': 'ru',
//   };

//   @override
//   void onInit() {
//     super.onInit();
//     audioPlayer.onPlayerStateChanged.listen((state) {
//       isPlaying.value = state == PlayerState.playing;
//       isAudioLoading.value = state == PlayerState.playing;
//     });
//   }

//   @override
//   void onClose() {
//     audioPlayer.dispose();
//     super.onClose();
//   }

//   // Helper: পূর্ণ image URL তৈরি করুন
//   String _getFullImageUrl(String? imagePath) {
//     if (imagePath == null || imagePath.isEmpty) return '';
//     if (imagePath.startsWith('http')) return imagePath;
//     return '$baseUrl/../..${imagePath}'; // relative path থেকে full URL
//     // অথবা: 'http://10.10.7.24:8002$imagePath'
//   }

//   // Fetch medication details
//   Future<void> fetchMedicationDetails(int id) async {
//     try {
//       medicationId = id;
//       isLoading.value = true;
//       final token = await StorageHelper.getToken();

//       if (token == null) {
//         _showSnackbar('Error', 'No authentication token found');
//         return;
//       }

//       final response = await http.get(
//         Uri.parse('$baseUrl/medications/$id/?lang=${selectedLanguage.value}'),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         medicationDetails.value = CheckInfoPageApiModel.fromJson(data);
//       } else {
//         _showSnackbar(
//           'Error',
//           'Failed to load details: ${response.statusCode}',
//         );
//       }
//     } catch (e) {
//       _showSnackbar('Error', 'Failed to fetch details: $e');
//       print('Error fetching details: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // Change language - শুধু audio URL আপডেট করুন, পূরো ডেটা নতুন করে fetch করবেন না
//   Future<void> changeLanguage(String displayLang) async {
//     final langCode = languageCodes[displayLang] ?? 'en';

//     if (selectedLanguage.value == langCode)
//       return; // একই ভাষা নির্বাচন করলে কিছু করবেন না

//     selectedLanguage.value = langCode;

//     if (medicationId > 0) {
//       // শুধু language parameter সহ API call করুন
//       await fetchMedicationDetails(medicationId);
//     }
//   }

//   // Play/Pause audio with loading state
//   Future<void> toggleAudio() async {
//     try {
//       if (isPlaying.value) {
//         await audioPlayer.pause();
//         isAudioLoading.value = false;
//       } else {
//         final audioUrl = getAudioUrlForLanguage();
//         if (audioUrl.isEmpty) {
//           _showSnackbar('Error', 'Audio not available for this language');
//           return;
//         }

//         final token = await StorageHelper.getToken();
//         if (token == null) {
//           _showSnackbar('Error', 'No authentication token found');
//           return;
//         }

//         isAudioLoading.value = true; // লোডিং শুরু করুন

//         // Fetch audio bytes with authentication
//         final response = await http.get(
//           Uri.parse(audioUrl),
//           headers: {'Authorization': 'Bearer $token'},
//         );

//         if (response.statusCode == 200) {
//           final bytes = response.bodyBytes;
//           await audioPlayer.play(BytesSource(bytes));
//           isAudioLoading.value = false;
//         } else {
//           isAudioLoading.value = false;
//           _showSnackbar(
//             'Error',
//             'Failed to load audio: ${response.statusCode}',
//           );
//         }
//       }
//     } catch (e) {
//       isAudioLoading.value = false;
//       _showSnackbar('Error', 'Failed to play audio: $e');
//       print('Error playing audio: $e');
//     }
//   }

//   // Get audio URL based on selected language
//   String getAudioUrlForLanguage() {
//     final details = medicationDetails.value;
//     if (details == null) return '';

//     String? url;
//     switch (selectedLanguage.value) {
//       case 'en':
//         url = details.audioUrls.en;
//         break;
//       case 'es':
//         url = details.audioUrls.es;
//         break;
//       case 'fr':
//         url = details.audioUrls.fr;
//         break;
//       case 'pt':
//         url = details.audioUrls.pt;
//         break;
//       case 'ht':
//         url = details.audioUrls.ht;
//         break;
//       case 'zh-CN':
//         url = details.audioUrls.zhCn;
//         break;
//       case 'ru':
//         url = details.audioUrls.ru;
//         break;
//       default:
//         url = details.audioDirectUrl;
//     }

//     if (url == null || url.isEmpty) return '';

//     // Only prepend baseUrl if URL is relative
//     if (!url.startsWith('http')) {
//       return url.startsWith('/api')
//           ? 'http://10.10.7.24:8002$url'
//           : '$baseUrl/${url.replaceFirst(RegExp(r'^/'), '')}';
//     }

//     return url;
//   }

//   // Save/Update note
//   Future<void> saveNote(int noteId) async {
//     try {
//       if (noteText.value.isEmpty) {
//         _showSnackbar('Warning', 'Please enter a note');
//         return;
//       }

//       final token = await StorageHelper.getToken();
//       if (token == null) {
//         _showSnackbar('Error', 'No authentication token found');
//         return;
//       }

//       final response = await http.patch(
//         Uri.parse('$baseUrl/notes/$noteId/'),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//         body: json.encode({'note': noteText.value, 'medication': medicationId}),
//       );

//       if (response.statusCode == 200) {
//         _showSnackbar('Success', 'Note saved successfully');
//         noteText.value = '';
//       } else {
//         _showSnackbar('Error', 'Failed to save note: ${response.statusCode}');
//       }
//     } catch (e) {
//       _showSnackbar('Error', 'Failed to save note: $e');
//       print('Error saving note: $e');
//     }
//   }

//   // Create new note
//   Future<void> createNote() async {
//     try {
//       if (noteText.value.isEmpty) {
//         _showSnackbar('Warning', 'Please enter a note');
//         return;
//       }

//       final token = await StorageHelper.getToken();
//       if (token == null) {
//         _showSnackbar('Error', 'No authentication token found');
//         return;
//       }

//       final response = await http.post(
//         Uri.parse('$baseUrl/notes/'),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//         body: json.encode({'note': noteText.value, 'medication': medicationId}),
//       );

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         _showSnackbar('Success', 'Note added successfully');
//         noteText.value = '';
//         await fetchMedicationDetails(medicationId);
//       } else {
//         _showSnackbar('Error', 'Failed to add note: ${response.statusCode}');
//       }
//     } catch (e) {
//       _showSnackbar('Error', 'Failed to add note: $e');
//       print('Error adding note: $e');
//     }
//   }

//   // Helper method to safely show snackbar
//   void _showSnackbar(String title, String message) {
//     Future.microtask(() {
//       if (Get.context != null) {
//         Get.snackbar(title, message);
//       } else {
//         print('$title: $message');
//       }
//     });
//   }
// }

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:saymymeds/app/utlies/storage_helper.dart';
import 'package:saymymeds/app/views/screens/medications/data/model/check_info_page_api_model.dart';

class CheckInfoController extends GetxController {
  static const String baseUrl = 'http://10.10.7.24:8002/api/core';
  static const String mediaBaseUrl =
      'http://10.10.7.24:8002'; // ✅ Media base URL

  final Rx<CheckInfoPageApiModel?> medicationDetails =
      Rx<CheckInfoPageApiModel?>(null);
  final RxString processedImageUrl =
      ''.obs; // ✅ Processed image URL stored separately
  final RxBool isLoading = false.obs;
  final RxBool isAudioLoading = false.obs;
  final RxBool isPlaying = false.obs;
  final RxString selectedLanguage = 'en'.obs;
  final RxString noteText = ''.obs;

  final AudioPlayer audioPlayer = AudioPlayer();
  int medicationId = 0;

  final Map<String, String> languageCodes = {
    'English': 'en',
    'Spanish': 'es',
    'French': 'fr',
    'Portuguese': 'pt',
    'Creole': 'ht',
    'Chinese': 'zh-CN',
    'Russian': 'ru',
  };

  @override
  void onInit() {
    super.onInit();
    audioPlayer.onPlayerStateChanged.listen((state) {
      isPlaying.value = state == PlayerState.playing;
      isAudioLoading.value = state == PlayerState.playing;
    });
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }

  /// ✅ Build proper image URL from relative path (same as MedicationController)
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

  // Fetch medication details
  Future<void> fetchMedicationDetails(int id) async {
    try {
      medicationId = id;
      isLoading.value = true;
      final token = await StorageHelper.getToken();

      if (token == null) {
        _showSnackbar('Error', 'No authentication token found');
        return;
      }

      final response = await http.get(
        Uri.parse('$baseUrl/medications/$id/?lang=${selectedLanguage.value}'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final model = CheckInfoPageApiModel.fromJson(data);

        medicationDetails.value = model;

        // ✅ Process image URL separately
        processedImageUrl.value = _buildImageUrl(model.originalImage);

        print('✅ Medication details loaded');
        print('🖼️ Image URL: ${processedImageUrl.value}');
      } else {
        _showSnackbar(
          'Error',
          'Failed to load details: ${response.statusCode}',
        );
      }
    } catch (e) {
      _showSnackbar('Error', 'Failed to fetch details: $e');
      print('Error fetching details: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Change language
  Future<void> changeLanguage(String displayLang) async {
    final langCode = languageCodes[displayLang] ?? 'en';

    if (selectedLanguage.value == langCode) return;

    selectedLanguage.value = langCode;

    if (medicationId > 0) {
      await fetchMedicationDetails(medicationId);
    }
  }

  // Play/Pause audio with loading state
  Future<void> toggleAudio() async {
    try {
      if (isPlaying.value) {
        await audioPlayer.pause();
        isAudioLoading.value = false;
      } else {
        final audioUrl = getAudioUrlForLanguage();
        if (audioUrl.isEmpty) {
          _showSnackbar('Error', 'Audio not available for this language');
          return;
        }

        final token = await StorageHelper.getToken();
        if (token == null) {
          _showSnackbar('Error', 'No authentication token found');
          return;
        }

        isAudioLoading.value = true;

        // Fetch audio bytes with authentication
        final response = await http.get(
          Uri.parse(audioUrl),
          headers: {'Authorization': 'Bearer $token'},
        );

        if (response.statusCode == 200) {
          final bytes = response.bodyBytes;
          await audioPlayer.play(BytesSource(bytes));
          isAudioLoading.value = false;
        } else {
          isAudioLoading.value = false;
          _showSnackbar(
            'Error',
            'Failed to load audio: ${response.statusCode}',
          );
        }
      }
    } catch (e) {
      isAudioLoading.value = false;
      _showSnackbar('Error', 'Failed to play audio: $e');
      print('Error playing audio: $e');
    }
  }

  // Get audio URL based on selected language
  String getAudioUrlForLanguage() {
    final details = medicationDetails.value;
    if (details == null) return '';

    String? url;
    switch (selectedLanguage.value) {
      case 'en':
        url = details.audioUrls.en;
        break;
      case 'es':
        url = details.audioUrls.es;
        break;
      case 'fr':
        url = details.audioUrls.fr;
        break;
      case 'pt':
        url = details.audioUrls.pt;
        break;
      case 'ht':
        url = details.audioUrls.ht;
        break;
      case 'zh-CN':
        url = details.audioUrls.zhCn;
        break;
      case 'ru':
        url = details.audioUrls.ru;
        break;
      default:
        url = details.audioDirectUrl;
    }

    if (url == null || url.isEmpty) return '';

    // Only prepend baseUrl if URL is relative
    if (!url.startsWith('http')) {
      return url.startsWith('/api')
          ? 'http://10.10.7.24:8002$url'
          : '$baseUrl/${url.replaceFirst(RegExp(r'^/'), '')}';
    }

    return url;
  }

  // Save/Update note
  Future<void> saveNote(int noteId) async {
    try {
      if (noteText.value.isEmpty) {
        _showSnackbar('Warning', 'Please enter a note');
        return;
      }

      final token = await StorageHelper.getToken();
      if (token == null) {
        _showSnackbar('Error', 'No authentication token found');
        return;
      }

      final response = await http.patch(
        Uri.parse('$baseUrl/notes/$noteId/'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: json.encode({'note': noteText.value, 'medication': medicationId}),
      );

      if (response.statusCode == 200) {
        _showSnackbar('Success', 'Note saved successfully');
        noteText.value = '';
      } else {
        _showSnackbar('Error', 'Failed to save note: ${response.statusCode}');
      }
    } catch (e) {
      _showSnackbar('Error', 'Failed to save note: $e');
      print('Error saving note: $e');
    }
  }

  // Create new note
  Future<void> createNote() async {
    try {
      if (noteText.value.isEmpty) {
        _showSnackbar('Warning', 'Please enter a note');
        return;
      }

      final token = await StorageHelper.getToken();
      if (token == null) {
        _showSnackbar('Error', 'No authentication token found');
        return;
      }

      final response = await http.post(
        Uri.parse('$baseUrl/notes/'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: json.encode({'note': noteText.value, 'medication': medicationId}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        _showSnackbar('Success', 'Note added successfully');
        noteText.value = '';
        await fetchMedicationDetails(medicationId);
      } else {
        _showSnackbar('Error', 'Failed to add note: ${response.statusCode}');
      }
    } catch (e) {
      _showSnackbar('Error', 'Failed to add note: $e');
      print('Error adding note: $e');
    }
  }

  // Helper method to safely show snackbar
  void _showSnackbar(String title, String message) {
    Future.microtask(() {
      if (Get.context != null) {
        Get.snackbar(title, message);
      } else {
        print('$title: $message');
      }
    });
  }
}
