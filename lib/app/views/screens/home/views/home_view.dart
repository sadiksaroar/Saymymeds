// // import 'package:flutter/material.dart';
// // import 'package:go_router/go_router.dart';
// // import 'package:get/get.dart';
// // import 'package:saymymeds/app/core/app_routes/app_routes.dart';
// // import 'package:saymymeds/app/utlies/apps_color.dart';
// // import 'package:saymymeds/app/views/screens/home/controller/home_page_edit_profilecontroller.dart';
// // import 'package:saymymeds/app/views/screens/home/views/screens/recently_scznned.dart';
// // import 'package:saymymeds/app/widgets/BottomNav.dart';

// // class HomeViewPage extends StatefulWidget {
// //   const HomeViewPage({super.key});

// //   @override
// //   State<HomeViewPage> createState() => _HomeViewPageState();
// // }

// // class _HomeViewPageState extends State<HomeViewPage> {
// //   int _currentIndex = 0;
// //   String lang = 'English';
// //   final ProfileController profileController = Get.put(ProfileController());

// //   void _onNavTap(int index) {
// //     setState(() {
// //       _currentIndex = index;
// //     });

// //     switch (index) {
// //       case 0:
// //         context.go(AppRoutes.homeViewPage);
// //         break;
// //       case 1:
// //         context.go(AppRoutes.imageScannerScreen);
// //         break;
// //       case 2:
// //         context.go(AppRoutes.medication);
// //         break;
// //       case 3:
// //         context.go(AppRoutes.settingPage);
// //         break;
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: const EdgeInsets.all(10.0),
// //           child: Column(
// //             children: [
// //               const SizedBox(height: 25),

// //               /// ================= HEADER SECTION =================
// //               Padding(
// //                 padding: const EdgeInsets.all(10.0),
// //                 child: Row(
// //                   crossAxisAlignment: CrossAxisAlignment.center,
// //                   children: [
// //                     /// ✅ Left: Profile & Name
// //                     Expanded(
// //                       child: Row(
// //                         children: [
// //                           Obx(() {
// //                             return CircleAvatar(
// //                               radius: 24,
// //                               backgroundImage:
// //                                   profileController.image.value.isNotEmpty
// //                                   ? NetworkImage(
// //                                       profileController.getFullImageUrl(),
// //                                     )
// //                                   : const AssetImage("assets/images/eclipe.png")
// //                                         as ImageProvider,
// //                             );
// //                           }),
// //                           const SizedBox(width: 10),
// //                           Flexible(
// //                             child: Obx(() {
// //                               return Text(
// //                                 "Hello, ${profileController.getTruncatedName(15)}",
// //                                 overflow: TextOverflow.ellipsis,
// //                                 style: const TextStyle(
// //                                   fontFamily: 'Poppins',
// //                                   fontWeight: FontWeight.w600,
// //                                   fontSize: 14,
// //                                   color: Colors.black,
// //                                 ),
// //                               );
// //                             }),
// //                           ),
// //                         ],
// //                       ),
// //                     ),

// //                     const SizedBox(width: 8),

// //                     /// ✅ Center: Language Dropdown
// //                     Container(
// //                       width: 115,
// //                       height: 40,
// //                       padding: const EdgeInsets.symmetric(horizontal: 10),
// //                       decoration: BoxDecoration(
// //                         border: Border.all(color: AppColors.buttonColor),
// //                         color: Colors.white,
// //                         borderRadius: BorderRadius.circular(12),
// //                       ),
// //                       child: DropdownButtonHideUnderline(
// //                         child: DropdownButton<String>(
// //                           dropdownColor: AppColors.whiteBackground,
// //                           value: lang,
// //                           isExpanded: true,
// //                           icon: const Icon(Icons.expand_more_rounded),
// //                           items: const [
// //                             DropdownMenuItem(
// //                               value: 'English',
// //                               child: Text('English'),
// //                             ),
// //                             DropdownMenuItem(
// //                               value: 'Spanish',
// //                               child: Text(
// //                                 'Spanish (Español)',
// //                                 overflow: TextOverflow.ellipsis,
// //                               ),
// //                             ),
// //                             DropdownMenuItem(
// //                               value: 'French',
// //                               child: Text(
// //                                 'French (Français)',
// //                                 overflow: TextOverflow.ellipsis,
// //                               ),
// //                             ),
// //                             DropdownMenuItem(
// //                               value: "Portugese",
// //                               child: Text("Portugese"),
// //                             ),
// //                             DropdownMenuItem(
// //                               value: 'Creole',
// //                               child: Text('Creole'),
// //                             ),
// //                             DropdownMenuItem(
// //                               value: "Russian",
// //                               child: Text("Russian"),
// //                             ),
// //                             DropdownMenuItem(
// //                               value: "Chinese",
// //                               child: Text("Chinese"),
// //                             ),
// //                           ],
// //                           onChanged: (v) {
// //                             setState(() {
// //                               lang = v ?? 'English';
// //                             });
// //                           },
// //                         ),
// //                       ),
// //                     ),

// //                     const SizedBox(width: 8),

// //                     /// ✅ Right: Subscription Icon
// //                     InkWell(
// //                       onTap: () {
// //                         context.push("/subscriptionCard");
// //                       },
// //                       child: Image.asset(
// //                         "assets/icons/raja.png",
// //                         width: 44,
// //                         height: 44,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),

// //               const SizedBox(height: 20),

// //               /// ================= SCAN MEDICATION CARD =================
// //               Container(
// //                 height: 573,
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(12),
// //                   gradient: const LinearGradient(
// //                     colors: [Color(0xFF4FAAA2), Color(0xFF4F85AA)],
// //                     begin: Alignment.topCenter,
// //                     end: Alignment.bottomCenter,
// //                   ),
// //                 ),
// //                 child: Column(
// //                   children: [
// //                     Container(
// //                       decoration: BoxDecoration(
// //                         gradient: LinearGradient(
// //                           begin: Alignment.topCenter,
// //                           end: Alignment.bottomCenter,
// //                           colors: [
// //                             const Color.fromRGBO(248, 249, 251, 0),
// //                             const Color.fromRGBO(79, 133, 170, 0.9),
// //                           ],
// //                         ),
// //                       ),
// //                       child: Stack(
// //                         children: [
// //                           Center(
// //                             child: Image.asset(
// //                               "assets/images/.png.png",
// //                               height: 323,
// //                               fit: BoxFit.contain,
// //                             ),
// //                           ),
// //                           const Positioned(
// //                             bottom: 30,
// //                             left: 0,
// //                             right: 0,
// //                             child: Divider(thickness: 3.2, color: Colors.white),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     const SizedBox(height: 12),
// //                     const Text(
// //                       "Scan Medication",
// //                       style: TextStyle(
// //                         color: Color(0xFFF8F9FB),
// //                         fontFamily: 'Poppins',
// //                         fontWeight: FontWeight.w600,
// //                         fontSize: 30,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 12),
// //                     const Text(
// //                       "Point your camera at the label\n to identify your medication.",
// //                       textAlign: TextAlign.center,
// //                       style: TextStyle(
// //                         color: Color(0xFFF8F9FB),
// //                         fontFamily: 'Open Sans',
// //                         fontWeight: FontWeight.w400,
// //                         fontSize: 22,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 20),
// //                     ElevatedButton.icon(
// //                       onPressed: () => context.push("/imageScannerScreen"),
// //                       icon: const Icon(Icons.qr_code_scanner, size: 50),
// //                       label: const Text(
// //                         "Scan",
// //                         style: TextStyle(
// //                           color: Color(0xFF333333),
// //                           fontFamily: 'Open Sans',
// //                           fontWeight: FontWeight.w600,
// //                           fontSize: 40,
// //                         ),
// //                       ),
// //                       style: ElevatedButton.styleFrom(
// //                         backgroundColor: Colors.white,
// //                         foregroundColor: Colors.black,
// //                         shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(8),
// //                         ),
// //                         minimumSize: const Size(320, 84),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),

// //               const SizedBox(height: 30),

// //               /// ================= RECENTLY SCANNED SECTION =================
// //               Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   const Padding(
// //                     padding: EdgeInsets.all(16.0),
// //                     child: Text(
// //                       "Recently Scanned",
// //                       style: TextStyle(
// //                         fontSize: 24,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(height: 700, child: const RecentlyScznned()),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),

// //       /// ================= BOTTOM NAVIGATION =================
// //       bottomNavigationBar: CustomNavigationBar(
// //         currentIndex: _currentIndex,
// //         onTap: _onNavTap,
// //       ),
// //     );
// //   }
// // }

/*




import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:saymymeds/app/core/app_routes/app_routes.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/screens/home/controller/home_page_edit_profilecontroller.dart';
import 'package:saymymeds/app/views/screens/home/views/screens/recently_scznned.dart';
import 'package:saymymeds/app/widgets/BottomNav.dart';

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

  // ✅ Fixed Language change function - supports all languages including Chinese
  void _changeLanguage(String langCode) {
    Map<String, Locale> languages = {
      'English': const Locale('en', 'US'),
      'Spanish': const Locale('es', 'ES'),
      'French': const Locale('fr', 'FR'),
      'Portugese': const Locale('pt', 'BR'),
      'Creole': const Locale('ht', 'HT'),
      'Russian': const Locale('ru', 'RU'),
      'Chinese': const Locale('cn', 'CN'),
    };

    if (languages.containsKey(langCode)) {
      Get.updateLocale(languages[langCode]!);
    }
  }

  // Replace your _changeLanguage function with this:

  // void _changeLanguage(String langCode) {
  //   Map<String, Locale> languages = {
  //     'English': const Locale('en', 'US'),
  //     'Spanish': const Locale('es', 'ES'),
  //     'French': const Locale('fr', 'FR'),
  //     'Portugese': const Locale('pt', 'BR'),
  //     'Creole': const Locale('ht', 'HT'),
  //     'Russian': const Locale('ru', 'RU'),
  //     'Chinese': const Locale('cn', 'CN'),
  //   };

  //   if (languages.containsKey(langCode)) {
  //     final locale = languages[langCode]!;

  //     // ✅ Update locale
  //     Get.updateLocale(locale);

  //     // ✅ Trigger LanguageController update
  //     final languageController = Get.find<LanguageController>();
  //     languageController.update();
  //   }
  // }

  // ✅ Helper function to get current language display name
  String _getCurrentLanguageName() {
    final currentLocale = Get.locale.toString();

    if (currentLocale.contains('en')) return 'English';
    if (currentLocale.contains('es')) return 'Spanish';
    if (currentLocale.contains('fr')) return 'French';
    if (currentLocale.contains('pt')) return 'Portugese';
    if (currentLocale.contains('ht')) return 'Creole';
    if (currentLocale.contains('ru')) return 'Russian';
    if (currentLocale.contains('cn'))
      return 'Chinese'; // ✅ Fixed: Now captures zh-CN

    return 'English'; // Default fallback
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 25),

              /// ================= HEADER SECTION =================
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// Left: Profile & Name
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

                    /// Center: Language Dropdown
                    Container(
                      width: 115,
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
                          value:
                              _getCurrentLanguageName(), // ✅ Using helper function
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
                              _changeLanguage(v); // Change Language
                            }
                          },
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    /// Right: Subscription Icon
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

              /// ================= SCAN MEDICATION CARD =================
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
                      style: const TextStyle(
                        color: Color(0xFFF8F9FB),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'scan_instruction'.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFFF8F9FB),
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
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

              /// ================= RECENTLY SCANNED SECTION =================
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'recently_scanned'.tr,
                      style: const TextStyle(
                        fontSize: 24,
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

      /// ================= BOTTOM NAVIGATION =================
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
*/
// ...existing code...

/*
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:saymymeds/app/core/app_routes/app_routes.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/screens/home/controller/home_page_edit_profilecontroller.dart';
import 'package:saymymeds/app/views/screens/home/views/screens/recently_scznned.dart';
import 'package:saymymeds/app/widgets/BottomNav.dart';

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
      'Chinese': const Locale('cn', 'CN'),
    };

    if (languages.containsKey(langCode)) {
      Get.updateLocale(languages[langCode]!);
    }
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
                      style: const TextStyle(
                        color: Color(0xFFF8F9FB),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'scan_instruction'.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFFF8F9FB),
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
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
*/

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:saymymeds/app/core/app_routes/app_routes.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/screens/home/controller/home_page_edit_profilecontroller.dart';
import 'package:saymymeds/app/views/screens/home/views/screens/recently_scznned.dart';
import 'package:saymymeds/app/widgets/BottomNav.dart';

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
      'Chinese': const Locale('cn', 'CN'),
    };

    if (languages.containsKey(langCode)) {
      Get.updateLocale(languages[langCode]!);
    }
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
