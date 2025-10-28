// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:saymymeds/app/views/screens/home/controller/recently_scenned_controller.dart';
// import 'package:go_router/go_router.dart'; // For navigation

// class RecentlyScznned extends StatelessWidget {
//   const RecentlyScznned({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(RecentlyScannedController());

//     return Obx(() {
//       if (controller.isLoading.value) {
//         return const Center(child: CircularProgressIndicator());
//       }

//       if (controller.errorMessage.value.isNotEmpty) {
//         return Center(
//           child: Text(
//             controller.errorMessage.value,
//             style: const TextStyle(color: Colors.red),
//           ),
//         );
//       }

//       final medicines = controller.medicines;

//       if (medicines.isEmpty) {
//         return const Center(child: Text('No medications found'));
//       }

//       return Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: medicines.length,
//               padding: const EdgeInsets.all(12),
//               itemBuilder: (context, index) {
//                 final medicine =
//                     medicines[index]; // Access the current medicine from the list
//                 return SizedBox(
//                   width: double.infinity,
//                   height: 190,
//                   child: Card(
//                     color: Colors.white,
//                     margin: const EdgeInsets.symmetric(vertical: 8),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                       side: const BorderSide(
//                         color: Color(0xFF4F85AA),
//                         width: 0.5,
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(10, 10, 12, 10),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // ✅ Network Image
//                           Container(
//                             width: 138,
//                             height: 160,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               color: Colors.grey[200],
//                             ),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(8),
//                               child: Image.network(
//                                 'http://10.10.7.24:8002${medicine.originalImage}',
//                                 fit: BoxFit.contain,
//                                 errorBuilder: (_, __, ___) => const Icon(
//                                   Icons.medication_outlined,
//                                   size: 50,
//                                   color: Colors.grey,
//                                 ),
//                                 loadingBuilder: (_, child, loadingProgress) {
//                                   if (loadingProgress == null) return child;
//                                   return const Center(
//                                     child: CircularProgressIndicator(),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 // Medicine Name
//                                 Flexible(
//                                   child: Text(
//                                     medicine.genericName,
//                                     style: const TextStyle(
//                                       fontFamily: 'Poppins',
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 20,
//                                       height: 1.2,
//                                       color: Colors.black,
//                                     ),
//                                     maxLines: 2,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 // Generic Name
//                                 Flexible(
//                                   child: RichText(
//                                     text: TextSpan(
//                                       style: const TextStyle(
//                                         fontSize: 16,
//                                         color: Colors.black87,
//                                         fontFamily: 'Poppins',
//                                       ),
//                                       children: [
//                                         const TextSpan(
//                                           text: "Generic Name: ",
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         TextSpan(
//                                           text: medicine.brandName ?? '',
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 const Spacer(),
//                                 // Date and View details
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       _formatDate(medicine.createdAt),
//                                       style: const TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         context.push(
//                                           "/checkInfoPage/${medicine.id}", // Pass medication ID
//                                         );
//                                       },
//                                       child: const Text(
//                                         'View details',
//                                         style: TextStyle(
//                                           fontFamily: 'Open Sans',
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 14.0,
//                                           color: Color(0xFF4F85AA),
//                                           decoration: TextDecoration.underline,
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
//           // See All Button
//           Padding(
//             padding: const EdgeInsets.only(right: 12, bottom: 12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Container(
//                   height: 40,
//                   width: 80,
//                   decoration: BoxDecoration(
//                     border: Border.all(width: 1, color: Colors.blue),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: InkWell(
//                     onTap: () => context.push(
//                       "/medication",
//                     ), // Navigate to a full list of medications
//                     child: const Center(
//                       child: Text(
//                         'See all',
//                         style: TextStyle(
//                           fontFamily: 'Open Sans',
//                           fontWeight: FontWeight.w400,
//                           fontSize: 20.0,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     });
//   }

//   // ✅ Null-safe date formatting
//   String _formatDate(dynamic date) {
//     if (date == null) return '';
//     DateTime parsedDate;
//     if (date is String) {
//       parsedDate = DateTime.tryParse(date) ?? DateTime.now();
//     } else if (date is DateTime) {
//       parsedDate = date;
//     } else {
//       return '';
//     }
//     return '${parsedDate.day.toString().padLeft(2, '0')}/'
//         '${parsedDate.month.toString().padLeft(2, '0')}/'
//         '${parsedDate.year}';
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saymymeds/app/core/consants/api_constants.dart';
import 'package:saymymeds/app/views/screens/home/controller/recently_scenned_controller.dart';
import 'package:go_router/go_router.dart'; // For navigation

class RecentlyScznned extends StatelessWidget {
  const RecentlyScznned({super.key});

  // Declare the baseUrl as a variable
  final String baseUrl = ApiConstants.baseUrl;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RecentlyScannedController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.errorMessage.value.isNotEmpty) {
        return Center(
          child: Text(
            controller.errorMessage.value,
            style: const TextStyle(color: Colors.red),
          ),
        );
      }

      final medicines = controller.medicines;

      if (medicines.isEmpty) {
        return const Center(child: Text('No medications found'));
      }

      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: medicines.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index) {
                final medicine =
                    medicines[index]; // Access the current medicine from the list
                return SizedBox(
                  width: double.infinity,
                  height: 180,
                  child: Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        color: Color(0xFF4F85AA),
                        width: 0.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 12, 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ✅ Network Image
                          Container(
                            width: 128,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                '$baseUrl${medicine.originalImage}', // Use the baseUrl variable
                                fit: BoxFit.contain,
                                errorBuilder: (_, __, ___) => const Icon(
                                  Icons.medication_outlined,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                                loadingBuilder: (_, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Medicine Name
                                Flexible(
                                  child: Text(
                                    medicine.genericName,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      height: 1.2,
                                      color: Colors.black,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                // Generic Name
                                Flexible(
                                  child: RichText(
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
                                          text: medicine.brandName ?? '',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                // Date and View details
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _formatDate(medicine.createdAt),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context.push(
                                          "/checkInfoPage/${medicine.id}", // Pass medication ID
                                        );
                                      },
                                      child: const Text(
                                        'View details',
                                        style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.0,
                                          color: Color(0xFF4F85AA),
                                          decoration: TextDecoration.underline,
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
          // See All Button
          Padding(
            padding: const EdgeInsets.only(right: 12, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: InkWell(
                    onTap: () => context.push(
                      "/medication",
                    ), // Navigate to a full list of medications
                    child: const Center(
                      child: Text(
                        'See all',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: 20.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  // ✅ Null-safe date formatting
  String _formatDate(dynamic date) {
    if (date == null) return '';
    DateTime parsedDate;
    if (date is String) {
      parsedDate = DateTime.tryParse(date) ?? DateTime.now();
    } else if (date is DateTime) {
      parsedDate = date;
    } else {
      return '';
    }
    return '${parsedDate.day.toString().padLeft(2, '0')}/'
        '${parsedDate.month.toString().padLeft(2, '0')}/'
        '${parsedDate.year}';
  }
}
