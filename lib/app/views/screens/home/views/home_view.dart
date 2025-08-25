// import 'package:flutter/material.dart';
// import 'package:saymymeds/app/views/components/CustomTabBarWidget/custom_tabBar_widget.dart';
// import 'package:saymymeds/app/views/screens/home/views/screens/all_medications.dart';
// import 'package:saymymeds/app/views/screens/home/views/screens/recently_scznned.dart';

// class HomeViewPage extends StatefulWidget {
//   const HomeViewPage({super.key});

//   @override
//   State<HomeViewPage> createState() => _HomeViewPageState();
// }

// class _HomeViewPageState extends State<HomeViewPage>
//     with TickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               ////////// Header
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         const CircleAvatar(
//                           radius: 24,
//                           backgroundImage: AssetImage(
//                             "assets/icons/Ellipse_Profile.png",
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: const [
//                             Text(
//                               "Hello, Emily",
//                               style: TextStyle(
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w600,
//                                 fontStyle: FontStyle.normal,
//                                 fontSize: 16.0,
//                                 height: 1.0,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             Text(
//                               "Your health is your greatest wealth",
//                               style: TextStyle(
//                                 fontFamily: 'Open Sans',
//                                 fontWeight: FontWeight.w400,
//                                 fontStyle: FontStyle.normal,
//                                 fontSize: 12.0,
//                                 height: 1.0,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     Image.asset("assets/icons/raja.png", width: 48, height: 48),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // ---------------- SCAN MEDICATION CARD ----------------
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
//                             Color.fromRGBO(248, 249, 251, 0),
//                             Color.fromRGBO(79, 133, 170, 0.9),
//                           ],
//                           stops: [0.0, 0.9],
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
//                           Positioned(
//                             bottom: 30,
//                             left: 0,
//                             right: 0,
//                             child: Divider(thickness: 3.2, color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     const Text(
//                       "Scan Medication",
//                       style: TextStyle(
//                         color: Color(0xFFF8F9FB),
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w600,
//                         fontSize: 30.0,
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     const Text(
//                       "Point your camera at the label\n to identify your medication.",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Color(0xFFF8F9FB),
//                         fontFamily: 'Open Sans',
//                         fontWeight: FontWeight.w400,
//                         fontSize: 22.0,
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     ElevatedButton.icon(
//                       onPressed: () {},
//                       icon: const Icon(Icons.qr_code_scanner, size: 50),
//                       label: const Text(
//                         "Scan",
//                         style: TextStyle(
//                           color: Color(0xFF333333),
//                           fontFamily: 'Open Sans',
//                           fontWeight: FontWeight.w600,
//                           fontSize: 40.0,
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
//               const SizedBox(height: 20),

//               // ---------------- TAB BAR ----------------
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(45),
//                     ),

//                     child: TabBar(
//                       padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//                       controller: _tabController,
//                       indicator: BoxDecoration(
//                         border: null,
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(35),
//                       ),
//                       indicatorWeight:
//                           0, // Adjust the height of the indicator here

//                       labelColor: Colors.black,
//                       unselectedLabelColor: Colors.white,
//                       tabs: const [
//                         Tab(text: 'Recently Scanned'),
//                         Tab(text: 'All Medications'),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),

//               // ---------------- TAB BAR VIEW ----------------
//               SizedBox(
//                 height: 610, // Adjust height as needed
//                 child: TabBarView(
//                   controller: _tabController,
//                   children: const [
//                     RecentlyScznned(), // Ensure the widget is named correctly
//                     AllMedications(),
//                   ],
//                 ),
//               ),
//               /*
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: CustomTabWidget(
//                       tabTitles: const ['Recently Scanned', 'All Medications'],
//                       tabViews: [
//                         // Recently Scanned Tab Content
//                         const RecentlyScznned(),

//                         // All Medications Tab Content
//                         const AllMedications(),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               */
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:saymymeds/app/views/components/CustomTabBarWidget/custom_tabBar_widget.dart'; // Ensure the path is correct
import 'package:saymymeds/app/views/screens/home/views/screens/all_medications.dart';
import 'package:saymymeds/app/views/screens/home/views/screens/recently_scznned.dart';

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
                            Color.fromRGBO(248, 249, 251, 0),
                            Color.fromRGBO(79, 133, 170, 0.9),
                          ],
                          stops: [0.0, 0.9],
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
              const SizedBox(height: 20),

              // ---------------- CUSTOM TAB WIDGET ----------------
              // Wrap with Container to fix unbounded height issue
              Container(
                height: 700, // Adjust the height as needed
                child: CustomTabWidget(
                  tabTitles: const ['Recently Scanned', 'All Medications'],
                  tabViews: [
                    const RecentlyScznned(), // Recently Scanned Tab Content
                    const AllMedications(), // All Medications Tab Content
                  ],
                  height: 50,
                  backgroundColor: Colors.black,
                  indicatorColor: Colors.white,
                  selectedTextColor: Colors.black,
                  unselectedTextColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
