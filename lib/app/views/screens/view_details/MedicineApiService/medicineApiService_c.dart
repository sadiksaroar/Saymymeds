// //     // last code failed to languages chage codeimport 'dart:io';
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

//   /// Upload image to API
//   Future<void> uploadImage(BuildContext context) async {
//     if (selectedImage.value == null) return;
//     try {
//       isLoading.value = true;
//       final token = await _getToken();
//       if (token == null) {
//         _showError('Authentication token not found', context);
//         return;
//       }

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

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final jsonData = json.decode(response.body);
//         if (jsonData is Map<String, dynamic>) {
//           // Sanitize data before creating model
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
//       } else {
//         _showError('Failed to upload image (${response.statusCode})', context);
//       }
//     } catch (e) {
//       _showError('Failed to upload image: $e', context);
//       print('❌ Upload error: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   /// Sanitize API response to handle type mismatches
//   Map<String, dynamic> _sanitizeApiResponse(Map<String, dynamic> data) {
//     final sanitized = Map<String, dynamic>.from(data);

//     // Sanitize ai_analysis nested object
//     if (sanitized['ai_analysis'] is Map<String, dynamic>) {
//       final analysis = Map<String, dynamic>.from(sanitized['ai_analysis']);

//       // Convert list fields to strings
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

//       // Sanitize dosage_information
//       if (analysis['dosage_information'] is Map<String, dynamic>) {
//         final dosage = Map<String, dynamic>.from(
//           analysis['dosage_information'],
//         );
//         dosage['adults_dosage'] = _toStringValue(dosage['adults_dosage']);
//         dosage['children_dosage'] = _toStringValue(dosage['children_dosage']);
//         dosage['elderly_dosage'] = _toStringValue(dosage['elderly_dosage']);
//         analysis['dosage_information'] = dosage;
//       }

//       // Sanitize side_effects
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

//   /// Change AI analysis language - REANALYSIS APPROACH
//   Future<void> changeLanguage(String language, BuildContext context) async {
//     // Validate medication data and image
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

//       // Re-upload the image with the new language
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

//         // Sanitize data before parsing
//         final sanitizedData = _sanitizeApiResponse(decoded);

//         // Update medication data with new language analysis
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

//   /// Save medication with optional notes
//   Future<void> saveMedication(BuildContext context) async {
//     if (medicationData.value?.previewId == null) {
//       _showError('No medication data to save.', context);
//       return;
//     }

//     try {
//       isLoading.value = true;
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
//             body: json.encode({
//               'preview_id': medicationData.value!.previewId,
//               'notes': notes.value,
//             }),
//           )
//           .timeout(Duration(seconds: 15));

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         print('✅ Medication saved successfully');
//         if (context.mounted) context.pop();
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
//   void updateNotes(String value) => notes.value = value;

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
  // Reactive state
  final Rx<File?> selectedImage = Rx<File?>(null);
  final RxBool isLoading = RxBool(false);
  final RxBool isPlaying = RxBool(false);
  final RxString selectedLanguage = RxString('en');
  final RxString notes = RxString('');
  final Rx<MedicationPreviewModel?> medicationData =
      Rx<MedicationPreviewModel?>(null);

  // Core dependencies
  final AudioPlayer audioPlayer = AudioPlayer();
  final ImagePicker _picker = ImagePicker();
  final String baseUrl = ApiConstants.baseUrl;

  // Language map
  final Map<String, String> languageMap = {
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
    });
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }

  Future<String?> _getToken() async => await StorageHelper.getToken();

  /// Helper to convert dynamic value to String
  String _toStringValue(dynamic value) {
    if (value == null) return '';
    if (value is String) return value;
    if (value is List) return value.join(', ');
    return value.toString();
  }

  /// Pick image from camera
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

  /// Pick image from gallery
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

  /// Upload image to API
  Future<void> uploadImage(BuildContext context) async {
    if (selectedImage.value == null) return;
    try {
      isLoading.value = true;
      final token = await _getToken();
      if (token == null) {
        _showError('Authentication token not found', context);
        return;
      }

      final request = http.MultipartRequest(
        'POST',
        Uri.parse(
          '$baseUrl/api/core/ai-analysis/?lang=${selectedLanguage.value}',
        ),
      );
      request.headers.addAll({'Authorization': 'Bearer $token'});
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
          if (context.mounted) {
            context.push(
              AppRoutes.medicineDetailPage,
              extra: medicationData.value,
            );
          }
        } else {
          _showError('Invalid response from server', context);
        }
      } else {
        _showError('Failed to upload image (${response.statusCode})', context);
      }
    } catch (e) {
      _showError('Failed to upload image: $e', context);
      print('❌ Upload error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Sanitize API response to handle type mismatches
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

  /// Change AI analysis language
  Future<void> changeLanguage(String language, BuildContext context) async {
    if (medicationData.value == null) {
      _showError('No medication data found.', context);
      return;
    }

    if (selectedImage.value == null) {
      _showError('Original image not available for re-analysis.', context);
      return;
    }

    try {
      isLoading.value = true;
      selectedLanguage.value = languageMap[language] ?? 'en';

      if (isPlaying.value) await audioPlayer.stop();

      final token = await _getToken();
      if (token == null) {
        _showError('Authentication token not found', context);
        return;
      }

      print('🔄 Re-analyzing image in language: ${selectedLanguage.value}');

      final request = http.MultipartRequest(
        'POST',
        Uri.parse(
          '$baseUrl/api/core/ai-analysis/?lang=${selectedLanguage.value}',
        ),
      );
      request.headers.addAll({'Authorization': 'Bearer $token'});
      request.files.add(
        await http.MultipartFile.fromPath('image', selectedImage.value!.path),
      );

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      print('📍 Response Code: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body.trim();

        if (body.isEmpty || body == 'null') {
          _showError('Server returned empty data for this language.', context);
          return;
        }

        if (body.startsWith('<!DOCTYPE') ||
            body.startsWith('<html') ||
            body.startsWith('<HTML')) {
          print('❌ HTML Error Page Received');
          _showError('API endpoint error. Please try again.', context);
          return;
        }

        dynamic decoded;
        try {
          decoded = jsonDecode(body);
        } catch (e) {
          print('❌ JSON Decode Error: $e');
          _showError('Invalid JSON format from server.', context);
          return;
        }

        if (decoded == null) {
          _showError('Server returned null data.', context);
          return;
        }

        if (decoded is! Map<String, dynamic>) {
          _showError(
            'Unexpected data format. Expected Map, got ${decoded.runtimeType}',
            context,
          );
          return;
        }

        final sanitizedData = _sanitizeApiResponse(decoded);
        medicationData.value = MedicationPreviewModel.fromJson(sanitizedData);
        print('✅ Language changed to: ${selectedLanguage.value}');
      } else if (response.statusCode == 204) {
        _showError('No content available for this language.', context);
      } else if (response.statusCode == 401) {
        _showError('Unauthorized — please log in again.', context);
      } else {
        print('❌ Language change failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
        _showError(
          'Failed to change language (${response.statusCode})',
          context,
        );
      }
    } catch (e) {
      _showError('Failed to change language: $e', context);
      print('❌ changeLanguage exception: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Save notes immediately when user finishes typing
  Future<void> saveNotes(BuildContext context) async {
    if (medicationData.value?.previewId == null) {
      print('⚠️ No preview ID available for saving notes');
      return;
    }

    if (notes.value.isEmpty) {
      print('⚠️ No notes to save');
      return;
    }

    try {
      final token = await _getToken();
      if (token == null) {
        print('⚠️ Token not available for saving notes');
        return;
      }

      print('💾 Saving notes for preview: ${medicationData.value!.previewId}');

      final response = await http
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
          .timeout(Duration(seconds: 15));

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('✅ Notes saved successfully');
      } else if (response.statusCode == 401) {
        print('⚠️ Token expired while saving notes');
      } else {
        print('❌ Failed to save notes: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('❌ Error saving notes: $e');
    }
  }

  /// Get current direct audio URL
  String? get currentAudioUrl {
    if (medicationData.value == null) return null;
    final previewId = medicationData.value!.previewId;
    return '$baseUrl/api/core/audio/preview/$previewId/?lang=${selectedLanguage.value}&audio=true';
  }

  /// Play / Pause audio (with auth token)
  Future<void> toggleAudio(BuildContext context) async {
    if (medicationData.value == null) {
      _showError('No medication data available.', context);
      return;
    }

    try {
      final token = await _getToken();
      final audioUrl = currentAudioUrl;

      if (audioUrl == null || audioUrl.isEmpty) {
        _showError('Audio not available for this medication.', context);
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

      print('🔊 Loading audio from: $audioUrl');

      final response = await http
          .get(Uri.parse(audioUrl), headers: {'Authorization': 'Bearer $token'})
          .timeout(Duration(seconds: 30));

      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        final tempDir = await getTemporaryDirectory();
        final file = File('${tempDir.path}/temp_audio.mp3');
        await file.writeAsBytes(bytes, flush: true);
        await audioPlayer.play(DeviceFileSource(file.path));
        print('✅ Audio playing');
      } else {
        _showError('Failed to load audio (${response.statusCode})', context);
      }
    } catch (e) {
      _showError('Failed to play audio: $e', context);
      print('❌ Audio error: $e');
    }
  }

  /// Save medication with notes
  Future<void> saveMedication(BuildContext context) async {
    if (medicationData.value?.previewId == null) {
      _showError('No medication data to save.', context);
      return;
    }

    try {
      isLoading.value = true;
      final token = await _getToken();
      if (token == null) {
        _showError('Authentication token not found', context);
        return;
      }

      print('💾 Saving medication: ${medicationData.value!.previewId}');

      final response = await http
          .post(
            Uri.parse('${baseUrl}api/core/save-ai-analysis/'),
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
            body: json.encode({'preview_id': medicationData.value!.previewId}),
          )
          .timeout(Duration(seconds: 15));

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('✅ Medication saved successfully');
        if (context.mounted) context.pop();
      } else if (response.statusCode == 401) {
        _showError('Token expired. Please log in again.', context);
      } else {
        print('❌ Save failed: ${response.statusCode}');
        _showError(
          'Failed to save medication (${response.statusCode})',
          context,
        );
      }
    } catch (e) {
      _showError('Failed to save medication: $e', context);
      print('❌ Save error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Helpers
  void updateNotes(String value) {
    notes.value = value;
    // Save notes after a short delay to avoid too many requests
    saveNotes(Get.context!);
  }

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
        duration: Duration(seconds: 4),
      ),
    );
    print('⚠️ Error shown: $message');
  }
}
