// import 'dart:io';
// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:saymymeds/app/core/app_routes/app_routes.dart';
// import 'package:saymymeds/app/views/screens/view_details/medication_preview_model/medication_preview.dart';

// class MedicineController extends GetxController {
//   // Observables
//   final Rx<File?> selectedImage = Rx<File?>(null);
//   final RxBool isLoading = RxBool(false);
//   final RxBool isPlaying = RxBool(false);
//   final RxString selectedLanguage = RxString('en');
//   final RxString notes = RxString('');
//   final Rx<MedicationPreviewModel?> medicationData =
//       Rx<MedicationPreviewModel?>(null);

//   // Audio player
//   final AudioPlayer audioPlayer = AudioPlayer();

//   // API config
//   final String baseUrl = 'http://10.10.7.24:8002';
//   final String bearerToken =
//       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzYxMDk4MTA4LCJpYXQiOjE3NjA5NzgxMDgsImp0aSI6IjQ2MmJkZjMwMjBlNTRkMmFhNmU1YmI5MTMyZjQxZjExIiwidXNlcl9pZCI6IjM0In0.QiXKW4fTP5CSo8r89ByNdVvpBl-uxSbGLms0nDK-6f8'; // your token

//   final ImagePicker _picker = ImagePicker();

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
//     audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
//       isPlaying.value = state == PlayerState.playing;
//     });
//   }

//   @override
//   void onClose() {
//     audioPlayer.dispose();
//     super.onClose();
//   }

//   // Pick image from camera
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

//   // Pick image from gallery
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

//   // Upload image to API (GoRouter version)
//   Future<void> uploadImage(BuildContext context) async {
//     if (selectedImage.value == null) return;

//     try {
//       isLoading.value = true;

//       final request = http.MultipartRequest(
//         'POST',
//         Uri.parse(
//           '$baseUrl/api/core/ai-analysis/?lang=${selectedLanguage.value}',
//         ),
//       );
//       request.headers.addAll({'Authorization': 'Bearer $bearerToken'});
//       request.files.add(
//         await http.MultipartFile.fromPath('image', selectedImage.value!.path),
//       );

//       final streamedResponse = await request.send();
//       final response = await http.Response.fromStream(streamedResponse);

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final jsonData = json.decode(response.body);
//         medicationData.value = MedicationPreviewModel.fromJson(jsonData);

//         // ✅ GoRouter navigation only
//         if (context.mounted) {
//           context.push(
//             AppRoutes.medicineDetailPage,
//             extra: medicationData.value,
//           );
//         }
//       } else {
//         throw Exception('Failed to upload image (${response.statusCode})');
//       }
//     } catch (e) {
//       _showError('Failed to upload image: $e', context);
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // Change language
//   Future<void> changeLanguage(String language, BuildContext context) async {
//     if (medicationData.value?.previewId == null) return;
//     try {
//       isLoading.value = true;
//       selectedLanguage.value = languageMap[language] ?? 'en';

//       if (isPlaying.value) await audioPlayer.stop();

//       final response = await http.get(
//         Uri.parse(
//           '$baseUrl/api/core/preview/${medicationData.value!.previewId}/?lang=${selectedLanguage.value}',
//         ),
//         headers: {'Authorization': 'Bearer $bearerToken'},
//       );

//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         medicationData.value = MedicationPreviewModel.fromJson(jsonData);
//       } else {
//         throw Exception('Failed to change language');
//       }
//     } catch (e) {
//       _showError('Failed to change language: $e', context);
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // Play / Pause audio
//   Future<void> toggleAudio(BuildContext context) async {
//     if (medicationData.value == null) return;
//     try {
//       if (isPlaying.value) {
//         await audioPlayer.pause();
//       } else {
//         final med = medicationData.value!;
//         String? audioPath;

//         try {
//           audioPath = (med as dynamic).audioDirectUrl as String?;
//         } catch (_) {}
//         audioPath ??= (med as dynamic).aiAnalysis?.audioUrl as String?;

//         if (audioPath == null || audioPath.isEmpty) {
//           _showError('Audio not available for this medication.', context);
//           return;
//         }

//         final audioUrl = audioPath.startsWith('http')
//             ? audioPath
//             : '$baseUrl$audioPath';
//         await audioPlayer.play(
//           UrlSource(audioUrl),
//           mode: PlayerMode.mediaPlayer,
//         );
//       }
//     } catch (e) {
//       _showError('Failed to play audio: $e', context);
//     }
//   }

//   // Save medication with notes
//   Future<void> saveMedication(BuildContext context) async {
//     if (medicationData.value?.previewId == null) return;
//     try {
//       isLoading.value = true;

//       final response = await http.post(
//         Uri.parse('$baseUrl/api/core/save-medication/'),
//         headers: {
//           'Authorization': 'Bearer $bearerToken',
//           'Content-Type': 'application/json',
//         },
//         body: json.encode({
//           'preview_id': medicationData.value!.previewId,
//           'notes': notes.value,
//         }),
//       );

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         if (context.mounted) context.pop(); // ✅ GoRouter pop
//       } else {
//         throw Exception('Failed to save medication');
//       }
//     } catch (e) {
//       _showError('Failed to save medication: $e', context);
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // Helpers
//   void updateNotes(String value) => notes.value = value;

//   AiAnalysis? get currentAnalysis => medicationData.value?.aiAnalysis;

//   String get currentImageUrl {
//     final medVal = medicationData.value;
//     if (medVal == null) return '';
//     final url = medVal.uploadedImage?.url;
//     return url != null ? '$baseUrl$url' : '';
//   }

//   // void _showError(String message) {
//   //   Get.snackbar('Error', message, snackPosition: SnackPosition.BOTTOM);
//   // }
//   // void _showError(String message) {
//   //   Get.closeAllSnackbars(); // optional, if you want to prevent stacking
//   //   final context = Get.context;
//   //   if (context != null) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
//   //     );
//   //   } else {
//   //     debugPrint("⚠️ Snackbar context is null: $message");
//   //   }
//   // }
//   void _showError(String message, BuildContext context) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         behavior: SnackBarBehavior.floating,
//         backgroundColor: Colors.redAccent,
//       ),
//     );
//   }
// }

/*


import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:saymymeds/app/core/app_routes/app_routes.dart';
import 'package:saymymeds/app/utlies/storage_helper.dart';
import 'package:saymymeds/app/views/screens/view_details/medication_preview_model/medication_preview.dart';

class MedicineController extends GetxController {
  // Observables
  final Rx<File?> selectedImage = Rx<File?>(null);
  final RxBool isLoading = RxBool(false);
  final RxBool isPlaying = RxBool(false);
  final RxString selectedLanguage = RxString('en');
  final RxString notes = RxString('');
  final Rx<MedicationPreviewModel?> medicationData =
      Rx<MedicationPreviewModel?>(null);

  // Audio player
  final AudioPlayer audioPlayer = AudioPlayer();

  // API base URL
  final String baseUrl = 'http://10.10.7.24:8002';

  // Image picker
  final ImagePicker _picker = ImagePicker();

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
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      isPlaying.value = state == PlayerState.playing;
    });
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }

  // Fetch access token from StorageHelper
  Future<String?> _getToken() async {
    return await StorageHelper.getToken();
  }

  // Pick image from camera
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

  // Pick image from gallery
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

  // Upload image to API
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
        medicationData.value = MedicationPreviewModel.fromJson(jsonData);

        if (context.mounted) {
          context.push(
            AppRoutes.medicineDetailPage,
            extra: medicationData.value,
          );
        }
      } else {
        throw Exception('Failed to upload image (${response.statusCode})');
      }
    } catch (e) {
      _showError('Failed to upload image: $e', context);
    } finally {
      isLoading.value = false;
    }
  }

  // Change language
  Future<void> changeLanguage(String language, BuildContext context) async {
    if (medicationData.value?.previewId == null) return;

    try {
      isLoading.value = true;
      selectedLanguage.value = languageMap[language] ?? 'en';

      if (isPlaying.value) await audioPlayer.stop();

      final token = await _getToken();
      if (token == null) {
        _showError('Authentication token not found', context);
        return;
      }

      final response = await http.get(
        Uri.parse(
          '$baseUrl/api/core/preview/${medicationData.value!.previewId}/?lang=${selectedLanguage.value}',
        ),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        medicationData.value = MedicationPreviewModel.fromJson(jsonData);
      } else {
        throw Exception('Failed to change language');
      }
    } catch (e) {
      _showError('Failed to change language: $e', context);
    } finally {
      isLoading.value = false;
    }
  }

  // Play / Pause audio
  Future<void> toggleAudio(BuildContext context) async {
    if (medicationData.value == null) return;

    try {
      if (isPlaying.value) {
        await audioPlayer.pause();
      } else {
        final med = medicationData.value!;
        String? audioPath;

        try {
          audioPath = (med as dynamic).audioDirectUrl as String?;
        } catch (_) {}
        audioPath ??= (med as dynamic).aiAnalysis?.audioUrl as String?;

        if (audioPath == null || audioPath.isEmpty) {
          _showError('Audio not available for this medication.', context);
          return;
        }

        final audioUrl = audioPath.startsWith('http')
            ? audioPath
            : '$baseUrl$audioPath';
        await audioPlayer.play(
          UrlSource(audioUrl),
          mode: PlayerMode.mediaPlayer,
        );
      }
    } catch (e) {
      _showError('Failed to play audio: $e', context);
    }
  }

  // Save medication with notes
  Future<void> saveMedication(BuildContext context) async {
    if (medicationData.value?.previewId == null) return;

    try {
      isLoading.value = true;

      final token = await _getToken();
      if (token == null) {
        _showError('Authentication token not found', context);
        return;
      }

      final response = await http.post(
        Uri.parse('$baseUrl/api/core/save-medication/'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'preview_id': medicationData.value!.previewId,
          'notes': notes.value,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (context.mounted) context.pop();
      } else {
        throw Exception('Failed to save medication');
      }
    } catch (e) {
      _showError('Failed to save medication: $e', context);
    } finally {
      isLoading.value = false;
    }
  }

  // Helpers
  void updateNotes(String value) => notes.value = value;

  AiAnalysis? get currentAnalysis => medicationData.value?.aiAnalysis;

  String get currentImageUrl {
    final medVal = medicationData.value;
    if (medVal == null) return '';
    final url = medVal.uploadedImage?.url;
    return url != null ? '$baseUrl$url' : '';
  }

  void _showError(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}


*/

//     // last code failed to languages chage code

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
  final String baseUrl = 'http://10.10.7.24:8002';

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
          medicationData.value = MedicationPreviewModel.fromJson(jsonData);
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
    } finally {
      isLoading.value = false;
    }
  }

  /// Change AI analysis language
  Future<void> changeLanguage(String language, BuildContext context) async {
    if (medicationData.value?.previewId == null) return;
    try {
      isLoading.value = true;
      selectedLanguage.value = languageMap[language] ?? 'en';

      if (isPlaying.value) await audioPlayer.stop();

      final token = await _getToken();
      if (token == null) {
        _showError('Authentication token not found', context);
        return;
      }

      final previewId = medicationData.value!.previewId;
      final url =
          '$baseUrl/api/core/ai-analysis/$previewId/?lang=${selectedLanguage.value}';

      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData is Map<String, dynamic>) {
          medicationData.value = MedicationPreviewModel.fromJson(jsonData);
        } else {
          _showError('Invalid response format', context);
        }
      } else {
        _showError(
          'Failed to change language (${response.statusCode})',
          context,
        );
      }
    } catch (e) {
      _showError('Failed to change language: $e', context);
    } finally {
      isLoading.value = false;
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
    if (medicationData.value == null) return;
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

      // Fetch and play authenticated audio
      final response = await http.get(
        Uri.parse(audioUrl),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        final tempDir = await getTemporaryDirectory();
        final file = File('${tempDir.path}/temp_audio.mp3');
        await file.writeAsBytes(bytes, flush: true);
        await audioPlayer.play(DeviceFileSource(file.path));
      } else {
        _showError('Failed to load audio (${response.statusCode})', context);
      }
    } catch (e) {
      _showError('Failed to play audio: $e', context);
    }
  }

  /// Save medication with optional notes
  Future<void> saveMedication(BuildContext context) async {
    if (medicationData.value?.previewId == null) return;
    try {
      isLoading.value = true;
      final token = await _getToken();
      if (token == null) {
        _showError('Authentication token not found', context);
        return;
      }

      final response = await http.post(
        Uri.parse('$baseUrl/api/core/save-medication/'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'preview_id': medicationData.value!.previewId,
          'notes': notes.value,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (context.mounted) context.pop();
      } else {
        _showError(
          'Failed to save medication (${response.statusCode})',
          context,
        );
      }
    } catch (e) {
      _showError('Failed to save medication: $e', context);
    } finally {
      isLoading.value = false;
    }
  }

  // Helpers
  void updateNotes(String value) => notes.value = value;

  AiAnalysis? get currentAnalysis => medicationData.value?.aiAnalysis;

  String get currentImageUrl {
    final medVal = medicationData.value;
    final url = medVal?.uploadedImage?.url;
    return url != null ? '$baseUrl$url' : '';
  }

  void _showError(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
