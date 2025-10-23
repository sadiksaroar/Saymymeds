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

//   final List<Map<String, String>> medicines = const [
//     {
//       "name": "Atrovastatin",
//       "generic_name": "Lipitor",
//       "date": "08/08/25",
//       "image": "assets/images/image 4.png",
//     },
//     {
//       "name": "Lisinopril",
//       "generic_name": "Lipitor",
//       "date": "08/08/25",
//       "image": "assets/images/Lisinpril.png",
//     },
//     {
//       "name": "Metformin",
//       "generic_name": "Lipitor",
//       "date": "08/08/25",
//       "image": "assets/images/Metform.png",
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

//           SizedBox(height: 15),
//           Container(
//             padding: EdgeInsets.all(5),
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
//                 hintText: "Search Medications",
//                 suffixIcon: const Icon(Icons.search), // 👈 ডান পাশে গেলো
//                 contentPadding: const EdgeInsets.symmetric(horizontal: 16),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: medicines.length,
//               padding: const EdgeInsets.all(10),
//               itemBuilder: (context, index) {
//                 final medicine = medicines[index];
//                 return SizedBox(
//                   width: 380,
//                   height: 190,
//                   child: Card(
//                     color: AppColors.whiteBackground,
//                     margin: const EdgeInsets.symmetric(vertical: 8),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                       side: const BorderSide(
//                         color: Color(0xFF4F85AA),
//                         width: 0.5,
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
//                                 // Medicine Name
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment
//                                           .spaceBetween, // Text ar Icon duitar moddhe space
//                                       children: [
//                                         Text(
//                                           medicine["name"]!,
//                                           style: const TextStyle(
//                                             fontFamily: 'Poppins',
//                                             fontWeight: FontWeight.w600,
//                                             fontSize: 20,
//                                             height: 1.0,
//                                             letterSpacing: 0.0,
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         Container(
//                                           height: 34,
//                                           width: 34,
//                                           padding: const EdgeInsets.all(
//                                             6,
//                                           ), // space around the icon
//                                           decoration: BoxDecoration(
//                                             color: Colors
//                                                 .white, // background color of the container
//                                             borderRadius: BorderRadius.circular(
//                                               12,
//                                             ), // border radius
//                                             border: Border.all(
//                                               color: AppColors
//                                                   .buttonColor, // border color
//                                               width: 1.5, // border thickness
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
//                                     SizedBox(height: 20),
//                                     RichText(
//                                       text: TextSpan(
//                                         style: const TextStyle(
//                                           fontSize: 16,
//                                           color: Colors.black87,
//                                           fontFamily: 'Poppins',
//                                         ),
//                                         children: [
//                                           const TextSpan(
//                                             text: "Generic Name: ",
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                           TextSpan(
//                                             text: medicine["generic_name"]!,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 // Date and View details
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     Container(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 12,
//                                         vertical: 6,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         color: Colors
//                                             .transparent, // Background color, change if needed
//                                         borderRadius: BorderRadius.circular(8),
//                                         border: Border.all(
//                                           color: const Color(0xFF4F85AA),
//                                           width: 1,
//                                         ),
//                                       ),
//                                       child: GestureDetector(
//                                         onTap: () =>
//                                             context.push("/checkInfoPage"),
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

/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:saymymeds/app/core/app_routes/app_routes.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/screens/medications/MedicationController/meddication_controller.dart';
import 'package:saymymeds/app/widgets/BottomNav.dart';

class Medication extends StatefulWidget {
  const Medication({super.key});

  @override
  State<Medication> createState() => _MedicationState();
}

class _MedicationState extends State<Medication> {
  int _currentIndex = 2;
  late MedicationController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(MedicationController());
  }

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

          /// LOGO
          Center(
            child: Image.asset(
              "assets/images/Logo 4.png",
              width: 88,
              height: 83,
            ),
          ),

          const SizedBox(height: 15),

          /// SEARCH BAR
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(5),
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
              onChanged: (value) {
                controller.searchMedications(value);
              },
              decoration: InputDecoration(
                hintText: "Search Medications",
                suffixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          /// MEDICATIONS LIST
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.errorMessage.isNotEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Error: ${controller.errorMessage.value}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => controller.fetchMedications(),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              }

              if (controller.filteredMedications.isEmpty) {
                return const Center(child: Text('No medications found'));
              }

              return ListView.builder(
                itemCount: controller.filteredMedications.length,
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  final medication = controller.filteredMedications[index];
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
                            /// MEDICINE IMAGE
                            Container(
                              width: 144,
                              height: 170,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: medication.originalImage != null
                                  ? Image.network(
                                      'http://10.10.7.24:8002${medication.originalImage}',
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return const Icon(
                                              Icons.medication,
                                              size: 80,
                                              color: Colors.grey,
                                            );
                                          },
                                    )
                                  : const Icon(
                                      Icons.medication,
                                      size: 80,
                                      color: Colors.grey,
                                    ),
                            ),
                            const SizedBox(width: 12),

                            /// MEDICINE INFO
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// MEDICINE NAME & DELETE BUTTON
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          medication.brandName ?? 'N/A',
                                          style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            height: 1.0,
                                            letterSpacing: 0.0,
                                            color: Colors.black,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        height: 34,
                                        width: 34,
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          border: Border.all(
                                            color: AppColors.buttonColor,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.deleteMedication(index);
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  'Medication deleted',
                                                ),
                                              ),
                                            );
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  /// GENERIC NAME
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.black87,
                                        fontFamily: 'Poppins',
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: "Generic: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: medication.genericName ?? 'N/A',
                                        ),
                                      ],
                                    ),
                                  ),

                                  /// MANUFACTURER
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.black87,
                                        fontFamily: 'Poppins',
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: "Mfg: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              medication.manufacturer ?? 'N/A',
                                        ),
                                      ],
                                    ),
                                  ),

                                  /// BUTTON ROW
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          border: Border.all(
                                            color: const Color(0xFF4F85AA),
                                            width: 1,
                                          ),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            context.push(
                                              ' /medicineDetailPage',
                                              extra:
                                                  medication, // Passing data through 'extra'
                                            );
                                          },
                                          child: const Text(
                                            "Check info",
                                            style: TextStyle(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.0,
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
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
*/

// /* third code chnage

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';
// import 'package:saymymeds/app/core/app_routes/app_routes.dart';
// import 'package:saymymeds/app/utlies/apps_color.dart';
// import 'package:saymymeds/app/views/screens/medications/MedicationController/meddication_controller.dart';
// import 'package:saymymeds/app/widgets/BottomNav.dart';

// class Medication extends StatefulWidget {
//   const Medication({super.key});

//   @override
//   State<Medication> createState() => _MedicationState();
// }

// class _MedicationState extends State<Medication> {
//   int _currentIndex = 2;
//   late MedicationController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = Get.put(MedicationController());
//   }

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

//           /// LOGO
//           Center(
//             child: Image.asset(
//               "assets/images/Logo 4.png",
//               width: 88,
//               height: 83,
//             ),
//           ),

//           const SizedBox(height: 15),

//           /// SEARCH BAR
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 16),
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
//               onChanged: (value) {
//                 controller.searchMedications(value);
//               },
//               decoration: InputDecoration(
//                 hintText: "Search Medications",
//                 suffixIcon: const Icon(Icons.search),
//                 contentPadding: const EdgeInsets.symmetric(horizontal: 16),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//           ),

//           const SizedBox(height: 16),

//           /// MEDICATIONS LIST
//           Expanded(
//             child: Obx(() {
//               if (controller.isLoading.value) {
//                 return const Center(child: CircularProgressIndicator());
//               }

//               if (controller.errorMessage.isNotEmpty) {
//                 return Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Error: ${controller.errorMessage.value}',
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(color: Colors.red),
//                       ),
//                       const SizedBox(height: 16),
//                       ElevatedButton(
//                         onPressed: () => controller.fetchMedications(),
//                         child: const Text('Retry'),
//                       ),
//                     ],
//                   ),
//                 );
//               }

//               if (controller.filteredMedications.isEmpty) {
//                 return const Center(child: Text('No medications found'));
//               }

//               return ListView.builder(
//                 itemCount: controller.filteredMedications.length,
//                 padding: const EdgeInsets.all(10),
//                 itemBuilder: (context, index) {
//                   final medication = controller.filteredMedications[index];
//                   return SizedBox(
//                     width: 380,
//                     height: 190,
//                     child: Card(
//                       color: AppColors.whiteBackground,
//                       margin: const EdgeInsets.symmetric(vertical: 8),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         side: const BorderSide(
//                           color: Color(0xFF4F85AA),
//                           width: 0.5,
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             /// MEDICINE IMAGE
//                             Container(
//                               width: 144,
//                               height: 170,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey[200],
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: medication.originalImage != null
//                                   ? Image.network(
//                                       'http://10.10.7.24:8002${medication.originalImage}',
//                                       fit: BoxFit.cover,
//                                       errorBuilder:
//                                           (context, error, stackTrace) {
//                                             return const Icon(
//                                               Icons.medication,
//                                               size: 80,
//                                               color: Colors.grey,
//                                             );
//                                           },
//                                     )
//                                   : const Icon(
//                                       Icons.medication,
//                                       size: 80,
//                                       color: Colors.grey,
//                                     ),
//                             ),
//                             const SizedBox(width: 12),

//                             /// MEDICINE INFO
//                             Expanded(
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   /// MEDICINE NAME & DELETE BUTTON
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Expanded(
//                                         child: Text(
//                                           medication.brandName ?? 'N/A',
//                                           style: const TextStyle(
//                                             fontFamily: 'Poppins',
//                                             fontWeight: FontWeight.w600,
//                                             fontSize: 16,
//                                             height: 1.0,
//                                             letterSpacing: 0.0,
//                                             color: Colors.black,
//                                           ),
//                                           maxLines: 2,
//                                           overflow: TextOverflow.ellipsis,
//                                         ),
//                                       ),
//                                       const SizedBox(width: 8),
//                                       Container(
//                                         height: 34,
//                                         width: 34,
//                                         padding: const EdgeInsets.all(6),
//                                         decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius: BorderRadius.circular(
//                                             12,
//                                           ),
//                                           border: Border.all(
//                                             color: AppColors.buttonColor,
//                                             width: 1.5,
//                                           ),
//                                         ),
//                                         child: GestureDetector(
//                                           onTap: () {
//                                             controller.deleteMedication(index);
//                                             ScaffoldMessenger.of(
//                                               context,
//                                             ).showSnackBar(
//                                               const SnackBar(
//                                                 content: Text(
//                                                   'Medication deleted',
//                                                 ),
//                                               ),
//                                             );
//                                           },
//                                           child: const Icon(
//                                             Icons.delete,
//                                             color: Colors.red,
//                                             size: 18,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),

//                                   /// GENERIC NAME
//                                   RichText(
//                                     text: TextSpan(
//                                       style: const TextStyle(
//                                         fontSize: 13,
//                                         color: Colors.black87,
//                                         fontFamily: 'Poppins',
//                                       ),
//                                       children: [
//                                         const TextSpan(
//                                           text: "Generic: ",
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         TextSpan(
//                                           text: medication.genericName ?? 'N/A',
//                                         ),
//                                       ],
//                                     ),
//                                   ),

//                                   /// MANUFACTURER
//                                   RichText(
//                                     text: TextSpan(
//                                       style: const TextStyle(
//                                         fontSize: 13,
//                                         color: Colors.black87,
//                                         fontFamily: 'Poppins',
//                                       ),
//                                       children: [
//                                         const TextSpan(
//                                           text: "Mfg: ",
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         TextSpan(
//                                           text:
//                                               medication.manufacturer ?? 'N/A',
//                                         ),
//                                       ],
//                                     ),
//                                   ),

//                                   /// BUTTON ROW
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       Container(
//                                         padding: const EdgeInsets.symmetric(
//                                           horizontal: 12,
//                                           vertical: 6,
//                                         ),
//                                         decoration: BoxDecoration(
//                                           color: Colors.transparent,
//                                           borderRadius: BorderRadius.circular(
//                                             8,
//                                           ),
//                                           border: Border.all(
//                                             color: const Color(0xFF4F85AA),
//                                             width: 1,
//                                           ),
//                                         ),
//                                         child: GestureDetector(
//                                           onTap: () {
//                                             // context.push(
//                                             //   ' /medicineDetailPage',
//                                             //   extra:
//                                             //       medication, // Passing data through 'extra'
//                                             // );
//                                             context.push(
//                                               AppRoutes.medicineDetailPage,
//                                               extra: medication,
//                                             );
//                                           },
//                                           child: const Text(
//                                             "Check info",
//                                             style: TextStyle(
//                                               fontFamily: 'Open Sans',
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: 14.0,
//                                               height: 1.0,
//                                               letterSpacing: 0.0,
//                                               color: Color(0xFF4F85AA),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }),
//           ),
//         ],
//       ),
//       bottomNavigationBar: CustomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: _onNavTap,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:saymymeds/app/core/app_routes/app_routes.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/screens/medications/MedicationController/meddication_controller.dart';
import 'package:saymymeds/app/widgets/BottomNav.dart';

class Medication extends StatefulWidget {
  const Medication({super.key});

  @override
  State<Medication> createState() => _MedicationState();
}

class _MedicationState extends State<Medication> {
  final controller = Get.put(MedicationController());
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
                suffixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.errorMessage.isNotEmpty) {
                return Center(child: Text(controller.errorMessage.value));
              }

              if (controller.medicines.isEmpty) {
                return const Center(child: Text('No medications found'));
              }

              return ListView.builder(
                itemCount: controller.medicines.length,
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  final medicine = controller.medicines[index];
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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                medicine.originalImage ?? '',
                                width: 144,
                                height: 170,
                                fit: BoxFit.contain,
                                errorBuilder: (_, __, ___) => Container(
                                  width: 144,
                                  height: 170,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.medication_outlined,
                                    size: 60,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              medicine.brandName ?? 'N/A',
                                              style: const TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                                height: 1.0,
                                                letterSpacing: 0.0,
                                                color: Colors.black,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (ctx) => AlertDialog(
                                                  title: const Text(
                                                    'Delete Medication',
                                                  ),
                                                  content: const Text(
                                                    'Are you sure?',
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(ctx),
                                                      child: const Text(
                                                        'Cancel',
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        controller
                                                            .deleteMedication(
                                                              medicine.id ?? 0,
                                                            );
                                                        Navigator.pop(ctx);
                                                      },
                                                      child: const Text(
                                                        'Delete',
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: 34,
                                              width: 34,
                                              padding: const EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color: AppColors.buttonColor,
                                                  width: 1.5,
                                                ),
                                              ),
                                              child: const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
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
                                              text:
                                                  medicine.genericName ?? 'N/A',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          border: Border.all(
                                            color: const Color(0xFF4F85AA),
                                            width: 1,
                                          ),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            context.push(
                                              "/checkInfoPage/${medicine.id}",
                                            );
                                          },
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
              );
            }),
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
