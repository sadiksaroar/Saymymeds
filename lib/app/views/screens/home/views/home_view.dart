// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:get/get.dart';
// import 'package:saymymeds/app/core/app_routes/app_routes.dart';
// import 'package:saymymeds/app/utlies/apps_color.dart';
// import 'package:saymymeds/app/views/screens/home/controller/home_page_edit_profilecontroller.dart';
// import 'package:saymymeds/app/views/screens/home/views/screens/recently_scznned.dart';
// import 'package:saymymeds/app/widgets/BottomNav.dart';

// class HomeViewPage extends StatefulWidget {
//   @override
//   _HomeViewPageState createState() => _HomeViewPageState();
// }

// class _HomeViewPageState extends State<HomeViewPage> {
//   int _currentIndex = 0;
//   final ProfileController profileController = Get.put(ProfileController());

//   void _onNavTap(int index) {
//     setState(() {
//       _currentIndex = index;
//     });

//     switch (index) {
//       case 0:
//         context.go(AppRoutes.homeViewPage);
//         break;
//       case 1:
//         context.go(AppRoutes.imageScannerScreen);
//         break;
//       case 2:
//         context.go(AppRoutes.medication);
//         break;
//       case 3:
//         context.go(AppRoutes.settingPage);
//         break;
//     }
//   }

//   void _changeLanguage(String langCode) {
//     Map<String, Locale> languages = {
//       'English': const Locale('en', 'US'),
//       'Spanish': const Locale('es', 'ES'),
//       'French': const Locale('fr', 'FR'),
//       'Portugese': const Locale('pt', 'BR'),
//       'Creole': const Locale('ht', 'HT'),
//       'Russian': const Locale('ru', 'RU'),
//       'Chinese': const Locale('cn', 'CN'),
//     };

//     if (languages.containsKey(langCode)) {
//       Get.updateLocale(languages[langCode]!);
//     }
//   }

//   String _getCurrentLanguageName() {
//     final currentLocale = Get.locale?.toString() ?? '';

//     if (currentLocale.contains('en')) return 'English';
//     if (currentLocale.contains('es')) return 'Spanish';
//     if (currentLocale.contains('fr')) return 'French';
//     if (currentLocale.contains('pt')) return 'Portugese';
//     if (currentLocale.contains('ht')) return 'Creole';
//     if (currentLocale.contains('ru')) return 'Russian';
//     if (currentLocale.contains('cn') || currentLocale.contains('zh'))
//       return 'Chinese';

//     return 'English';
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Get the screen width
//     double screenWidth = MediaQuery.of(context).size.width;

//     // Set font sizes dynamically based on screen width
//     double scanMedicationFontSize = screenWidth < 360
//         ? 18
//         : 24; // smaller screens use smaller font size
//     double scanInstructionFontSize = screenWidth < 360 ? 12 : 14;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               const SizedBox(height: 25),

//               // ================= HEADER SECTION =================
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     // Left: Profile & Name
//                     Expanded(
//                       child: Row(
//                         children: [
//                           Obx(() {
//                             return CircleAvatar(
//                               radius: 24,
//                               backgroundImage:
//                                   profileController.image.value.isNotEmpty
//                                   ? NetworkImage(
//                                       profileController.getFullImageUrl(),
//                                     )
//                                   : const AssetImage("assets/images/eclipe.png")
//                                         as ImageProvider,
//                             );
//                           }),
//                           const SizedBox(width: 10),
//                           Flexible(
//                             child: Obx(() {
//                               return Text(
//                                 "${'hello'.tr}, ${profileController.getTruncatedName(15)}",
//                                 overflow: TextOverflow.ellipsis,
//                                 style: const TextStyle(
//                                   fontFamily: 'Poppins',
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 14,
//                                   color: Colors.black,
//                                 ),
//                               );
//                             }),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(width: 8),

//                     // Center: Language Dropdown
//                     Expanded(
//                       child: Container(
//                         height: 40,
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: AppColors.buttonColor),
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: DropdownButtonHideUnderline(
//                           child: DropdownButton<String>(
//                             dropdownColor: AppColors.whiteBackground,
//                             value: _getCurrentLanguageName(),
//                             isExpanded: true,
//                             icon: const Icon(Icons.expand_more_rounded),
//                             items: const [
//                               DropdownMenuItem(
//                                 value: 'English',
//                                 child: Text('English'),
//                               ),
//                               DropdownMenuItem(
//                                 value: 'Spanish',
//                                 child: Text('Spanish'),
//                               ),
//                               DropdownMenuItem(
//                                 value: 'French',
//                                 child: Text('French'),
//                               ),
//                               DropdownMenuItem(
//                                 value: "Portugese",
//                                 child: Text("Portugese"),
//                               ),
//                               DropdownMenuItem(
//                                 value: 'Creole',
//                                 child: Text('Creole'),
//                               ),
//                               DropdownMenuItem(
//                                 value: "Russian",
//                                 child: Text("Russian"),
//                               ),
//                               DropdownMenuItem(
//                                 value: "Chinese",
//                                 child: Text("Chinese"),
//                               ),
//                             ],
//                             onChanged: (v) {
//                               if (v != null) {
//                                 _changeLanguage(v);
//                               }
//                             },
//                           ),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(width: 8),

//                     // Right: Subscription Icon
//                     InkWell(
//                       onTap: () {
//                         context.push("/subscriptionCard");
//                       },
//                       child: Image.asset(
//                         "assets/icons/raja.png",
//                         width: 44,
//                         height: 44,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // ================= SCAN MEDICATION CARD =================
//               Container(
//                 height: 573,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   gradient: const LinearGradient(
//                     colors: [Color(0xFF4FAAA2), Color(0xFF4F85AA)],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             const Color.fromRGBO(248, 249, 251, 0),
//                             const Color.fromRGBO(79, 133, 170, 0.9),
//                           ],
//                         ),
//                       ),
//                       child: Stack(
//                         children: [
//                           Center(
//                             child: Image.asset(
//                               "assets/images/.png.png",
//                               height: 323,
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                           const Positioned(
//                             bottom: 30,
//                             left: 0,
//                             right: 0,
//                             child: Divider(thickness: 3.2, color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     Text(
//                       'scan_medication'.tr,
//                       style: TextStyle(
//                         color: const Color(0xFFF8F9FB),
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w600,
//                         fontSize: scanMedicationFontSize, // Dynamic font size
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     Text(
//                       'scan_instruction'.tr,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: const Color(0xFFF8F9FB),
//                         fontFamily: 'Open Sans',
//                         fontWeight: FontWeight.w400,
//                         fontSize: scanInstructionFontSize, // Dynamic font size
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     ElevatedButton.icon(
//                       onPressed: () => context.push("/imageScannerScreen"),
//                       icon: const Icon(Icons.qr_code_scanner, size: 50),
//                       label: Text(
//                         'scan_button'.tr,
//                         style: const TextStyle(
//                           color: Color(0xFF333333),
//                           fontFamily: 'Open Sans',
//                           fontWeight: FontWeight.w600,
//                           fontSize: 40,
//                         ),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.white,
//                         foregroundColor: Colors.black,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         minimumSize: const Size(320, 84),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 30),

//               // ================= RECENTLY SCANNED SECTION =================
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text(
//                       'recently_scanned'.tr,
//                       style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 700, child: const RecentlyScznned()),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),

//       // ================= BOTTOM NAVIGATION =================
//       bottomNavigationBar: CustomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: _onNavTap,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:saymymeds/app/core/app_routes/app_routes.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/screens/home/controller/home_page_edit_profilecontroller.dart';
import 'package:saymymeds/app/views/screens/home/controller/recently_scenned_controller.dart';
import 'package:saymymeds/app/views/screens/home/views/screens/recently_scznned.dart';
import 'package:saymymeds/app/views/screens/medications/controler/check_info_controller/cheak_info_controller.dart';
import 'package:saymymeds/app/widgets/BottomNav.dart';
import 'package:saymymeds/app/views/screens/medications/controler/MedicationController/meddication_controller.dart';

class HomeViewPage extends StatefulWidget {
  @override
  _HomeViewPageState createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  int _currentIndex = 0;
  final ProfileController profileController = Get.put(ProfileController());

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

  void _changeLanguage(String langCode) {
    Map<String, Locale> languages = {
      'English': const Locale('en', 'US'),
      'Spanish': const Locale('es', 'ES'),
      'French': const Locale('fr', 'FR'),
      'Portugese': const Locale('pt', 'BR'),
      'Creole': const Locale('ht', 'HT'),
      'Russian': const Locale('ru', 'RU'),
      'Chinese': const Locale('zh', 'CN'),
    };

    if (languages.containsKey(langCode)) {
      Get.updateLocale(languages[langCode]!);

      // ✅ Sync language to all controllers
      _syncLanguageToAllControllers(langCode);

      print('🌍 Global language changed to: $langCode');
    }
  }

  // ✅ New function to sync language to all controllers
  void _syncLanguageToAllControllers(String displayLanguageName) {
    try {
      final langCode = _getLanguageCode(displayLanguageName);

      // Medication Controller
      if (Get.isRegistered<MedicationController>()) {
        final medController = Get.find<MedicationController>();
        medController.changeLanguage(displayLanguageName);
      }

      // Recently Scanned Controller
      if (Get.isRegistered<RecentlyScannedController>()) {
        final recentController = Get.find<RecentlyScannedController>();
        recentController.updateLanguage(langCode);
      }

      // CheckInfo Controller (যদি বর্তমানে খোলা থাকে)
      if (Get.isRegistered<CheckInfoController>()) {
        final checkInfoController = Get.find<CheckInfoController>();
        checkInfoController.updateGlobalLanguage(langCode);
      }

      print(
        '✅ All controllers synced with language: $displayLanguageName ($langCode)',
      );
    } catch (e) {
      print('⚠️ Error syncing language: $e');
    }
  }

  // ✅ Helper function to convert display name to language code
  String _getLanguageCode(String displayName) {
    final Map<String, String> codes = {
      'English': 'en',
      'Spanish': 'es',
      'French': 'fr',
      'Portugese': 'pt',
      'Creole': 'ht',
      'Russian': 'ru',
      'Chinese': 'zh-CN',
    };
    return codes[displayName] ?? 'en';
  }

  String _getCurrentLanguageName() {
    final currentLocale = Get.locale?.toString() ?? '';

    if (currentLocale.contains('en')) return 'English';
    if (currentLocale.contains('es')) return 'Spanish';
    if (currentLocale.contains('fr')) return 'French';
    if (currentLocale.contains('pt')) return 'Portugese';
    if (currentLocale.contains('ht')) return 'Creole';
    if (currentLocale.contains('ru')) return 'Russian';
    if (currentLocale.contains('cn') || currentLocale.contains('zh'))
      return 'Chinese';

    return 'English';
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Set font sizes dynamically based on screen width
    double scanMedicationFontSize = screenWidth < 360
        ? 18
        : 24; // smaller screens use smaller font size
    double scanInstructionFontSize = screenWidth < 360 ? 12 : 14;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 25),

              // ================= HEADER SECTION =================
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Left: Profile & Name
                    Expanded(
                      child: Row(
                        children: [
                          Obx(() {
                            return CircleAvatar(
                              radius: 24,
                              backgroundImage:
                                  profileController.image.value.isNotEmpty
                                  ? NetworkImage(
                                      profileController.getFullImageUrl(),
                                    )
                                  : const AssetImage("assets/images/eclipe.png")
                                        as ImageProvider,
                            );
                          }),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Obx(() {
                              return Text(
                                "${'hello'.tr}, ${profileController.getTruncatedName(15)}",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Center: Language Dropdown
                    Expanded(
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.buttonColor),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: AppColors.whiteBackground,
                            value: _getCurrentLanguageName(),
                            isExpanded: true,
                            icon: const Icon(Icons.expand_more_rounded),
                            items: const [
                              DropdownMenuItem(
                                value: 'English',
                                child: Text('English'),
                              ),
                              DropdownMenuItem(
                                value: 'Spanish',
                                child: Text('Spanish'),
                              ),
                              DropdownMenuItem(
                                value: 'French',
                                child: Text('French'),
                              ),
                              DropdownMenuItem(
                                value: "Portugese",
                                child: Text("Portugese"),
                              ),
                              DropdownMenuItem(
                                value: 'Creole',
                                child: Text('Creole'),
                              ),
                              DropdownMenuItem(
                                value: "Russian",
                                child: Text("Russian"),
                              ),
                              DropdownMenuItem(
                                value: "Chinese",
                                child: Text("Chinese"),
                              ),
                            ],
                            onChanged: (v) {
                              if (v != null) {
                                _changeLanguage(v);
                              }
                            },
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    // Right: Subscription Icon
                    InkWell(
                      onTap: () {
                        context.push("/subscriptionCard");
                      },
                      child: Image.asset(
                        "assets/icons/raja.png",
                        width: 44,
                        height: 44,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ================= SCAN MEDICATION CARD =================
              Container(
                height: 573,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4FAAA2), Color(0xFF4F85AA)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color.fromRGBO(248, 249, 251, 0),
                            const Color.fromRGBO(79, 133, 170, 0.9),
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              "assets/images/.png.png",
                              height: 323,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Positioned(
                            bottom: 30,
                            left: 0,
                            right: 0,
                            child: Divider(thickness: 3.2, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'scan_medication'.tr,
                      style: TextStyle(
                        color: const Color(0xFFF8F9FB),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: scanMedicationFontSize, // Dynamic font size
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'scan_instruction'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFF8F9FB),
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: scanInstructionFontSize, // Dynamic font size
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () => context.push("/imageScannerScreen"),
                      icon: const Icon(Icons.qr_code_scanner, size: 50),
                      label: Text(
                        'scan_button'.tr,
                        style: const TextStyle(
                          color: Color(0xFF333333),
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 40,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: const Size(320, 84),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ================= RECENTLY SCANNED SECTION =================
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'recently_scanned'.tr,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 700, child: const RecentlyScznned()),
                ],
              ),
            ],
          ),
        ),
      ),

      // ================= BOTTOM NAVIGATION =================
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
