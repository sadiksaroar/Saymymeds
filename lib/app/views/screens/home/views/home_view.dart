import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saymymeds/app/core/app_routes/app_routes.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/screens/home/views/screens/recently_scznned.dart';
import 'package:saymymeds/app/widgets/BottomNav.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({super.key});

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  int _currentIndex = 0;
  String lang = 'English';

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 25),

              /// Header Section
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage(
                            "assets/images/eclipe.png",
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Hello, Emily",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Language Dropdown
                    Container(
                      width: 117,
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
                          value: lang,
                          isExpanded: true,
                          icon: const Icon(Icons.expand_more_rounded),
                          items: const [
                            DropdownMenuItem(
                              value: 'English',
                              child: Text('English'),
                            ),
                            DropdownMenuItem(
                              value: 'Spanish',
                              child: Text(
                                'Spanish (Español)',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'French',
                              child: Text(
                                'French (Français)',
                                overflow: TextOverflow.ellipsis,
                              ),
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
                            DropdownMenuItem(
                              value: "Portugese",
                              child: Text("Portugese"),
                            ),
                          ],
                          onChanged: (v) =>
                              setState(() => lang = v ?? 'English'),
                        ),
                      ),
                    ),
                    // /subscriptionCard
                    const SizedBox(width: 2),
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

              /// Scan Medication Card
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
                    const Text(
                      "Scan Medication",
                      style: TextStyle(
                        color: Color(0xFFF8F9FB),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Point your camera at the label\n to identify your medication.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
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
                      label: const Text(
                        "Scan",
                        style: TextStyle(
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
              // const SizedBox(height: )20,

              /// Recently Scanned Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Recently Scanned",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  /// Wrap RecentlyScznned in SizedBox to prevent unbounded height error
                  SizedBox(
                    height: 700, // Adjust as needed
                    child: const RecentlyScznned(),
                    // AllMedications()
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
