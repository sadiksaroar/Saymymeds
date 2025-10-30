// import 'dart:io';
// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:saymymeds/app/core/app_routes/app_routes.dart';
// import 'package:saymymeds/app/core/consants/api_constants.dart';
// import 'package:saymymeds/app/utlies/storage_helper.dart';
// import 'package:saymymeds/app/views/screens/view_details/medication_preview_model/medication_preview.dart';

// class MedicineController extends GetxController {
//   // Reactive state
//   final Rx<File?> selectedImage = Rx<File?>(null);
//   final RxBool isLoading = RxBool(false);
//   final RxBool isPlaying = RxBool(false);
//   final RxString selectedLanguage = RxString('en');
//   final RxString notes = RxString('');
//   final Rx<MedicationPreviewModel?> medicationData =
//       Rx<MedicationPreviewModel?>(null);

//   // Core dependencies
//   final AudioPlayer audioPlayer = AudioPlayer();
//   final ImagePicker _picker = ImagePicker();
//   final String baseUrl = ApiConstants.baseUrl;

//   // Debounce timer for saving notes
//   Future<void>? _notesSaveTimer;

//   // Language map
//   final Map<String, String> languageMap = {
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
//     });
//   }

//   @override
//   void onClose() {
//     audioPlayer.dispose();
//     _notesSaveTimer = null;
//     super.onClose();
//   }

//   Future<String?> _getToken() async => await StorageHelper.getToken();

//   /// Helper to convert dynamic value to String
//   String _toStringValue(dynamic value) {
//     if (value == null) return '';
//     if (value is String) return value;
//     if (value is List) return value.join(', ');
//     return value.toString();
//   }

//   /// Pick image from camera
//   Future<void> pickImageFromCamera(BuildContext context) async {
//     try {
//       final XFile? pickedFile = await _picker.pickImage(
//         source: ImageSource.camera,
//         imageQuality: 85,
//       );
//       if (pickedFile != null) {
//         selectedImage.value = File(pickedFile.path);
//         await uploadImage(context);
//       }
//     } catch (e) {
//       _showError('Failed to capture image: $e', context);
//     }
//   }

//   /// Pick image from gallery
//   Future<void> pickImageFromGallery(BuildContext context) async {
//     try {
//       final XFile? pickedFile = await _picker.pickImage(
//         source: ImageSource.gallery,
//         imageQuality: 85,
//       );
//       if (pickedFile != null) {
//         selectedImage.value = File(pickedFile.path);
//         await uploadImage(context);
//       }
//     } catch (e) {
//       _showError('Failed to pick image: $e', context);
//     }
//   }

//   Future<void> uploadImage(BuildContext context) async {
//     if (selectedImage.value == null) return;
//     try {
//       isLoading.value = true;
//       final token = await _getToken();
//       if (token == null) {
//         _showError('Authentication token not found', context);
//         return;
//       }

//       // DEBUG: print token length (not full token) to ensure it's not null or accidentally quoted
//       print('🔐 Token length: ${token.length}');
//       // If token maybe stored with quotes, sanitize:
//       final cleanedToken = token.trim().replaceAll('"', '');

//       final uri = Uri.parse(
//         '$baseUrl/api/core/ai-analysis/?lang=${selectedLanguage.value}',
//       );
//       final request = http.MultipartRequest('POST', uri);

//       request.headers.addAll({'Authorization': 'Bearer $cleanedToken'});
//       // DEBUG: print headers we send
//       print('📤 Request headers: ${request.headers}');

//       request.files.add(
//         await http.MultipartFile.fromPath('image', selectedImage.value!.path),
//       );

//       // DEBUG: print file info (path + size)
//       final fileLength = await selectedImage.value!.length();
//       print(
//         '📎 Sending file: ${selectedImage.value!.path} (${fileLength} bytes)',
//       );

//       final streamedResponse = await request.send();
//       final response = await http.Response.fromStream(streamedResponse);

//       print('📍 Status code: ${response.statusCode}');
//       print('📄 Response body: ${response.body}');

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final jsonData = json.decode(response.body);
//         if (jsonData is Map<String, dynamic>) {
//           final sanitizedData = _sanitizeApiResponse(jsonData);
//           medicationData.value = MedicationPreviewModel.fromJson(sanitizedData);
//           if (context.mounted) {
//             context.push(
//               AppRoutes.medicineDetailPage,
//               extra: medicationData.value,
//             );
//           }
//         } else {
//           _showError('Invalid response from server', context);
//         }
//       } else if (response.statusCode == 401 || response.statusCode == 403) {
//         _showError('Unauthorized — please log in again', context);
//       } else {
//         // Show server-returned message if available
//         final bodySnippet = response.body.length > 200
//             ? response.body.substring(0, 200) + '...'
//             : response.body;
//         _showError(
//           'Failed to upload image (${response.statusCode}): $bodySnippet',
//           context,
//         );
//       }
//     } catch (e, st) {
//       _showError('Failed to upload image: $e', context);
//       print('❌ Upload error: $e\n$st');
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   /// Sanitize API response to handle type mismatches
//   Map<String, dynamic> _sanitizeApiResponse(Map<String, dynamic> data) {
//     final sanitized = Map<String, dynamic>.from(data);

//     if (sanitized['ai_analysis'] is Map<String, dynamic>) {
//       final analysis = Map<String, dynamic>.from(sanitized['ai_analysis']);

//       analysis['tot_pills'] = _toStringValue(analysis['tot_pills']);
//       analysis['generic_name'] = _toStringValue(analysis['generic_name']);
//       analysis['brand_name'] = _toStringValue(analysis['brand_name']);
//       analysis['manufacturer'] = _toStringValue(analysis['manufacturer']);
//       analysis['drug_class'] = _toStringValue(analysis['drug_class']);
//       analysis['uses'] = _toStringValue(analysis['uses']);
//       analysis['how_to_take'] = _toStringValue(analysis['how_to_take']);
//       analysis['warnings'] = _toStringValue(analysis['warnings']);
//       analysis['storage_instructions'] = _toStringValue(
//         analysis['storage_instructions'],
//       );
//       analysis['interactions'] = _toStringValue(analysis['interactions']);

//       if (analysis['dosage_information'] is Map<String, dynamic>) {
//         final dosage = Map<String, dynamic>.from(
//           analysis['dosage_information'],
//         );
//         dosage['adults_dosage'] = _toStringValue(dosage['adults_dosage']);
//         dosage['children_dosage'] = _toStringValue(dosage['children_dosage']);
//         dosage['elderly_dosage'] = _toStringValue(dosage['elderly_dosage']);
//         analysis['dosage_information'] = dosage;
//       }

//       if (analysis['side_effects'] is Map<String, dynamic>) {
//         final sideEffects = Map<String, dynamic>.from(analysis['side_effects']);
//         sideEffects['common'] = _toStringValue(sideEffects['common']);
//         sideEffects['serious'] = _toStringValue(sideEffects['serious']);
//         analysis['side_effects'] = sideEffects;
//       }

//       sanitized['ai_analysis'] = analysis;
//     }

//     return sanitized;
//   }

//   /// Change AI analysis language
//   Future<void> changeLanguage(String language, BuildContext context) async {
//     if (medicationData.value == null) {
//       _showError('No medication data found.', context);
//       return;
//     }

//     if (selectedImage.value == null) {
//       _showError('Original image not available for re-analysis.', context);
//       return;
//     }

//     try {
//       isLoading.value = true;
//       selectedLanguage.value = languageMap[language] ?? 'en';

//       if (isPlaying.value) await audioPlayer.stop();

//       final token = await _getToken();
//       if (token == null) {
//         _showError('Authentication token not found', context);
//         return;
//       }

//       print('🔄 Re-analyzing image in language: ${selectedLanguage.value}');

//       final request = http.MultipartRequest(
//         'POST',
//         Uri.parse(
//           '$baseUrl/api/core/ai-analysis/?lang=${selectedLanguage.value}',
//         ),
//       );
//       request.headers.addAll({'Authorization': 'Bearer $token'});
//       request.files.add(
//         await http.MultipartFile.fromPath('image', selectedImage.value!.path),
//       );

//       final streamedResponse = await request.send();
//       final response = await http.Response.fromStream(streamedResponse);

//       print('📍 Response Code: ${response.statusCode}');

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final body = response.body.trim();

//         if (body.isEmpty || body == 'null') {
//           _showError('Server returned empty data for this language.', context);
//           return;
//         }

//         if (body.startsWith('<!DOCTYPE') ||
//             body.startsWith('<html') ||
//             body.startsWith('<HTML')) {
//           print('❌ HTML Error Page Received');
//           _showError('API endpoint error. Please try again.', context);
//           return;
//         }

//         dynamic decoded;
//         try {
//           decoded = jsonDecode(body);
//         } catch (e) {
//           print('❌ JSON Decode Error: $e');
//           _showError('Invalid JSON format from server.', context);
//           return;
//         }

//         if (decoded == null) {
//           _showError('Server returned null data.', context);
//           return;
//         }

//         if (decoded is! Map<String, dynamic>) {
//           _showError(
//             'Unexpected data format. Expected Map, got ${decoded.runtimeType}',
//             context,
//           );
//           return;
//         }

//         final sanitizedData = _sanitizeApiResponse(decoded);
//         medicationData.value = MedicationPreviewModel.fromJson(sanitizedData);
//         print('✅ Language changed to: ${selectedLanguage.value}');
//       } else if (response.statusCode == 204) {
//         _showError('No content available for this language.', context);
//       } else if (response.statusCode == 401) {
//         _showError('Unauthorized — please log in again.', context);
//       } else {
//         print('❌ Language change failed with status: ${response.statusCode}');
//         print('Response body: ${response.body}');
//         _showError(
//           'Failed to change language (${response.statusCode})',
//           context,
//         );
//       }
//     } catch (e) {
//       _showError('Failed to change language: $e', context);
//       print('❌ changeLanguage exception: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   /// Save notes immediately when user finishes typing
//   Future<void> saveNotes(BuildContext context) async {
//     if (medicationData.value?.previewId == null) {
//       print('⚠️ No preview ID available for saving notes');
//       return;
//     }

//     if (notes.value.isEmpty) {
//       print('⚠️ No notes to save');
//       return;
//     }

//     try {
//       final token = await _getToken();
//       if (token == null) {
//         print('⚠️ Token not available for saving notes');
//         return;
//       }

//       print('💾 Saving notes for preview: ${medicationData.value!.previewId}');

//       final response = await http
//           .post(
//             Uri.parse('${baseUrl}api/core/notes/'),
//             headers: {
//               'Authorization': 'Bearer $token',
//               'Content-Type': 'application/json',
//             },
//             body: json.encode({
//               'preview_id': medicationData.value!.previewId,
//               'note': notes.value,
//             }),
//           )
//           .timeout(Duration(seconds: 15));

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         print('✅ Notes saved successfully');
//       } else if (response.statusCode == 401) {
//         print('⚠️ Token expired while saving notes');
//       } else {
//         print('❌ Failed to save notes: ${response.statusCode}');
//         print('Response: ${response.body}');
//       }
//     } catch (e) {
//       print('❌ Error saving notes: $e');
//     }
//   }

//   /// Get current direct audio URL
//   String? get currentAudioUrl {
//     if (medicationData.value == null) return null;
//     final previewId = medicationData.value!.previewId;
//     return '$baseUrl/api/core/audio/preview/$previewId/?lang=${selectedLanguage.value}&audio=true';
//   }

//   /// Play / Pause audio (with auth token)
//   Future<void> toggleAudio(BuildContext context) async {
//     if (medicationData.value == null) {
//       _showError('No medication data available.', context);
//       return;
//     }

//     try {
//       final token = await _getToken();
//       final audioUrl = currentAudioUrl;

//       if (audioUrl == null || audioUrl.isEmpty) {
//         _showError('Audio not available for this medication.', context);
//         return;
//       }

//       if (isPlaying.value) {
//         await audioPlayer.pause();
//         return;
//       }

//       if (token == null) {
//         _showError('Authentication token not found', context);
//         return;
//       }

//       print('🔊 Loading audio from: $audioUrl');

//       final response = await http
//           .get(Uri.parse(audioUrl), headers: {'Authorization': 'Bearer $token'})
//           .timeout(Duration(seconds: 30));

//       if (response.statusCode == 200) {
//         final bytes = response.bodyBytes;
//         final tempDir = await getTemporaryDirectory();
//         final file = File('${tempDir.path}/temp_audio.mp3');
//         await file.writeAsBytes(bytes, flush: true);
//         await audioPlayer.play(DeviceFileSource(file.path));
//         print('✅ Audio playing');
//       } else {
//         _showError('Failed to load audio (${response.statusCode})', context);
//       }
//     } catch (e) {
//       _showError('Failed to play audio: $e', context);
//       print('❌ Audio error: $e');
//     }
//   }

//   /// Save medication with notes
//   Future<void> saveMedication(BuildContext context) async {
//     if (medicationData.value?.previewId == null) {
//       _showError('No medication data to save.', context);
//       return;
//     }

//     try {
//       isLoading.value = true;

//       // First save any pending notes
//       await saveNotes(context);

//       final token = await _getToken();
//       if (token == null) {
//         _showError('Authentication token not found', context);
//         return;
//       }

//       print('💾 Saving medication: ${medicationData.value!.previewId}');

//       final response = await http
//           .post(
//             Uri.parse('${baseUrl}api/core/save-ai-analysis/'),
//             headers: {
//               'Authorization': 'Bearer $token',
//               'Content-Type': 'application/json',
//             },
//             body: json.encode({'preview_id': medicationData.value!.previewId}),
//           )
//           .timeout(Duration(seconds: 15));

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         print('✅ Medication saved successfully');
//         if (context.mounted) {
//           context.pop();
//         }
//       } else if (response.statusCode == 401) {
//         _showError('Token expired. Please log in again.', context);
//       } else {
//         print('❌ Save failed: ${response.statusCode}');
//         _showError(
//           'Failed to save medication (${response.statusCode})',
//           context,
//         );
//       }
//     } catch (e) {
//       _showError('Failed to save medication: $e', context);
//       print('❌ Save error: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // Helpers
//   void updateNotes(String value) {
//     notes.value = value;
//     // Note: Saving on every keystroke is now handled in saveMedication
//     // Remove automatic saves on text change to avoid null context issues
//   }

//   AiAnalysis? get currentAnalysis => medicationData.value?.aiAnalysis;

//   String get currentImageUrl {
//     final medVal = medicationData.value;
//     final url = medVal?.uploadedImage?.url;
//     return url != null ? '$baseUrl$url' : '';
//   }

//   void _showError(String message, BuildContext context) {
//     if (!context.mounted) return;
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         behavior: SnackBarBehavior.floating,
//         backgroundColor: Colors.redAccent,
//         duration: Duration(seconds: 4),
//       ),
//     );
//     print('⚠️ Error shown: $message');
//   }
// }

import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:saymymeds/app/core/app_routes/app_routes.dart';
import 'package:saymymeds/app/core/consants/api_constants.dart';
import 'package:saymymeds/app/utlies/storage_helper.dart';
import 'package:saymymeds/app/views/screens/view_details/medication_preview_model/medication_preview.dart';

class MedicineController extends GetxController {
  final Rx<File?> selectedImage = Rx<File?>(null);
  final RxBool isLoading = RxBool(false);
  final RxBool isPlaying = RxBool(false);
  final RxString selectedLanguage = RxString('en');
  final RxString notes = RxString('');
  final Rx<MedicationPreviewModel?> medicationData =
      Rx<MedicationPreviewModel?>(null);
  final RxInt refreshUI = RxInt(0);

  final AudioPlayer audioPlayer = AudioPlayer();
  final ImagePicker _picker = ImagePicker();
  final String baseUrl = ApiConstants.baseUrl;

  // ✅ SIMPLE LANGUAGE MAP - Display Name to Language Code
  final Map<String, String> languageMap = {
    'English': 'en',
    'Spanish': 'es',
    'French': 'fr',
    'Portuguese': 'pt',
    'Creole': 'ht',
    'Chinese': 'zh-CN',
    'Russian': 'ru',
  };

  // ✅ Language to GetX Locale Mapping
  final Map<String, Locale> localeMap = {
    'en': const Locale('en', 'US'),
    'es': const Locale('es', 'ES'),
    'fr': const Locale('fr', 'FR'),
    'pt': const Locale('pt', 'PT'),
    'ht': const Locale('ht', 'HT'),
    'zh-CN': const Locale('zh-CN', 'CN'),
    'ru': const Locale('ru', 'RU'),
  };

  @override
  void onInit() {
    super.onInit();
    audioPlayer.onPlayerStateChanged.listen((state) {
      isPlaying.value = state == PlayerState.playing;
    });
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }

  Future<String?> _getToken() async => await StorageHelper.getToken();

  String _toStringValue(dynamic value) {
    if (value == null) return '';
    if (value is String) return value;
    if (value is List) return value.join(', ');
    return value.toString();
  }

  Future<void> pickImageFromCamera(BuildContext context) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
      );
      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
        await uploadImage(context);
      }
    } catch (e) {
      _showError('Failed to capture image: $e', context);
    }
  }

  Future<void> pickImageFromGallery(BuildContext context) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );
      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
        await uploadImage(context);
      }
    } catch (e) {
      _showError('Failed to pick image: $e', context);
    }
  }

  Future<void> uploadImage(BuildContext context) async {
    if (selectedImage.value == null) return;
    try {
      isLoading.value = true;
      final token = await _getToken();
      if (token == null) {
        _showError('Authentication token not found', context);
        return;
      }

      final cleanedToken = token.trim().replaceAll('"', '');
      final apiLang = selectedLanguage.value;

      final uri = Uri.parse('$baseUrl/api/core/ai-analysis/?lang=$apiLang');
      final request = http.MultipartRequest('POST', uri);

      request.headers.addAll({'Authorization': 'Bearer $cleanedToken'});
      request.files.add(
        await http.MultipartFile.fromPath('image', selectedImage.value!.path),
      );

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = json.decode(response.body);
        if (jsonData is Map<String, dynamic>) {
          final sanitizedData = _sanitizeApiResponse(jsonData);
          medicationData.value = MedicationPreviewModel.fromJson(sanitizedData);
          refreshUI.value++;
          if (context.mounted) {
            context.push(
              AppRoutes.medicineDetailPage,
              extra: medicationData.value,
            );
          }
        }
      } else if (response.statusCode == 401 || response.statusCode == 403) {
        _showError('Unauthorized — please log in again', context);
      } else {
        _showError('Failed to upload image (${response.statusCode})', context);
      }
    } catch (e) {
      _showError('Failed to upload image: $e', context);
    } finally {
      isLoading.value = false;
    }
  }

  Map<String, dynamic> _sanitizeApiResponse(Map<String, dynamic> data) {
    final sanitized = Map<String, dynamic>.from(data);

    if (sanitized['ai_analysis'] is Map<String, dynamic>) {
      final analysis = Map<String, dynamic>.from(sanitized['ai_analysis']);

      analysis['tot_pills'] = _toStringValue(analysis['tot_pills']);
      analysis['generic_name'] = _toStringValue(analysis['generic_name']);
      analysis['brand_name'] = _toStringValue(analysis['brand_name']);
      analysis['manufacturer'] = _toStringValue(analysis['manufacturer']);
      analysis['drug_class'] = _toStringValue(analysis['drug_class']);
      analysis['uses'] = _toStringValue(analysis['uses']);
      analysis['how_to_take'] = _toStringValue(analysis['how_to_take']);
      analysis['warnings'] = _toStringValue(analysis['warnings']);
      analysis['storage_instructions'] = _toStringValue(
        analysis['storage_instructions'],
      );
      analysis['interactions'] = _toStringValue(analysis['interactions']);

      if (analysis['dosage_information'] is Map<String, dynamic>) {
        final dosage = Map<String, dynamic>.from(
          analysis['dosage_information'],
        );
        dosage['adults_dosage'] = _toStringValue(dosage['adults_dosage']);
        dosage['children_dosage'] = _toStringValue(dosage['children_dosage']);
        dosage['elderly_dosage'] = _toStringValue(dosage['elderly_dosage']);
        analysis['dosage_information'] = dosage;
      }

      if (analysis['side_effects'] is Map<String, dynamic>) {
        final sideEffects = Map<String, dynamic>.from(analysis['side_effects']);
        sideEffects['common'] = _toStringValue(sideEffects['common']);
        sideEffects['serious'] = _toStringValue(sideEffects['serious']);
        analysis['side_effects'] = sideEffects;
      }

      sanitized['ai_analysis'] = analysis;
    }

    return sanitized;
  }

  /// ✅ LANGUAGE CHANGE - সবচেয়ে গুরুত্বপূর্ণ মেথড
  Future<void> changeLanguage(String displayName, BuildContext context) async {
    try {
      isLoading.value = true;

      // Display name থেকে language code পান (English -> en)
      final langCode = languageMap[displayName] ?? 'en';
      final locale = localeMap[langCode] ?? const Locale('en', 'US');

      print('🌍 Changing language: $displayName -> $langCode');

      if (isPlaying.value) await audioPlayer.stop();

      // ✅ GetX locale change - এটাই সবকিছু automatic translate করায়
      await Get.updateLocale(locale);

      selectedLanguage.value = langCode;
      print('✅ Language changed to: $langCode');

      // যদি medication data থাকে তাহলে পুনরায় analyze করুন
      if (medicationData.value != null && selectedImage.value != null) {
        final token = await _getToken();
        if (token == null) return;

        print('🔄 Re-analyzing in: $langCode');

        final request = http.MultipartRequest(
          'POST',
          Uri.parse('$baseUrl/api/core/ai-analysis/?lang=$langCode'),
        );
        request.headers.addAll({'Authorization': 'Bearer $token'});
        request.files.add(
          await http.MultipartFile.fromPath('image', selectedImage.value!.path),
        );

        final streamedResponse = await request.send();
        final response = await http.Response.fromStream(streamedResponse);

        if (response.statusCode == 200 || response.statusCode == 201) {
          final decoded = jsonDecode(response.body);
          if (decoded is Map<String, dynamic>) {
            final sanitizedData = _sanitizeApiResponse(decoded);
            medicationData.value = MedicationPreviewModel.fromJson(
              sanitizedData,
            );
            refreshUI.value++;
            print('✅ Data updated in: $langCode');
          }
        }
      }
    } catch (e) {
      _showError('Failed to change language: $e', context);
      print('❌ Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveNotes(BuildContext context) async {
    if (medicationData.value?.previewId == null || notes.value.isEmpty) return;

    try {
      final token = await _getToken();
      if (token == null) return;

      await http
          .post(
            Uri.parse('${baseUrl}api/core/notes/'),
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
            body: json.encode({
              'preview_id': medicationData.value!.previewId,
              'note': notes.value,
            }),
          )
          .timeout(const Duration(seconds: 15));
    } catch (e) {
      print('❌ Error saving notes: $e');
    }
  }

  String? get currentAudioUrl {
    if (medicationData.value == null) return null;
    final previewId = medicationData.value!.previewId;
    return '$baseUrl/api/core/audio/preview/$previewId/?lang=${selectedLanguage.value}&audio=true';
  }

  Future<void> toggleAudio(BuildContext context) async {
    if (medicationData.value == null) {
      _showError('No medication data available.', context);
      return;
    }

    try {
      final token = await _getToken();
      final audioUrl = currentAudioUrl;

      if (audioUrl == null) {
        _showError('Audio not available.', context);
        return;
      }

      if (isPlaying.value) {
        await audioPlayer.pause();
        return;
      }

      if (token == null) {
        _showError('Authentication token not found', context);
        return;
      }

      final response = await http
          .get(Uri.parse(audioUrl), headers: {'Authorization': 'Bearer $token'})
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        final tempDir = await getTemporaryDirectory();
        final file = File('${tempDir.path}/temp_audio.mp3');
        await file.writeAsBytes(bytes, flush: true);
        await audioPlayer.play(DeviceFileSource(file.path));
      } else {
        _showError('Failed to load audio', context);
      }
    } catch (e) {
      _showError('Failed to play audio: $e', context);
    }
  }

  Future<void> saveMedication(BuildContext context) async {
    if (medicationData.value?.previewId == null) {
      _showError('No medication data to save.', context);
      return;
    }

    try {
      isLoading.value = true;
      await saveNotes(context);

      final token = await _getToken();
      if (token == null) {
        _showError('Authentication token not found', context);
        return;
      }

      final response = await http
          .post(
            Uri.parse('${baseUrl}api/core/save-ai-analysis/'),
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
            body: json.encode({'preview_id': medicationData.value!.previewId}),
          )
          .timeout(const Duration(seconds: 15));

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (context.mounted) context.pop();
      } else {
        _showError('Failed to save medication', context);
      }
    } catch (e) {
      _showError('Failed to save medication: $e', context);
    } finally {
      isLoading.value = false;
    }
  }

  void updateNotes(String value) => notes.value = value;

  AiAnalysis? get currentAnalysis => medicationData.value?.aiAnalysis;

  String get currentImageUrl {
    final medVal = medicationData.value;
    final url = medVal?.uploadedImage?.url;
    return url != null ? '$baseUrl$url' : '';
  }

  void _showError(String message, BuildContext context) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.redAccent,
        duration: const Duration(seconds: 4),
      ),
    );
  }
}
