import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({super.key});

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // SafeArea বাদ দেওয়া হলো
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ////////// Header
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage(
                            "assets/icons/Ellipse_Profile.png",
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
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0,
                                height: 1.0,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Your health is your greatest wealth",
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0,
                                height: 1.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image.asset("assets/icons/raja.png", width: 48, height: 48),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // ---------------- SCAN MEDICATION CARD ----------------
              Container(
                height: 573,
                // padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4FAAA2), Color(0xFF4F85AA)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    // Image + white divider
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(
                              248,
                              249,
                              251,
                              0,
                            ), // rgba(248, 249, 251, 0)
                            Color.fromRGBO(
                              79,
                              133,
                              170,
                              0.9,
                            ), // rgba(79, 133, 170, 0.9)
                          ],
                          stops: [0.0, 0.9], // 0% and 90% stops
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
                          Positioned(
                            // bottom: ,
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
                        fontSize: 30.0,
                        height: 1.0,
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
                        fontSize: 22.0,
                        height: 1.09,
                      ),
                    ),
                    const SizedBox(height: 20),

                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.qr_code_scanner, size: 50),

                      label: const Text(
                        "Scan",
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 40.0,
                          height: 1.0,
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
              //
              SizedBox(height: 25),

              /*DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      // labelColor: Colors.black,
                      // unselectedLabelColor: Colors.grey,
                      // indicatorColor: null,
                      dividerColor: Colors.amber,
                      indicator: BoxDecoration(
                        color: Color(0xFFF8F9FB),
                        borderRadius: BorderRadius.circular(45),
                      ),
                      tabs: const [
                        Tab(text: "Recently scanned"),
                        Tab(text: "All Medications"),
                      ],
                    ),
                    SizedBox(
                      height: 300, // adjust scroll height

                      child: TabBarView(
                        children: [
                          // MedicationList(apiData: recentMeds), // API Data
                          // MedicationList(apiData: allMeds), // API Data
                        ],
                      ),
                    ),
                  ],
                ),
              ),*/
              DefaultTabController(
                length: 2, // Number of tabs
                child: Container(
                  height: 50,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Color(0xFF2C2C2E),
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(34),
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.white,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    tabs: [
                      Tab(text: 'Recently scanned'),
                      Tab(text: 'All Medications'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
