// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:saymymeds/app/core/app_routes/app_routes.dart';
// import 'package:saymymeds/app/utlies/apps_color.dart';
// import 'package:saymymeds/app/views/screens/view_details/MedicineApiService/medicineApiService_c.dart';
// import 'package:saymymeds/app/views/screens/view_details/medication_preview_model/medication_preview.dart';
// import 'package:get/get.dart';
// import 'package:saymymeds/app/widgets/BottomNav.dart';

// class MedicineDetailPage extends StatefulWidget {
//   const MedicineDetailPage({super.key, MedicationPreviewModel? preview});

//   @override
//   State<MedicineDetailPage> createState() => _MedicineDetailPageState();

//   static Widget _sectionTitle(String t) => Padding(
//     padding: const EdgeInsets.only(top: 12),
//     child: Text(
//       t,
//       style: const TextStyle(
//         fontSize: 24,
//         fontWeight: FontWeight.w600,90
//         color: Color(0xFF333333),
//       ),
//     ),
//   );

//   static Widget _sectionValue(String v) => Padding(
//     padding: const EdgeInsets.only(top: 6),
//     child: Text(
//       v,
//       style: const TextStyle(fontSize: 20, height: 1.35, color: Colors.grey),
//     ),
//   );

//   static Widget _bullet(String v) => Padding(
//     padding: const EdgeInsets.only(top: 8),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.only(top: 6),
//           child: Icon(Icons.circle, size: 6, color: Colors.grey),
//         ),
//         const SizedBox(width: 8),
//         Expanded(
//           child: Text(
//             v,
//             style: const TextStyle(
//               fontSize: 20,
//               height: 1.4,
//               color: Color(0xFF848484),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );

//   static Widget _bulleter(String v) => Padding(
//     padding: const EdgeInsets.only(top: 8),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(width: 8),
//         Expanded(
//           child: Text(
//             v,
//             style: const TextStyle(
//               fontSize: 20,
//               height: 1.4,
//               color: Color(0xFF848484),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );

//   static Widget _divider(Color c) => const Padding(
//     padding: EdgeInsets.only(top: 12),
//     child: Divider(color: Color(0xFF4F85AA), thickness: 1),
//   );
// }

// class _MedicineDetailPageState extends State<MedicineDetailPage> {
//   @override
//   Widget build(BuildContext context) {
//     final MedicineController controller = Get.find<MedicineController>();
//     const divider = Color(0xFF4F85AA);
//     const blue = Color(0xFF4F85AA);

//     int _currentIndex = 0;

//     void _onNavTap(int index) {
//       setState(() {
//         _currentIndex = index;
//       });
//       switch (index) {
//         case 0:
//           context.go(AppRoutes.homeViewPage);
//           break;
//         case 1:
//           context.go(AppRoutes.imageScannerScreen);
//           break;
//         case 2:
//           context.go(AppRoutes.medication);
//           break;
//         case 3:
//           context.go(AppRoutes.settingPage);
//           break;
//       }
//     }

//     return Container(
//       padding: const EdgeInsets.all(10),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           child: Center(
//             child: ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: 430),
//               child: Obx(() {
//                 if (controller.medicationData.value == null) {
//                   return const Center(
//                     child: Text('No medication data available'),
//                   );
//                 }

//                 final data = controller.medicationData.value!;
//                 final analysis = data.aiAnalysis;

//                 return Stack(
//                   children: [
//                     SingleChildScrollView(
//                       child: Container(
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             begin: Alignment(0.10, -1.00),
//                             end: Alignment(0.10, 1.00),
//                             colors: [
//                               const Color(0xFF4F85AA),
//                               const Color(0xFFF8F9FB),
//                               const Color(0xFFF8F9FB),
//                               const Color(0xFFF8F9FB),
//                               const Color(0xFFF8F9FB),
//                             ],
//                           ),
//                         ),
//                         child: Column(
//                           children: [
//                             // Top bar
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                 children: [
//                                   IconButton(
//                                     icon: Image.asset(
//                                       "assets/icons/Back_Icon.png",
//                                       width: 44,
//                                       height: 44,
//                                     ),
//                                     onPressed: () =>
//                                         Navigator.maybePop(context),
//                                   ),
//                                   const Spacer(),
//                                   Container(
//                                     width: 157,
//                                     height: 40,
//                                     padding: const EdgeInsets.symmetric(
//                                       horizontal: 10,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     child: DropdownButtonHideUnderline(
//                                       child: DropdownButton<String>(
//                                         value: controller.languageMap.keys
//                                             .firstWhere(
//                                               (key) =>
//                                                   controller.languageMap[key] ==
//                                                   controller
//                                                       .selectedLanguage
//                                                       .value,
//                                               orElse: () => 'English',
//                                             ),
//                                         isExpanded: true,
//                                         icon: const Icon(
//                                           Icons.expand_more_rounded,
//                                         ),
//                                         items: controller.languageMap.keys.map((
//                                           String language,
//                                         ) {
//                                           return DropdownMenuItem(
//                                             value: language,
//                                             child: Text(
//                                               language,
//                                               overflow: TextOverflow.ellipsis,
//                                             ),
//                                           );
//                                         }).toList(),
//                                         onChanged: (String? newValue) {
//                                           if (newValue != null) {
//                                             controller.changeLanguage(
//                                               newValue,
//                                               context,
//                                             );
//                                           }
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(height: 16),

//                             // Main card
//                             Container(
//                               padding: const EdgeInsets.fromLTRB(
//                                 12,
//                                 12,
//                                 12,
//                                 18,
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     padding: const EdgeInsets.all(12),
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                         color: const Color(0xFFC8D9E5),
//                                         width: 2,
//                                       ),
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           // Image area
//                                           SizedBox(
//                                             width: 360,
//                                             height: 180,
//                                             child: Padding(
//                                               padding: const EdgeInsets.all(10),
//                                               child: Container(
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(12),
//                                                   color: const Color(
//                                                     0xFFF8F9FB,
//                                                   ),
//                                                 ),
//                                                 child: Center(
//                                                   child: ClipRRect(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                           12,
//                                                         ),
//                                                     child:
//                                                         controller
//                                                             .currentImageUrl
//                                                             .isNotEmpty
//                                                         ? Image.network(
//                                                             controller
//                                                                 .currentImageUrl,
//                                                             width: 160,
//                                                             height: 170,
//                                                             fit: BoxFit.contain,
//                                                             errorBuilder:
//                                                                 (
//                                                                   _,
//                                                                   __,
//                                                                   ___,
//                                                                 ) => const Icon(
//                                                                   Icons
//                                                                       .medication_outlined,
//                                                                   size: 72,
//                                                                 ),
//                                                           )
//                                                         : const Icon(
//                                                             Icons
//                                                                 .medication_outlined,
//                                                             size: 72,
//                                                           ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           const SizedBox(height: 12),

//                                           // Play button
//                                           SizedBox(
//                                             height: 100,
//                                             width: 360,
//                                             child: ElevatedButton.icon(
//                                               onPressed: () => controller
//                                                   .toggleAudio(context),
//                                               icon: Container(
//                                                 width: 50,
//                                                 height: 50,
//                                                 decoration: const BoxDecoration(
//                                                   color: Colors.white,
//                                                   shape: BoxShape.circle,
//                                                 ),
//                                                 child: Icon(
//                                                   controller.isPlaying.value
//                                                       ? Icons.pause_rounded
//                                                       : Icons
//                                                             .play_arrow_rounded,
//                                                   color: const Color(
//                                                     0xFF4F85AA,
//                                                   ),
//                                                   size: 50,
//                                                 ),
//                                               ),
//                                               label: Text(
//                                                 controller.isPlaying.value
//                                                     ? 'Pause'
//                                                     : 'Play',
//                                                 style: const TextStyle(
//                                                   fontSize: 40,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//                                               style: ElevatedButton.styleFrom(
//                                                 backgroundColor: const Color(
//                                                   0xFF4F85AA,
//                                                 ),
//                                                 foregroundColor: Colors.white,
//                                                 shape: RoundedRectangleBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(14),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           const SizedBox(height: 12),

//                                           // Title
//                                           Text(
//                                             analysis?.brandName ?? 'Unknown',
//                                             style: const TextStyle(
//                                               fontSize: 30,
//                                               fontWeight: FontWeight.w600,
//                                               color: AppColors.primary,
//                                             ),
//                                           ),
//                                           const SizedBox(height: 8),

//                                           // Pills count
//                                           if (analysis?.totPills != null)
//                                             Text(
//                                               '(${analysis!.totPills} Pills)',
//                                               style: const TextStyle(
//                                                 fontSize: 20,
//                                                 fontWeight: FontWeight.w600,
//                                                 color: blue,
//                                               ),
//                                             ),
//                                           const SizedBox(height: 10),
//                                           MedicineDetailPage._divider(divider),

//                                           // Info sections
//                                           MedicineDetailPage._sectionTitle(
//                                             'Generic Name',
//                                           ),
//                                           MedicineDetailPage._sectionValue(
//                                             analysis?.genericName ?? 'N/A',
//                                           ),
//                                           MedicineDetailPage._divider(divider),

//                                           MedicineDetailPage._sectionTitle(
//                                             'Brand Name',
//                                           ),
//                                           MedicineDetailPage._sectionValue(
//                                             analysis?.brandName ?? 'N/A',
//                                           ),
//                                           MedicineDetailPage._divider(divider),

//                                           MedicineDetailPage._sectionTitle(
//                                             'Manufacturer',
//                                           ),
//                                           MedicineDetailPage._sectionValue(
//                                             analysis?.manufacturer ?? 'N/A',
//                                           ),
//                                           MedicineDetailPage._divider(divider),

//                                           MedicineDetailPage._sectionTitle(
//                                             'Drug Class',
//                                           ),
//                                           MedicineDetailPage._sectionValue(
//                                             analysis?.drugClass ?? 'N/A',
//                                           ),
//                                           MedicineDetailPage._divider(divider),

//                                           MedicineDetailPage._sectionTitle(
//                                             'Uses',
//                                           ),
//                                           MedicineDetailPage._sectionValue(
//                                             analysis?.uses ?? 'N/A',
//                                           ),
//                                           MedicineDetailPage._divider(divider),

//                                           MedicineDetailPage._sectionTitle(
//                                             'Dosage Information',
//                                           ),
//                                           const SizedBox(height: 6),
//                                           if (analysis?.dosageInformation !=
//                                               null) ...[
//                                             MedicineDetailPage._bulleter(
//                                               'Adults: ${analysis!.dosageInformation!.adultsDosage ?? "N/A"}',
//                                             ),
//                                             MedicineDetailPage._bulleter(
//                                               'Children: ${analysis.dosageInformation!.childrenDosage ?? "N/A"}',
//                                             ),
//                                             MedicineDetailPage._bulleter(
//                                               'Elderly: ${analysis.dosageInformation!.elderlyDosage ?? "N/A"}',
//                                             ),
//                                           ],
//                                           MedicineDetailPage._divider(divider),

//                                           MedicineDetailPage._sectionTitle(
//                                             'How to Take',
//                                           ),
//                                           MedicineDetailPage._bullet(
//                                             analysis?.howToTake ?? 'N/A',
//                                           ),
//                                           MedicineDetailPage._divider(divider),

//                                           MedicineDetailPage._sectionTitle(
//                                             'Side Effects',
//                                           ),
//                                           if (analysis?.sideEffects !=
//                                               null) ...[
//                                             MedicineDetailPage._bullet(
//                                               'Common: ${analysis!.sideEffects!.common ?? "N/A"}',
//                                             ),
//                                             MedicineDetailPage._bullet(
//                                               'Serious: ${analysis.sideEffects!.serious ?? "N/A"}',
//                                             ),
//                                           ],
//                                           MedicineDetailPage._divider(divider),

//                                           MedicineDetailPage._sectionTitle(
//                                             'Warnings',
//                                           ),
//                                           MedicineDetailPage._bullet(
//                                             analysis?.warnings ?? 'N/A',
//                                           ),
//                                           MedicineDetailPage._divider(divider),

//                                           MedicineDetailPage._sectionTitle(
//                                             'Storage Instructions',
//                                           ),
//                                           MedicineDetailPage._bullet(
//                                             analysis?.storageInstructions ??
//                                                 'N/A',
//                                           ),
//                                           MedicineDetailPage._divider(divider),

//                                           MedicineDetailPage._sectionTitle(
//                                             'Interactions',
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.only(
//                                               top: 6,
//                                             ),
//                                             child: Text(
//                                               analysis?.interactions ?? 'N/A',
//                                               style: const TextStyle(
//                                                 fontSize: 20,
//                                                 height: 1.4,
//                                                 color: Colors.grey,
//                                               ),
//                                             ),
//                                           ),

//                                           MedicineDetailPage._sectionTitle(
//                                             'Add notes',
//                                           ),
//                                           const SizedBox(height: 10),
//                                           Container(
//                                             height: 80,
//                                             width: 360,
//                                             decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               border: Border.all(
//                                                 color: Colors.grey,
//                                               ),
//                                               borderRadius:
//                                                   const BorderRadius.all(
//                                                     Radius.circular(8),
//                                                   ),
//                                             ),
//                                             child: Padding(
//                                               padding: const EdgeInsets.all(
//                                                 10.0,
//                                               ),
//                                               child: Row(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.center,
//                                                 children: [
//                                                   Expanded(
//                                                     child: TextField(
//                                                       onChanged: (value) =>
//                                                           controller
//                                                               .updateNotes(
//                                                                 value,
//                                                               ),
//                                                       decoration:
//                                                           const InputDecoration(
//                                                             hintText:
//                                                                 "Add notes",
//                                                             hintStyle:
//                                                                 TextStyle(
//                                                                   color: Colors
//                                                                       .grey,
//                                                                 ),
//                                                             border: InputBorder
//                                                                 .none,
//                                                           ),
//                                                     ),
//                                                   ),
//                                                   const Padding(
//                                                     padding: EdgeInsets.only(
//                                                       top: 3.0,
//                                                     ),
//                                                     child: Icon(
//                                                       Icons.edit,
//                                                       size: 30,
//                                                       color: Colors.grey,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(height: 0.5),

//                             // Save button
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: SizedBox(
//                                 width: double.infinity,
//                                 height: 48,
//                                 child: ElevatedButton(
//                                   onPressed: () => controller.saveMedication(
//                                     controller.medicationData.value!
//                                         as BuildContext,
//                                   ),
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: const Color(0xFF4F85AA),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                   ),
//                                   child: const Text(
//                                     'Save',
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 60),
//                           ],
//                         ),
//                       ),
//                     ),

//                     // Loading indicator
//                     if (controller.isLoading.value)
//                       Container(
//                         color: Colors.black.withOpacity(0.5),
//                         child: const Center(
//                           child: CircularProgressIndicator(color: Colors.white),
//                         ),
//                       ),
//                   ],
//                 );
//               }),
//             ),
//           ),
//         ),
//         bottomNavigationBar: CustomNavigationBar(
//           currentIndex: _currentIndex,
//           onTap: _onNavTap,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saymymeds/app/core/app_routes/app_routes.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/screens/view_details/medicaton_controlr/medication_controller.dart';
import 'package:saymymeds/app/views/screens/view_details/medication_preview_model/medication_preview.dart';
import 'package:get/get.dart';
import 'package:saymymeds/app/widgets/BottomNav.dart';

class MedicineDetailPage extends StatefulWidget {
  const MedicineDetailPage({super.key, MedicationPreviewModel? preview});

  @override
  State<MedicineDetailPage> createState() => _MedicineDetailPageState();

  static Widget _sectionTitle(String t) => Padding(
    padding: const EdgeInsets.only(top: 12),
    child: Text(
      t,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Color(0xFF333333),
      ),
    ),
  );

  static Widget _sectionValue(String v) => Padding(
    padding: const EdgeInsets.only(top: 6),
    child: Text(
      v,
      style: const TextStyle(fontSize: 20, height: 1.35, color: Colors.grey),
    ),
  );

  static Widget _bullet(String v) => Padding(
    padding: const EdgeInsets.only(top: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 6),
          child: Icon(Icons.circle, size: 6, color: Colors.grey),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            v,
            style: const TextStyle(
              fontSize: 20,
              height: 1.4,
              color: Color(0xFF848484),
            ),
          ),
        ),
      ],
    ),
  );

  static Widget _bulleter(String v) => Padding(
    padding: const EdgeInsets.only(top: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            v,
            style: const TextStyle(
              fontSize: 20,
              height: 1.4,
              color: Color(0xFF848484),
            ),
          ),
        ),
      ],
    ),
  );

  static Widget _divider(Color c) => const Padding(
    padding: EdgeInsets.only(top: 12),
    child: Divider(color: Color(0xFF4F85AA), thickness: 1),
  );
}

class _MedicineDetailPageState extends State<MedicineDetailPage> {
  @override
  Widget build(BuildContext context) {
    final MedicineController controller = Get.find<MedicineController>();
    const divider = Color(0xFF4F85AA);
    const blue = Color(0xFF4F85AA);

    int _currentIndex = 0;

    void _onNavTap(int index) {
      setState(() {
        _currentIndex = index;
      });
      switch (index) {
        case 0:
          context.go(AppRoutes.homeViewPage);
          break;
        case 1:
          context.go(AppRoutes.imageScannerScreen);
          break;
        case 2:
          context.go(AppRoutes.medication);
          break;
        case 3:
          context.go(AppRoutes.settingPage);
          break;
      }
    }

    return Container(
      padding: const EdgeInsets.all(10),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: Obx(() {
                if (controller.medicationData.value == null) {
                  return const Center(
                    child: Text('No medication data available'),
                  );
                }

                final data = controller.medicationData.value!;
                final analysis = data.aiAnalysis;

                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.10, -1.00),
                            end: Alignment(0.10, 1.00),
                            colors: [
                              const Color(0xFF4F85AA),
                              const Color(0xFFF8F9FB),
                              const Color(0xFFF8F9FB),
                              const Color(0xFFF8F9FB),
                              const Color(0xFFF8F9FB),
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            // Top bar
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Image.asset(
                                      "assets/icons/Back_Icon.png",
                                      width: 44,
                                      height: 44,
                                    ),
                                    onPressed: () =>
                                        Navigator.maybePop(context),
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: 157,
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: controller.languageMap.keys
                                            .firstWhere(
                                              (key) =>
                                                  controller.languageMap[key] ==
                                                  controller
                                                      .selectedLanguage
                                                      .value,
                                              orElse: () => 'English',
                                            ),
                                        isExpanded: true,
                                        icon: const Icon(
                                          Icons.expand_more_rounded,
                                        ),
                                        items: controller.languageMap.keys.map((
                                          String language,
                                        ) {
                                          return DropdownMenuItem(
                                            value: language,
                                            child: Text(
                                              language,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          if (newValue != null) {
                                            controller.changeLanguage(
                                              newValue,
                                              context,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Main card
                            Container(
                              padding: const EdgeInsets.fromLTRB(
                                12,
                                12,
                                12,
                                18,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xFFC8D9E5),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Image area
                                          SizedBox(
                                            width: 360,
                                            height: 180,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: const Color(
                                                    0xFFF8F9FB,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                    child:
                                                        controller
                                                            .currentImageUrl
                                                            .isNotEmpty
                                                        ? Image.network(
                                                            controller
                                                                .currentImageUrl,
                                                            width: 160,
                                                            height: 170,
                                                            fit: BoxFit.contain,
                                                            errorBuilder:
                                                                (
                                                                  _,
                                                                  __,
                                                                  ___,
                                                                ) => const Icon(
                                                                  Icons
                                                                      .medication_outlined,
                                                                  size: 72,
                                                                ),
                                                          )
                                                        : const Icon(
                                                            Icons
                                                                .medication_outlined,
                                                            size: 72,
                                                          ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 12),

                                          // Play button
                                          SizedBox(
                                            height: 100,
                                            width: 360,
                                            child: ElevatedButton.icon(
                                              onPressed: () => controller
                                                  .toggleAudio(context),
                                              icon: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  controller.isPlaying.value
                                                      ? Icons.pause_rounded
                                                      : Icons
                                                            .play_arrow_rounded,
                                                  color: const Color(
                                                    0xFF4F85AA,
                                                  ),
                                                  size: 50,
                                                ),
                                              ),
                                              label: Text(
                                                controller.isPlaying.value
                                                    ? 'Pause'
                                                    : 'Play',
                                                style: const TextStyle(
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color(
                                                  0xFF4F85AA,
                                                ),
                                                foregroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 12),

                                          // Title
                                          Text(
                                            analysis?.brandName ?? 'Unknown',
                                            style: const TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          const SizedBox(height: 8),

                                          // Pills count
                                          if (analysis?.totPills != null)
                                            Text(
                                              '(${analysis!.totPills} Pills)',
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: blue,
                                              ),
                                            ),
                                          const SizedBox(height: 10),
                                          MedicineDetailPage._divider(divider),

                                          // Info sections
                                          MedicineDetailPage._sectionTitle(
                                            'Generic Name',
                                          ),
                                          MedicineDetailPage._sectionValue(
                                            analysis?.genericName ?? 'N/A',
                                          ),
                                          MedicineDetailPage._divider(divider),

                                          MedicineDetailPage._sectionTitle(
                                            'Brand Name',
                                          ),
                                          MedicineDetailPage._sectionValue(
                                            analysis?.brandName ?? 'N/A',
                                          ),
                                          MedicineDetailPage._divider(divider),

                                          MedicineDetailPage._sectionTitle(
                                            'Manufacturer',
                                          ),
                                          MedicineDetailPage._sectionValue(
                                            analysis?.manufacturer ?? 'N/A',
                                          ),
                                          MedicineDetailPage._divider(divider),

                                          MedicineDetailPage._sectionTitle(
                                            'Drug Class',
                                          ),
                                          MedicineDetailPage._sectionValue(
                                            analysis?.drugClass ?? 'N/A',
                                          ),
                                          MedicineDetailPage._divider(divider),

                                          MedicineDetailPage._sectionTitle(
                                            'Uses',
                                          ),
                                          MedicineDetailPage._sectionValue(
                                            analysis?.uses ?? 'N/A',
                                          ),
                                          MedicineDetailPage._divider(divider),

                                          MedicineDetailPage._sectionTitle(
                                            'Dosage Information',
                                          ),
                                          const SizedBox(height: 6),
                                          if (analysis?.dosageInformation !=
                                              null) ...[
                                            MedicineDetailPage._bulleter(
                                              'Adults: ${analysis!.dosageInformation!.adultsDosage ?? "N/A"}',
                                            ),
                                            MedicineDetailPage._bulleter(
                                              'Children: ${analysis.dosageInformation!.childrenDosage ?? "N/A"}',
                                            ),
                                            MedicineDetailPage._bulleter(
                                              'Elderly: ${analysis.dosageInformation!.elderlyDosage ?? "N/A"}',
                                            ),
                                          ],
                                          MedicineDetailPage._divider(divider),

                                          MedicineDetailPage._sectionTitle(
                                            'How to Take',
                                          ),
                                          MedicineDetailPage._bullet(
                                            analysis?.howToTake ?? 'N/A',
                                          ),
                                          MedicineDetailPage._divider(divider),

                                          MedicineDetailPage._sectionTitle(
                                            'Side Effects',
                                          ),
                                          if (analysis?.sideEffects !=
                                              null) ...[
                                            MedicineDetailPage._bullet(
                                              'Common: ${analysis!.sideEffects!.common ?? "N/A"}',
                                            ),
                                            MedicineDetailPage._bullet(
                                              'Serious: ${analysis.sideEffects!.serious ?? "N/A"}',
                                            ),
                                          ],
                                          MedicineDetailPage._divider(divider),

                                          MedicineDetailPage._sectionTitle(
                                            'Warnings',
                                          ),
                                          MedicineDetailPage._bullet(
                                            analysis?.warnings ?? 'N/A',
                                          ),
                                          MedicineDetailPage._divider(divider),

                                          MedicineDetailPage._sectionTitle(
                                            'Storage Instructions',
                                          ),
                                          MedicineDetailPage._bullet(
                                            analysis?.storageInstructions ??
                                                'N/A',
                                          ),
                                          MedicineDetailPage._divider(divider),

                                          MedicineDetailPage._sectionTitle(
                                            'Interactions',
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 6,
                                            ),
                                            child: Text(
                                              analysis?.interactions ?? 'N/A',
                                              style: const TextStyle(
                                                fontSize: 20,
                                                height: 1.4,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),

                                          MedicineDetailPage._sectionTitle(
                                            'Add notes',
                                          ),
                                          const SizedBox(height: 10),
                                          Container(
                                            height: 80,
                                            width: 360,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: Colors.grey,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                    Radius.circular(8),
                                                  ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                10.0,
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: TextField(
                                                      onChanged: (value) =>
                                                          controller
                                                              .updateNotes(
                                                                value,
                                                              ),
                                                      decoration:
                                                          const InputDecoration(
                                                            hintText:
                                                                "Add notes",
                                                            hintStyle:
                                                                TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                      top: 3.0,
                                                    ),
                                                    child: Icon(
                                                      Icons.edit,
                                                      size: 30,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 0.5),

                            // Save button - FIXED
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: ElevatedButton(
                                  onPressed: () =>
                                      controller.saveMedication(context),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF4F85AA),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text(
                                    'Save',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 60),
                          ],
                        ),
                      ),
                    ),

                    // Loading indicator
                    if (controller.isLoading.value)
                      Container(
                        color: Colors.black.withOpacity(0.5),
                        child: const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                      ),
                  ],
                );
              }),
            ),
          ),
        ),
        bottomNavigationBar: CustomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onNavTap,
        ),
      ),
    );
  }
}
