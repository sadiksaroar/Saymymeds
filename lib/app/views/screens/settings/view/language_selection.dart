// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:saymymeds/app/core/app_routes/app_routes.dart';
// import 'package:saymymeds/app/utlies/apps_color.dart';
// import 'package:saymymeds/app/widgets/BottomNav.dart';

// class LanguageSelection extends StatefulWidget {
//   const LanguageSelection({super.key});

//   @override
//   State<LanguageSelection> createState() => _LanguageSelectionState();
// }

// class _LanguageSelectionState extends State<LanguageSelection> {
//   String selectedLanguage = "English";

//   final List<Map<String, String>> languages = [
//     {"name": "English"},
//     {"name": "Spanish (Español)"},
//     {"name": "French (Français)"},
//     {"name": "Creole"},
//     {"name": "Portugese "},
//     {"name": "Chinese"},
//     {"name": "Russian"},
//   ];

//   int _currentIndex = 3;

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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.whiteBackground,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(60.0), // Custom height
//         child: Container(
//           decoration: const BoxDecoration(
//             color: Color(0xFFF8F9FB), // AppBar background color
//             boxShadow: [
//               BoxShadow(
//                 color: Color(0x26000000), // Shadow with opacity
//                 offset: Offset(0, 2), // Shadow position
//                 blurRadius: 10, // Shadow blur radius
//               ),
//             ],
//           ),
//           child: AppBar(
//             leading: InkWell(
//               onTap: () {
//                 context.pop("/");
//               },
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Image.asset(
//                   "assets/icons/Back_Icon.png",
//                   width: 24,
//                   height: 24,
//                 ),
//               ),
//             ),
//             title: const Text(
//               "Language Selection",
//               style: TextStyle(
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w600,
//                 fontSize: 24,
//                 height: 1,
//                 color: AppColors.bgTextDark,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             centerTitle: true, // Title center করার জন্য
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Center(
//                   child: Image.asset(
//                     "assets/images/Logo 4.png",
//                     width: 88,
//                     height: 83,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 40),

//             Expanded(
//               child: ListView.builder(
//                 itemCount: languages.length,
//                 itemBuilder: (context, index) {
//                   final lang = languages[index]["name"]!;
//                   return RadioListTile<String>(
//                     activeColor: AppColors.forgetPasswordOpacity,
//                     title: Text(
//                       lang,
//                       style: TextStyle(
//                         fontWeight: selectedLanguage == lang
//                             ? FontWeight.bold
//                             : FontWeight.w400,
//                         color: selectedLanguage == lang
//                             ? AppColors.buttonColor
//                             : Colors.black87,
//                       ),
//                     ),
//                     value: lang,
//                     groupValue: selectedLanguage,
//                     onChanged: (value) {
//                       setState(() {
//                         selectedLanguage = value!;
//                       });
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
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
import 'package:saymymeds/app/widgets/BottomNav.dart';

class LanguageSelection extends StatefulWidget {
  const LanguageSelection({super.key});

  @override
  State<LanguageSelection> createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  String selectedLanguage = "English";

  // ✅ Keep the language keys as they are for selection logic
  final List<Map<String, String>> languages = [
    {"key": "English", "display": "english"},
    {"key": "Spanish (Español)", "display": "spanish"},
    {"key": "French (Français)", "display": "french"},
    {"key": "Creole", "display": "creole"},
    {"key": "Portugese", "display": "portugese"},
    {"key": "Chinese", "display": "chinese"},
    {"key": "Russian", "display": "russian"},
  ];

  int _currentIndex = 3;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF8F9FB),
            boxShadow: [
              BoxShadow(
                color: Color(0x26000000),
                offset: Offset(0, 2),
                blurRadius: 10,
              ),
            ],
          ),
          child: AppBar(
            leading: InkWell(
              onTap: () {
                context.pop("/");
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/icons/Back_Icon.png",
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            title: Text(
              'languageSelection'.tr,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 24,
                height: 1,
                color: AppColors.bgTextDark,
              ),
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/Logo 4.png",
                    width: 88,
                    height: 83,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final langKey = languages[index]["key"]!;
                  final langDisplay = languages[index]["display"]!;

                  return RadioListTile<String>(
                    activeColor: AppColors.forgetPasswordOpacity,
                    title: Text(
                      langDisplay.tr,
                      style: TextStyle(
                        fontWeight: selectedLanguage == langKey
                            ? FontWeight.bold
                            : FontWeight.w400,
                        color: selectedLanguage == langKey
                            ? AppColors.buttonColor
                            : Colors.black87,
                      ),
                    ),
                    value: langKey,
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value!;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
