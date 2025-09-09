import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saymymeds/app/core/app_routes/app_routes.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/widgets/BottomNav.dart';

class Medication extends StatefulWidget {
  const Medication({super.key});

  @override
  State<Medication> createState() => _MedicationState();
}

class _MedicationState extends State<Medication> {
  bool isNotificationOn = true;

  final List<Map<String, String>> medicines = const [
    {
      "name": "Atrovastatin",
      "generic_name": "Lipitor",
      "date": "08/08/25",
      "image": "assets/images/image 4.png",
    },
    {
      "name": "Lisinopril",
      "generic_name": "Lipitor",
      "date": "08/08/25",
      "image": "assets/images/Lisinpril.png",
    },
    {
      "name": "Metformin",
      "generic_name": "Lipitor",
      "date": "08/08/25",
      "image": "assets/images/Metform.png",
    },
  ];

  int _currentIndex = 2;

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
      body: Column(
        children: [
          /// HEADER
          Container(
            width: double.infinity,
            height: 120,
            padding: const EdgeInsets.only(top: 40, bottom: 10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.50, 1.00),
                end: Alignment(0.50, -0.00),
                colors: [Color(0xFF4FAAA2), Color(0xFF4F85AA)],
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x26000000),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: const Center(
              child: Text(
                "Medications",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  height: 1.0,
                  letterSpacing: 0.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

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

          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x0F0D0A2C),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Medications",
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
              itemCount: medicines.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                final medicine = medicines[index];
                return SizedBox(
                  width: 380,
                  height: 190,
                  child: Card(
                    color: AppColors.whiteBackground,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        color: Color(0xFF4F85AA),
                        width: 0.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            medicine["image"]!,
                            width: 144,
                            height: 170,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Medicine Name
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween, // Text ar Icon duitar moddhe space
                                      children: [
                                        Text(
                                          medicine["name"]!,
                                          style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            height: 1.0,
                                            letterSpacing: 0.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Container(
                                          height: 34,
                                          width: 34,
                                          padding: const EdgeInsets.all(
                                            6,
                                          ), // space around the icon
                                          decoration: BoxDecoration(
                                            color: Colors
                                                .white, // background color of the container
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ), // border radius
                                            border: Border.all(
                                              color: AppColors
                                                  .buttonColor, // border color
                                              width: 1.5, // border thickness
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    RichText(
                                      text: TextSpan(
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black87,
                                          fontFamily: 'Poppins',
                                        ),
                                        children: [
                                          const TextSpan(
                                            text: "Generic Name: ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: medicine["generic_name"]!,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                // Date and View details
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors
                                            .transparent, // Background color, change if needed
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: const Color(0xFF4F85AA),
                                          width: 1,
                                        ),
                                      ),
                                      child: GestureDetector(
                                        onTap: () =>
                                            context.push("/medicineDetailPage"),
                                        child: const Text(
                                          "Check info",
                                          style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.0,
                                            height: 1.0,
                                            letterSpacing: 0.0,
                                            color: Color(0xFF4F85AA),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:saymymeds/app/core/app_routes/app_routes.dart';
// import 'package:saymymeds/app/utlies/apps_color.dart';
// import 'package:saymymeds/app/widgets/BottomNav.dart';

// class Medication extends StatefulWidget {
//   const Medication({super.key});

//   @override
//   State<Medication> createState() => _MedicationState();
// }

// class _MedicationState extends State<Medication> {
//   bool isNotificationOn = true;

//   final List<Map<String, String>> medicines = [
//     {
//       "name": "Atorvastatin",
//       "generic_name": "20 mg once daily at night",
//       "date": "08/08/25",
//       "image": "assets/images/image 4.png",
//     },
//     {
//       "name": "Lisinopril",
//       "generic_name": "10 mg once daily",
//       "date": "08/08/25",
//       "image": "assets/images/Lisinpril.png",
//     },
//     {
//       "name": "Metformin",
//       "generic_name": "500 mg twice daily with meal",
//       "date": "08/08/25",
//       "image": "assets/images/Metform.png",
//     },
//     {
//       "name": "Provia",
//       "generic_name": "500 mg twice daily with meal",
//       "date": "08/08/25",
//       "image": "assets/images/provia.png",
//     },
//   ];

//   int _currentIndex = 2;

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
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           /// HEADER
//           Container(
//             width: double.infinity,
//             height: 120,
//             padding: const EdgeInsets.only(top: 40, bottom: 10),
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment(0.50, 1.00),
//                 end: Alignment(0.50, -0.00),
//                 colors: [Color(0xFF4FAAA2), Color(0xFF4F85AA)],
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Color(0x26000000),
//                   blurRadius: 10,
//                   offset: Offset(0, 2),
//                   spreadRadius: 0,
//                 ),
//               ],
//             ),
//             child: const Center(
//               child: Text(
//                 "Medications",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontFamily: "Poppins",
//                   fontWeight: FontWeight.w600,
//                   fontSize: 30,
//                   height: 1.0,
//                   letterSpacing: 0.0,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),

//           const SizedBox(height: 20),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Center(
//                 child: Image.asset(
//                   "assets/images/Logo 4.png",
//                   width: 88,
//                   height: 83,
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 15),

//           /// SEARCH BAR
//           Container(
//             padding: const EdgeInsets.all(5),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(30),
//               boxShadow: [
//                 BoxShadow(
//                   color: const Color(0x0F0D0A2C),
//                   blurRadius: 12,
//                   offset: const Offset(0, 4),
//                 ),
//               ],
//             ),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: "Search medicine",
//                 suffixIcon: const Icon(Icons.search),
//                 contentPadding: const EdgeInsets.symmetric(horizontal: 16),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//           ),

//           /// LIST OF MEDICINES
//           Expanded(
//             child: ListView.builder(
//               itemCount: medicines.length,
//               padding: const EdgeInsets.all(12),
//               itemBuilder: (context, index) {
//                 final medicine = medicines[index];
//                 return SizedBox(
//                   width: 400,
//                   height: 190,
//                   child: Card(
//                     color: AppColors.whiteBackground,
//                     margin: const EdgeInsets.symmetric(vertical: 8),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                       side: const BorderSide(
//                         color: Color(0xFF4F85AA),
//                         width: 1,
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Image.asset(
//                             medicine["image"]!,
//                             width: 144,
//                             height: 170,
//                             fit: BoxFit.contain,
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 // Medicine Name & Generic Name
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Expanded(
//                                           child: Text(
//                                             medicine["name"]!,
//                                             style: const TextStyle(
//                                               fontFamily: 'Poppins',
//                                               fontWeight: FontWeight.w600,
//                                               fontSize: 18,
//                                               height: 1.2,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                         ),
//                                         Container(
//                                           height: 34,
//                                           width: 34,
//                                           padding: const EdgeInsets.all(6),
//                                           decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius: BorderRadius.circular(
//                                               12,
//                                             ),
//                                             border: Border.all(
//                                               color: AppColors.buttonColor,
//                                               width: 1.5,
//                                             ),
//                                           ),
//                                           child: const Icon(
//                                             Icons.delete,
//                                             color: Colors.red,
//                                             size: 18,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 6),
//                                     Text(
//                                       medicine["generic_name"]!,
//                                       style: const TextStyle(
//                                         fontSize: 14,
//                                         fontFamily: 'Poppins',
//                                         color: Colors.black87,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 6),
//                                     Text(
//                                       "Date: ${medicine["date"]!}",
//                                       style: const TextStyle(
//                                         fontSize: 14,
//                                         fontFamily: 'Poppins',
//                                         color: Colors.black54,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 // Check Info button
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     Container(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 12,
//                                         vertical: 6,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         color: Colors.transparent,
//                                         borderRadius: BorderRadius.circular(8),
//                                         border: Border.all(
//                                           color: const Color(0xFF4F85AA),
//                                           width: 1,
//                                         ),
//                                       ),
//                                       child: GestureDetector(
//                                         onTap: () =>
//                                             context.push("/medicineDetailPage"),
//                                         child: const Text(
//                                           "Check info",
//                                           style: TextStyle(
//                                             fontFamily: 'Open Sans',
//                                             fontWeight: FontWeight.w400,
//                                             fontSize: 16.0,
//                                             height: 1.0,
//                                             letterSpacing: 0.0,
//                                             color: Color(0xFF4F85AA),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: CustomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: _onNavTap,
//       ),
//     );
//   }
// }
