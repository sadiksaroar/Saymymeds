// import 'package:get/get.dart';
// import 'package:saymymeds/app/views/screens/medications/data/model/medication_api_model.dart';
// import 'package:saymymeds/app/views/screens/medications/data/services/medication_api_service.dart';

// class MedicationController extends GetxController {
//   var medications = <Results>[].obs;
//   var filteredMedications = <Results>[].obs;
//   var isLoading = true.obs;
//   var errorMessage = ''.obs;
//   var searchQuery = ''.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchMedications();
//   }

//   Future<void> fetchMedications() async {
//     try {
//       isLoading(true);
//       errorMessage('');
//       final response = await MedicationApiService.getMedications();
//       medications.value = response.results ?? [];
//       filteredMedications.value = response.results ?? [];
//     } catch (e) {
//       errorMessage(e.toString());
//     } finally {
//       isLoading(false);
//     }
//   }

//   void searchMedications(String query) {
//     searchQuery(query);
//     if (query.isEmpty) {
//       filteredMedications.value = medications;
//     } else {
//       filteredMedications.value = medications.where((med) {
//         return (med.brandName?.toLowerCase().contains(query.toLowerCase()) ??
//                 false) ||
//             (med.genericName?.toLowerCase().contains(query.toLowerCase()) ??
//                 false);
//       }).toList();
//     }
//   }

//   void deleteMedication(int index) {
//     medications.removeAt(index);
//     searchMedications(searchQuery.value);
//   }
// }

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:saymymeds/app/utlies/storage_helper.dart' show StorageHelper;
import 'dart:convert';

class MedicationController extends GetxController {
  final medicines = <Results>[].obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final selectedLanguage = 'en'.obs;

  static const String baseUrl = 'http://10.10.7.24:8002/api/core';

  @override
  void onInit() {
    super.onInit();
    fetchMedications();
  }

  Future<void> fetchMedications() async {
    try {
      isLoading(true);
      errorMessage('');

      final token = await StorageHelper.getToken();
      if (token == null) {
        errorMessage('Authentication token not found');
        return;
      }

      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final response = await http.get(
        Uri.parse('$baseUrl/medications/?lang=${selectedLanguage.value}'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = MedicationApiModel.fromJson(jsonDecode(response.body));
        medicines.assignAll(data.results ?? []);
      } else {
        errorMessage('Failed to load medications: ${response.statusCode}');
      }
    } catch (e) {
      errorMessage('Error: $e');
      print('Error fetching medications: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<CheckInfoPageApiModel?> getMedicationDetails(int medicationId) async {
    try {
      final token = await StorageHelper.getToken();
      if (token == null) return null;

      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final response = await http.get(
        Uri.parse(
          '$baseUrl/medications/$medicationId/?lang=${selectedLanguage.value}',
        ),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return CheckInfoPageApiModel.fromJson(jsonDecode(response.body));
      }
      return null;
    } catch (e) {
      print('Error fetching medication details: $e');
      return null;
    }
  }

  Future<void> deleteMedication(int medicationId) async {
    try {
      final token = await StorageHelper.getToken();
      if (token == null) return;

      final headers = {'Authorization': 'Bearer $token'};

      final response = await http.delete(
        Uri.parse('$baseUrl/medications/$medicationId/'),
        headers: headers,
      );

      if (response.statusCode == 204 || response.statusCode == 200) {
        medicines.removeWhere((med) => med.id == medicationId);
        Get.snackbar('Success', 'Medication deleted');
      } else {
        Get.snackbar('Error', 'Failed to delete medication');
      }
    } catch (e) {
      Get.snackbar('Error', 'Error deleting medication: $e');
    }
  }

  void changeLanguage(String lang) {
    selectedLanguage(lang);
    fetchMedications();
  }
}

// Data Models
class MedicationApiModel {
  List<Results>? results;
  String? language;

  MedicationApiModel({this.results, this.language});

  factory MedicationApiModel.fromJson(Map<String, dynamic> json) {
    return MedicationApiModel(
      results: json['results'] != null
          ? List<Results>.from(json['results'].map((x) => Results.fromJson(x)))
          : [],
      language: json['language'],
    );
  }
}

class Results {
  int? id;
  String? originalImage;
  String? genericName;
  String? brandName;
  String? manufacturer;
  String? drugClass;
  String? uses;
  String? totPills;
  DosageInformation? dosageInformation;
  String? howToTake;
  SideEffects? sideEffects;
  String? warnings;
  String? storageInstructions;
  String? interactions;
  String? aiAdditionalNotes;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  List<AdditionalNotes>? additionalNotes;

  Results({
    this.id,
    this.originalImage,
    this.genericName,
    this.brandName,
    this.manufacturer,
    this.drugClass,
    this.uses,
    this.totPills,
    this.dosageInformation,
    this.howToTake,
    this.sideEffects,
    this.warnings,
    this.storageInstructions,
    this.interactions,
    this.aiAdditionalNotes,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.additionalNotes,
  });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      id: json['id'],
      originalImage: json['original_image'],
      genericName: json['generic_name'],
      brandName: json['brand_name'],
      manufacturer: json['manufacturer'],
      drugClass: json['drug_class'],
      uses: json['uses'],
      totPills: json['tot_pills'],
      dosageInformation: json['dosage_information'] != null
          ? DosageInformation.fromJson(json['dosage_information'])
          : null,
      howToTake: json['how_to_take'],
      sideEffects: json['side_effects'] != null
          ? SideEffects.fromJson(json['side_effects'])
          : null,
      warnings: json['warnings'],
      storageInstructions: json['storage_instructions'],
      interactions: json['interactions'],
      aiAdditionalNotes: json['ai_additional_notes'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      additionalNotes: json['additional_notes'] != null
          ? List<AdditionalNotes>.from(
              json['additional_notes'].map((x) => AdditionalNotes.fromJson(x)),
            )
          : [],
    );
  }
}

class DosageInformation {
  String? adultsDosage;
  String? childrenDosage;
  String? elderlyDosage;

  DosageInformation({
    this.adultsDosage,
    this.childrenDosage,
    this.elderlyDosage,
  });

  factory DosageInformation.fromJson(Map<String, dynamic> json) {
    return DosageInformation(
      adultsDosage: json['adults_dosage'],
      childrenDosage: json['children_dosage'],
      elderlyDosage: json['elderly_dosage'],
    );
  }
}

class SideEffects {
  String? common;
  String? serious;

  SideEffects({this.common, this.serious});

  factory SideEffects.fromJson(Map<String, dynamic> json) {
    return SideEffects(common: json['common'], serious: json['serious']);
  }
}

class AdditionalNotes {
  int? id;
  int? medication;
  int? user;
  String? note;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  AdditionalNotes({
    this.id,
    this.medication,
    this.user,
    this.note,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory AdditionalNotes.fromJson(Map<String, dynamic> json) {
    return AdditionalNotes(
      id: json['id'],
      medication: json['medication'],
      user: json['user'],
      note: json['note'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class CheckInfoPageApiModel {
  int? id;
  String? originalImage;
  String? genericName;
  String? brandName;
  String? manufacturer;
  String? drugClass;
  String? uses;
  String? totPills;
  DosageInformation? dosageInformation;
  String? howToTake;
  SideEffects? sideEffects;
  String? warnings;
  String? storageInstructions;
  String? interactions;
  String? aiAdditionalNotes;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  List<AdditionalNotes>? additionalNotes;
  String? language;
  AudioUrls? audioUrls;
  String? audioDirectUrl;
  AudioInstructions? audioInstructions;

  CheckInfoPageApiModel({
    this.id,
    this.originalImage,
    this.genericName,
    this.brandName,
    this.manufacturer,
    this.drugClass,
    this.uses,
    this.totPills,
    this.dosageInformation,
    this.howToTake,
    this.sideEffects,
    this.warnings,
    this.storageInstructions,
    this.interactions,
    this.aiAdditionalNotes,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.additionalNotes,
    this.language,
    this.audioUrls,
    this.audioDirectUrl,
    this.audioInstructions,
  });

  factory CheckInfoPageApiModel.fromJson(Map<String, dynamic> json) {
    return CheckInfoPageApiModel(
      id: json['id'],
      originalImage: json['original_image'],
      genericName: json['generic_name'],
      brandName: json['brand_name'],
      manufacturer: json['manufacturer'],
      drugClass: json['drug_class'],
      uses: json['uses'],
      totPills: json['tot_pills'],
      dosageInformation: json['dosage_information'] != null
          ? DosageInformation.fromJson(json['dosage_information'])
          : null,
      howToTake: json['how_to_take'],
      sideEffects: json['side_effects'] != null
          ? SideEffects.fromJson(json['side_effects'])
          : null,
      warnings: json['warnings'],
      storageInstructions: json['storage_instructions'],
      interactions: json['interactions'],
      aiAdditionalNotes: json['ai_additional_notes'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      additionalNotes: json['additional_notes'] != null
          ? List<AdditionalNotes>.from(
              json['additional_notes'].map((x) => AdditionalNotes.fromJson(x)),
            )
          : [],
      language: json['language'],
      audioUrls: json['audio_urls'] != null
          ? AudioUrls.fromJson(json['audio_urls'])
          : null,
      audioDirectUrl: json['audio_direct_url'],
      audioInstructions: json['audio_instructions'] != null
          ? AudioInstructions.fromJson(json['audio_instructions'])
          : null,
    );
  }
}

class AudioUrls {
  String? en;
  String? es;
  String? fr;
  String? pt;
  String? ht;
  String? zhCN;
  String? ru;

  AudioUrls({this.en, this.es, this.fr, this.pt, this.ht, this.zhCN, this.ru});

  factory AudioUrls.fromJson(Map<String, dynamic> json) {
    return AudioUrls(
      en: json['en'],
      es: json['es'],
      fr: json['fr'],
      pt: json['pt'],
      ht: json['ht'],
      zhCN: json['zh-CN'],
      ru: json['ru'],
    );
  }
}

class AudioInstructions {
  String? description;
  List<String>? languages;
  String? example;

  AudioInstructions({this.description, this.languages, this.example});

  factory AudioInstructions.fromJson(Map<String, dynamic> json) {
    return AudioInstructions(
      description: json['description'],
      languages: json['languages'] != null
          ? List<String>.from(json['languages'])
          : [],
      example: json['example'],
    );
  }
}
