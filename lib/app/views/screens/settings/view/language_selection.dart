import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';

class LanguageSelection extends StatefulWidget {
  const LanguageSelection({super.key});

  @override
  State<LanguageSelection> createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  String selectedLanguage = "English";

  final List<Map<String, String>> languages = [
    {"name": "English"},
    {"name": "Spanish (Español)"},
    {"name": "French (Français)"},
    {"name": "German (Deutsch)"},
    {"name": "Chinese (Simplified) (简体中文)"},
    {"name": "Creole"},
    {"name": "Russian"},
    {"name": "Portuguese"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // Custom height
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF8F9FB), // AppBar background color
            boxShadow: [
              BoxShadow(
                color: Color(0x26000000), // Shadow with opacity
                offset: Offset(0, 2), // Shadow position
                blurRadius: 10, // Shadow blur radius
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
            title: const Text(
              "Language Selection",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 24,
                height: 1,
                color: AppColors.bgTextDark,
              ),
              textAlign: TextAlign.center,
            ),
            centerTitle: true, // Title center করার জন্য
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
            SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x0F0D0A2C), // #0D0A2C0F
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search language",
                  suffixIcon: const Icon(Icons.search), // 👈 ডান পাশে গেলো
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final lang = languages[index]["name"]!;
                  return RadioListTile<String>(
                    activeColor: AppColors.forgetPasswordOpacity,
                    title: Text(
                      lang,
                      style: TextStyle(
                        fontWeight: selectedLanguage == lang
                            ? FontWeight.bold
                            : FontWeight.w400,
                        color: selectedLanguage == lang
                            ? AppColors.buttonColor
                            : Colors.black87,
                      ),
                    ),
                    value: lang,
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
    );
  }
}
