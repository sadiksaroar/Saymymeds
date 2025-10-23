// import 'package:flutter/material.dart';

// class CheckInfoPage extends StatefulWidget {
//   const CheckInfoPage({super.key});

//   @override
//   State<CheckInfoPage> createState() => _CheckInfoPageState();
// }

// class _CheckInfoPageState extends State<CheckInfoPage> {
//   String lang = 'English';
//   bool isPlaying = false;

//   Color textPrimary = Colors.grey[800]!;
//   Color textSecondary = Colors.grey[600]!;

//   @override
//   Widget build(BuildContext context) {
//     const divider = Color(0xFF4F85AA);
//     const blue = Color(0xFF4F85AA);

//     return Container(
//       padding: const EdgeInsets.all(10),
//       child: Scaffold(
//         body: SafeArea(
//           child: Center(
//             child: ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: 430),
//               child: Stack(
//                 children: [
//                   SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         // Top bar
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             children: [
//                               IconButton(
//                                 icon: Image.asset(
//                                   "assets/icons/Back_Icon.png",
//                                   width: 44,
//                                   height: 44,
//                                 ),
//                                 color: textPrimary,
//                                 onPressed: () => Navigator.maybePop(context),
//                               ),
//                               const Spacer(),
//                               Container(
//                                 width: 137,
//                                 height: 40,
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 10,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: DropdownButtonHideUnderline(
//                                   child: DropdownButton<String>(
//                                     value: lang,
//                                     icon: const Icon(Icons.expand_more_rounded),
//                                     items: const [
//                                       DropdownMenuItem(
//                                         value: 'English',
//                                         child: Text('English'),
//                                       ),
//                                       DropdownMenuItem(
//                                         value: 'Spanish',
//                                         child: Text('Spanish'),
//                                       ),
//                                       DropdownMenuItem(
//                                         value: 'French',
//                                         child: Text('French'),
//                                       ),
//                                       DropdownMenuItem(
//                                         value: 'German',
//                                         child: Text('German'),
//                                       ),
//                                       DropdownMenuItem(
//                                         value: 'Chinesh',
//                                         child: Text('Chinese'),
//                                       ),
//                                       DropdownMenuItem(
//                                         value: 'Creole',
//                                         child: Text('Creole'),
//                                       ),
//                                       DropdownMenuItem(
//                                         value: "Russian",
//                                         child: Text("Russian"),
//                                       ),
//                                       DropdownMenuItem(
//                                         value: 'Portuguese',
//                                         child: Text('Portuguese'),
//                                       ),
//                                     ],
//                                     onChanged: (v) =>
//                                         setState(() => lang = v ?? 'English'),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 16),

//                         // Main card
//                         Container(
//                           padding: const EdgeInsets.fromLTRB(12, 12, 12, 18),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               // Image area
//                               Container(
//                                 padding: const EdgeInsets.all(12),
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: Color(0xFFC8D9E5),
//                                     width: 2,
//                                   ),
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       SizedBox(
//                                         width: 360,
//                                         height: 180,
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(10),
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(12),
//                                               color: Color(0xFFF8F9FB),
//                                             ),
//                                             child: Center(
//                                               child: ClipRRect(
//                                                 borderRadius:
//                                                     BorderRadius.circular(12),
//                                                 child: Image.network(
//                                                   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRd78HBUUQsCnz1q8LbmAL0c6xBV2-FJQJ3Wg&s',
//                                                   width: 160,
//                                                   height: 170,
//                                                   fit: BoxFit.contain,
//                                                   errorBuilder: (_, __, ___) =>
//                                                       const Icon(
//                                                         Icons
//                                                             .medication_outlined,
//                                                         size: 72,
//                                                       ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(height: 12),

//                                       // Play button
//                                       SizedBox(
//                                         height: 100,
//                                         width: 360,
//                                         child: ElevatedButton.icon(
//                                           onPressed: () => setState(
//                                             () => isPlaying = !isPlaying,
//                                           ),
//                                           icon: Container(
//                                             width: 50,
//                                             height: 50,
//                                             decoration: const BoxDecoration(
//                                               color: Colors.white,
//                                               shape: BoxShape.circle,
//                                             ),
//                                             child: Icon(
//                                               isPlaying
//                                                   ? Icons.pause_rounded
//                                                   : Icons.play_arrow_rounded,
//                                               color: Color(0xFF4F85AA),
//                                               size: 50,
//                                             ),
//                                           ),
//                                           label: const Text(
//                                             'Play',
//                                             style: TextStyle(
//                                               fontSize: 40,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                           style: ElevatedButton.styleFrom(
//                                             backgroundColor: Color(0xFF4F85AA),
//                                             foregroundColor: Colors.white,
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(14),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(height: 12),

//                                       // Title + chips
//                                       Row(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.end,
//                                         children: [
//                                           Text(
//                                             'Lisinopril',
//                                             style: TextStyle(
//                                               fontSize: 22,
//                                               fontWeight: FontWeight.w700,
//                                               color: textPrimary,
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 _chipPills('(28 Pills)', blue),
//                                                 _chip('Pain reliever', blue),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 8),

//                                       // Date + time
//                                       Row(
//                                         children: [
//                                           _meta('08-17-2025'),
//                                           const SizedBox(width: 12),
//                                           const Text(
//                                             '|',
//                                             style: TextStyle(
//                                               fontSize: 18,
//                                               color: Colors.grey,
//                                             ),
//                                           ),
//                                           const SizedBox(width: 12),
//                                           _meta('03:42 AM'),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 10),
//                                       _divider(divider),

//                                       // Info sections
//                                       _sectionTitle('Generic Name'),
//                                       _sectionValue('Paracetamol'),
//                                       _divider(divider),

//                                       _sectionTitle('Brand Name'),
//                                       _sectionValue('Panadol'),
//                                       _divider(divider),

//                                       _sectionTitle('Manufacturer'),
//                                       _sectionValue('GSK (GlaxoSmithKline)'),
//                                       _divider(divider),

//                                       _sectionTitle('Drug Class'),
//                                       _sectionValue(
//                                         'Analgesic (pain reliever) and antipyretic (fever reducer)',
//                                       ),
//                                       _divider(divider),

//                                       _sectionTitle('Uses'),
//                                       _sectionValue(
//                                         'Fast effective pain relief',
//                                       ),
//                                       _divider(divider),

//                                       _sectionTitle('Dosage Information'),
//                                       const SizedBox(height: 6),
//                                       _bulleter(
//                                         'Adults: 500mg to 1000mg every 4–6 hours. Max 4000mg in 24 hours.',
//                                       ),
//                                       _bulleter(
//                                         'Children: Varies by weight/age. Consult healthcare provider.',
//                                       ),
//                                       _bulleter(
//                                         'Elderly: May need lower doses. Consult healthcare provider.',
//                                       ),
//                                       _divider(divider),

//                                       _sectionTitle('How to Take'),
//                                       _bullet(
//                                         'Swallow the tablets whole with a glass of water.',
//                                       ),
//                                       _bullet(
//                                         'Follow the dosage instructions provided by your healthcare provider or on the packaging.',
//                                       ),
//                                       _divider(divider),

//                                       _sectionTitle('Side Effects'),
//                                       _bullet(
//                                         'Common side effects: nausea, vomiting, allergic reactions.',
//                                       ),
//                                       _bullet(
//                                         'Serious but rare: liver damage in high doses.',
//                                       ),
//                                       _divider(divider),

//                                       _sectionTitle('Warnings'),
//                                       _bullet(
//                                         'Do not exceed the recommended dose to avoid liver damage.',
//                                       ),
//                                       _bullet(
//                                         'Consult a healthcare provider if you have liver/kidney disease.',
//                                       ),
//                                       _bullet(
//                                         'Avoid alcohol consumption while taking this medication.',
//                                       ),
//                                       _divider(divider),

//                                       _sectionTitle('Storage Instructions'),
//                                       _bullet(
//                                         'Store at room temperature away from moisture and heat.',
//                                       ),
//                                       _bullet('Keep out of reach of children.'),
//                                       _divider(divider),

//                                       _sectionTitle('Interactions'),
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 6),
//                                         child: Text(
//                                           'Paracetamol may interact with blood thinners (e.g., warfarin) and increase bleeding risk. Consult healthcare provider.',
//                                           style: const TextStyle(
//                                             fontSize: 13.5,
//                                             height: 1.4,
//                                             color: Colors.grey,
//                                           ),
//                                         ),
//                                       ),
//                                       _sectionTitle('Add notes'),
//                                       const SizedBox(height: 6),
//                                       Container(
//                                         height: 141,
//                                         width: 360,
//                                         decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           border: Border.all(
//                                             color: Colors.grey,
//                                           ),
//                                           borderRadius: BorderRadius.all(
//                                             Radius.circular(8),
//                                           ),
//                                         ),
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(10.0),
//                                           child: Row(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.center,
//                                             children: [
//                                               Expanded(
//                                                 child: TextField(
//                                                   decoration: InputDecoration(
//                                                     hintText: "Add notes",
//                                                     hintStyle: TextStyle(
//                                                       color: Colors.grey,
//                                                     ),
//                                                     border: InputBorder.none,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: const EdgeInsets.only(
//                                                   top: 3.0,
//                                                 ),
//                                                 child: Icon(
//                                                   Icons.edit,
//                                                   size: 30,
//                                                   color: Colors.grey,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 1),

//                         // Save button
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: SizedBox(
//                             width: double.infinity,
//                             height: 48,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 // Save logic
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Color(0x804F85AA),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                               ),
//                               child: const Text(
//                                 'Save',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Helpers
//   static Widget _chip(String text, Color color) => Container(
//     height: 34,
//     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//     decoration: BoxDecoration(
//       color: Color(0xFF5B9BD5),
//       borderRadius: BorderRadius.circular(20),
//     ),
//     child: Text(
//       text,
//       style: TextStyle(
//         fontSize: 12.5,
//         fontWeight: FontWeight.w600,
//         color: Colors.black,
//       ),
//     ),
//   );

//   static Widget _chipPills(String text, Color color) => Container(
//     height: 34,
//     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//     decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
//     child: Text(
//       text,
//       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: color),
//     ),
//   );

//   static Widget _meta(String text) => Text(
//     text,
//     style: TextStyle(
//       fontSize: 13,
//       color: Colors.grey[600],
//       fontWeight: FontWeight.w600,
//     ),
//   );

//   static Widget _sectionTitle(String t) => Padding(
//     padding: const EdgeInsets.only(top: 12),
//     child: Text(
//       t,
//       style: const TextStyle(
//         fontSize: 14,
//         fontWeight: FontWeight.w600,
//         color: Color(0xFF333333),
//       ),
//     ),
//   );

//   static Widget _sectionValue(String v) => Padding(
//     padding: const EdgeInsets.only(top: 6),
//     child: Text(
//       v,
//       style: const TextStyle(fontSize: 13.5, height: 1.35, color: Colors.grey),
//     ),
//   );

//   static Widget _bullet(String v) => Padding(
//     padding: const EdgeInsets.only(top: 8),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.only(top: 6),
//           child: Icon(Icons.circle, size: 6, color: Colors.grey),
//         ),
//         const SizedBox(width: 8),
//         Expanded(
//           child: Text(
//             v,
//             style: const TextStyle(
//               fontSize: 13.5,
//               height: 1.4,
//               color: Color(0xFF848484),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );

//   static Widget _bulleter(String v) => Padding(
//     padding: const EdgeInsets.only(top: 8),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(padding: EdgeInsets.only(top: 6)),
//         const SizedBox(width: 8),
//         Expanded(
//           child: Text(
//             v,
//             style: const TextStyle(
//               fontSize: 13.5,
//               height: 1.4,
//               color: Color(0xFF848484),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );

//   static Widget _divider(Color c) => Padding(
//     padding: const EdgeInsets.only(top: 12),
//     child: Divider(color: Color(0xFF4F85AA), thickness: 1),
//   );
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'medication_controller.dart'; // Import your controller

// class CheckInfoPage extends StatefulWidget {
//   const CheckInfoPage({super.key});

//   @override
//   State<CheckInfoPage> createState() => _CheckInfoPageState();
// }

// class _CheckInfoPageState extends State<CheckInfoPage> {
//   String lang = 'English';
//   bool isPlaying = false;
//   final MedicationController controller = Get.find();
//   final notesController = TextEditingController();

//   Color textPrimary = Colors.grey[800]!;
//   Color textSecondary = Colors.grey[600]!;

//   @override
//   void dispose() {
//     notesController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     const divider = Color(0xFF4F85AA);

//     return Container(
//       padding: const EdgeInsets.all(10),
//       child: Scaffold(
//         body: SafeArea(
//           child: Center(
//             child: ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: 430),
//               child: Stack(
//                 children: [
//                   Obx(() {
//                     if (controller.isLoading.value) {
//                       return const Center(
//                         child: CircularProgressIndicator(
//                           color: Color(0xFF4F85AA),
//                         ),
//                       );
//                     }

//                     if (controller.selectedMedication.value == null) {
//                       return const Center(
//                         child: Text("No medication data available"),
//                       );
//                     }

//                     final med = controller.selectedMedication.value!;
//                     final dosage = med['dosage_information'] ?? {};
//                     final sideEffects = med['side_effects'] ?? {};

//                     return SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           /// TOP BAR
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               children: [
//                                 IconButton(
//                                   icon: Image.asset(
//                                     "assets/icons/Back_Icon.png",
//                                     width: 44,
//                                     height: 44,
//                                   ),
//                                   onPressed: () => Navigator.maybePop(context),
//                                 ),
//                                 const Spacer(),
//                                 Container(
//                                   width: 137,
//                                   height: 40,
//                                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                   child: DropdownButtonHideUnderline(
//                                     child: DropdownButton<String>(
//                                       value: lang,
//                                       icon: const Icon(Icons.expand_more_rounded),
//                                       items: const [
//                                         DropdownMenuItem(
//                                           value: 'English',
//                                           child: Text('English'),
//                                         ),
//                                         DropdownMenuItem(
//                                           value: 'Spanish',
//                                           child: Text('Spanish'),
//                                         ),
//                                         DropdownMenuItem(
//                                           value: 'French',
//                                           child: Text('French'),
//                                         ),
//                                       ],
//                                       onChanged: (v) =>
//                                           setState(() => lang = v ?? 'English'),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 16),

//                           /// MAIN CARD
//                           Container(
//                             padding: const EdgeInsets.fromLTRB(12, 12, 12, 18),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   padding: const EdgeInsets.all(12),
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                       color: const Color(0xFFC8D9E5),
//                                       width: 2,
//                                     ),
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         /// MEDICINE IMAGE
//                                         SizedBox(
//                                           width: 360,
//                                           height: 180,
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(10),
//                                             child: Container(
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(12),
//                                                 color: const Color(0xFFF8F9FB),
//                                               ),
//                                               child: Center(
//                                                 child: ClipRRect(
//                                                   borderRadius:
//                                                       BorderRadius.circular(12),
//                                                   child: med['original_image'] !=
//                                                           null
//                                                       ? Image.network(
//                                                           'http://10.10.7.24:8002${med['original_image']}',
//                                                           width: 160,
//                                                           height: 170,
//                                                           fit: BoxFit.contain,
//                                                           errorBuilder:
//                                                               (_, __, ___) =>
//                                                                   const Icon(
//                                                                     Icons
//                                                                         .medication_outlined,
//                                                                     size: 72,
//                                                                   ),
//                                                         )
//                                                       : const Icon(
//                                                           Icons
//                                                               .medication_outlined,
//                                                           size: 72,
//                                                         ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         const SizedBox(height: 12),

//                                         /// PLAY BUTTON
//                                         SizedBox(
//                                           height: 100,
//                                           width: 360,
//                                           child: ElevatedButton.icon(
//                                             onPressed: () => setState(
//                                               () => isPlaying = !isPlaying,
//                                             ),
//                                             icon: Container(
//                                               width: 50,
//                                               height: 50,
//                                               decoration: const BoxDecoration(
//                                                 color: Colors.white,
//                                                 shape: BoxShape.circle,
//                                               ),
//                                               child: Icon(
//                                                 isPlaying
//                                                     ? Icons.pause_rounded
//                                                     : Icons.play_arrow_rounded,
//                                                 color: const Color(0xFF4F85AA),
//                                                 size: 50,
//                                               ),
//                                             ),
//                                             label: const Text(
//                                               'Play',
//                                               style: TextStyle(
//                                                 fontSize: 40,
//                                                 fontWeight: FontWeight.w600,
//                                               ),
//                                             ),
//                                             style: ElevatedButton.styleFrom(
//                                               backgroundColor:
//                                                   const Color(0xFF4F85AA),
//                                               foregroundColor: Colors.white,
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(14),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         const SizedBox(height: 12),

//                                         /// TITLE + CHIPS
//                                         Row(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.end,
//                                           children: [
//                                             Text(
//                                               med['brand_name'] ?? 'Unknown',
//                                               style: TextStyle(
//                                                 fontSize: 22,
//                                                 fontWeight: FontWeight.w700,
//                                                 color: textPrimary,
//                                               ),
//                                             ),
//                                             const Spacer(),
//                                             _chip(
//                                               '(${med['tot_pills']} Pills)',
//                                               const Color(0xFF4F85AA),
//                                             ),
//                                           ],
//                                         ),
//                                         const SizedBox(height: 8),

//                                         /// DATE + TIME
//                                         Row(
//                                           children: [
//                                             _meta(med['created_at']
//                                                     ?.toString()
//                                                     .split('T')[0] ??
//                                                 'N/A'),
//                                             const SizedBox(width: 12),
//                                             const Text(
//                                               '|',
//                                               style: TextStyle(
//                                                 fontSize: 18,
//                                                 color: Colors.grey,
//                                               ),
//                                             ),
//                                             const SizedBox(width: 12),
//                                             _meta('Active'),
//                                           ],
//                                         ),
//                                         const SizedBox(height: 10),
//                                         _divider(divider),

//                                         /// INFO SECTIONS
//                                         _sectionTitle('Generic Name'),
//                                         _sectionValue(
//                                             med['generic_name'] ?? 'N/A'),
//                                         _divider(divider),

//                                         _sectionTitle('Brand Name'),
//                                         _sectionValue(med['brand_name'] ?? 'N/A'),
//                                         _divider(divider),

//                                         _sectionTitle('Manufacturer'),
//                                         _sectionValue(
//                                             med['manufacturer'] ?? 'N/A'),
//                                         _divider(divider),

//                                         _sectionTitle('Drug Class'),
//                                         _sectionValue(med['drug_class'] ?? 'N/A'),
//                                         _divider(divider),

//                                         _sectionTitle('Uses'),
//                                         _sectionValue(med['uses'] ?? 'N/A'),
//                                         _divider(divider),

//                                         _sectionTitle('Dosage Information'),
//                                         const SizedBox(height: 6),
//                                         _bulleter(
//                                             'Adults: ${dosage['adults_dosage'] ?? 'N/A'}'),
//                                         _bulleter(
//                                             'Children: ${dosage['children_dosage'] ?? 'N/A'}'),
//                                         _bulleter(
//                                             'Elderly: ${dosage['elderly_dosage'] ?? 'N/A'}'),
//                                         _divider(divider),

//                                         _sectionTitle('How to Take'),
//                                         _bullet(med['how_to_take'] ?? 'N/A'),
//                                         _divider(divider),

//                                         _sectionTitle('Side Effects'),
//                                         _bullet(
//                                             'Common: ${sideEffects['common'] ?? 'N/A'}'),
//                                         _bullet(
//                                             'Serious: ${sideEffects['serious'] ?? 'N/A'}'),
//                                         _divider(divider),

//                                         _sectionTitle('Warnings'),
//                                         _bullet(med['warnings'] ?? 'N/A'),
//                                         _divider(divider),

//                                         _sectionTitle('Storage Instructions'),
//                                         _bullet(
//                                             med['storage_instructions'] ?? 'N/A'),
//                                         _divider(divider),

//                                         _sectionTitle('Interactions'),
//                                         Padding(
//                                           padding:
//                                               const EdgeInsets.only(top: 6),
//                                           child: Text(
//                                             med['interactions'] ?? 'N/A',
//                                             style: const TextStyle(
//                                               fontSize: 13.5,
//                                               height: 1.4,
//                                               color: Colors.grey,
//                                             ),
//                                           ),
//                                         ),
//                                         const SizedBox(height: 12),
//                                         _divider(divider),

//                                         _sectionTitle('AI Additional Notes'),
//                                         Padding(
//                                           padding:
//                                               const EdgeInsets.only(top: 6),
//                                           child: Text(
//                                             med['ai_additional_notes'] ?? 'N/A',
//                                             style: const TextStyle(
//                                               fontSize: 13.5,
//                                               height: 1.4,
//                                               color: Colors.grey,
//                                             ),
//                                           ),
//                                         ),
//                                         _divider(divider),

//                                         _sectionTitle('Add notes'),
//                                         const SizedBox(height: 6),
//                                         Container(
//                                           height: 141,
//                                           width: 360,
//                                           decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             border: Border.all(
//                                               color: Colors.grey,
//                                             ),
//                                             borderRadius:
//                                                 const BorderRadius.all(
//                                               Radius.circular(8),
//                                             ),
//                                           ),
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(10.0),
//                                             child: Row(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               children: [
//                                                 Expanded(
//                                                   child: TextField(
//                                                     controller: notesController,
//                                                     decoration: const InputDecoration(
//                                                       hintText: "Add notes",
//                                                       hintStyle: TextStyle(
//                                                         color: Colors.grey,
//                                                       ),
//                                                       border: InputBorder.none,
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 const Padding(
//                                                   padding: EdgeInsets.only(
//                                                     top: 3.0,
//                                                   ),
//                                                   child: Icon(
//                                                     Icons.edit,
//                                                     size: 30,
//                                                     color: Colors.grey,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 1),

//                           /// SAVE BUTTON
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: SizedBox(
//                               width: double.infinity,
//                               height: 48,
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   Get.snackbar(
//                                     'Success',
//                                     'Notes saved successfully',
//                                     snackPosition: SnackPosition.BOTTOM,
//                                   );
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: const Color(0x804F85AA),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                 ),
//                                 child: const Text(
//                                   'Save',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   }),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   static Widget _chip(String text, Color color) => Container(
//     height: 34,
//     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//     decoration: BoxDecoration(
//       color: color,
//       borderRadius: BorderRadius.circular(20),
//     ),
//     child: Text(
//       text,
//       style: const TextStyle(
//         fontSize: 12.5,
//         fontWeight: FontWeight.w600,
//         color: Colors.white,
//       ),
//     ),
//   );

//   static Widget _meta(String text) => Text(
//     text,
//     style: TextStyle(
//       fontSize: 13,
//       color: Colors.grey[600],
//       fontWeight: FontWeight.w600,
//     ),
//   );

//   static Widget _sectionTitle(String t) => Padding(
//     padding: const EdgeInsets.only(top: 12),
//     child: Text(
//       t,
//       style: const TextStyle(
//         fontSize: 14,
//         fontWeight: FontWeight.w600,
//         color: Color(0xFF333333),
//       ),
//     ),
//   );

//   static Widget _sectionValue(String v) => Padding(
//     padding: const EdgeInsets.only(top: 6),
//     child: Text(
//       v,
//       style: const TextStyle(fontSize: 13.5, height: 1.35, color: Colors.grey),
//     ),
//   );

//   static Widget _bullet(String v) => Padding(
//     padding: const EdgeInsets.only(top: 8),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.only(top: 6),
//           child: Icon(Icons.circle, size: 6, color: Colors.grey),
//         ),
//         const SizedBox(width: 8),
//         Expanded(
//           child: Text(
//             v,
//             style: const TextStyle(
//               fontSize: 13.5,
//               height: 1.4,
//               color: Color(0xFF848484),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );

//   static Widget _bulleter(String v) => Padding(
//     padding: const EdgeInsets.only(top: 8),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(width: 8),
//         Expanded(
//           child: Text(
//             v,
//             style: const TextStyle(
//               fontSize: 13.5,
//               height: 1.4,
//               color: Color(0xFF848484),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );

//   static Widget _divider(Color c) => Padding(
//     padding: const EdgeInsets.only(top: 12),
//     child: Divider(color: c, thickness: 1),
//   );
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saymymeds/app/views/screens/medications/MedicationController/meddication_controller.dart';

class CheckInfoPage extends StatefulWidget {
  final int medicationId;

  const CheckInfoPage({super.key, required this.medicationId});

  @override
  State<CheckInfoPage> createState() => _CheckInfoPageState();
}

class _CheckInfoPageState extends State<CheckInfoPage> {
  final controller = Get.find<MedicationController>();
  late Future<CheckInfoPageApiModel?> medicationDetails;

  String lang = 'English';
  bool isPlaying = false;
  final TextEditingController notesController = TextEditingController();

  Color textPrimary = Colors.grey[800]!;
  Color textSecondary = Colors.grey[600]!;

  @override
  void initState() {
    super.initState();
    medicationDetails = controller.getMedicationDetails(widget.medicationId);
  }

  String getLanguageCode(String lang) {
    switch (lang) {
      case 'Spanish':
        return 'es';
      case 'French':
        return 'fr';
      case 'German':
        return 'de';
      case 'Chinese':
        return 'zh-CN';
      case 'Creole':
        return 'ht';
      case 'Russian':
        return 'ru';
      case 'Portuguese':
        return 'pt';
      default:
        return 'en';
    }
  }

  @override
  Widget build(BuildContext context) {
    const divider = Color(0xFF4F85AA);

    return Container(
      padding: const EdgeInsets.all(10),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: Stack(
                children: [
                  FutureBuilder<CheckInfoPageApiModel?>(
                    future: medicationDetails,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError || snapshot.data == null) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Failed to load medication details'),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () => Navigator.maybePop(context),
                                child: const Text('Go Back'),
                              ),
                            ],
                          ),
                        );
                      }

                      final med = snapshot.data!;

                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            // Top bar
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Image.asset(
                                      "assets/icons/Back_Icon.png",
                                      width: 44,
                                      height: 44,
                                    ),
                                    color: textPrimary,
                                    onPressed: () =>
                                        Navigator.maybePop(context),
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: 137,
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: lang,
                                        icon: const Icon(
                                          Icons.expand_more_rounded,
                                        ),
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
                                            value: 'German',
                                            child: Text('German'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'Chinese',
                                            child: Text('Chinese'),
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
                                            value: 'Portuguese',
                                            child: Text('Portuguese'),
                                          ),
                                        ],
                                        onChanged: (v) {
                                          setState(() => lang = v ?? 'English');
                                          controller.changeLanguage(
                                            getLanguageCode(v ?? 'English'),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Main card
                            Container(
                              padding: const EdgeInsets.fromLTRB(
                                12,
                                12,
                                12,
                                18,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Image area
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xFFC8D9E5),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 360,
                                            height: 180,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: Color(0xFFF8F9FB),
                                                ),
                                                child: Center(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                    child: Image.network(
                                                      med.originalImage ?? '',
                                                      width: 160,
                                                      height: 170,
                                                      fit: BoxFit.contain,
                                                      errorBuilder:
                                                          (
                                                            _,
                                                            __,
                                                            ___,
                                                          ) => const Icon(
                                                            Icons
                                                                .medication_outlined,
                                                            size: 72,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 12),

                                          // Play button
                                          SizedBox(
                                            height: 100,
                                            width: 360,
                                            child: ElevatedButton.icon(
                                              onPressed: () => setState(
                                                () => isPlaying = !isPlaying,
                                              ),
                                              icon: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  isPlaying
                                                      ? Icons.pause_rounded
                                                      : Icons
                                                            .play_arrow_rounded,
                                                  color: Color(0xFF4F85AA),
                                                  size: 50,
                                                ),
                                              ),
                                              label: const Text(
                                                'Play',
                                                style: TextStyle(
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Color(
                                                  0xFF4F85AA,
                                                ),
                                                foregroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 12),

                                          // Title + chips
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                med.brandName ?? 'N/A',
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w700,
                                                  color: textPrimary,
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    _chipPills(
                                                      '(${med.totPills ?? 'N/A'} Pills)',
                                                      Colors.grey,
                                                    ),
                                                    _chip(
                                                      med.drugClass ?? 'N/A',
                                                      Colors.blue,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),

                                          // Date + time
                                          Row(
                                            children: [
                                              _meta(med.createdAt ?? 'N/A'),
                                              const SizedBox(width: 12),
                                              const Text(
                                                '|',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              const SizedBox(width: 12),
                                              _meta(med.updatedAt ?? 'N/A'),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          _divider(divider),

                                          // Info sections
                                          _sectionTitle('Generic Name'),
                                          _sectionValue(
                                            med.genericName ?? 'N/A',
                                          ),
                                          _divider(divider),

                                          _sectionTitle('Brand Name'),
                                          _sectionValue(med.brandName ?? 'N/A'),
                                          _divider(divider),

                                          _sectionTitle('Manufacturer'),
                                          _sectionValue(
                                            med.manufacturer ?? 'N/A',
                                          ),
                                          _divider(divider),

                                          _sectionTitle('Drug Class'),
                                          _sectionValue(med.drugClass ?? 'N/A'),
                                          _divider(divider),

                                          _sectionTitle('Uses'),
                                          _sectionValue(med.uses ?? 'N/A'),
                                          _divider(divider),

                                          _sectionTitle('Dosage Information'),
                                          const SizedBox(height: 6),
                                          if (med.dosageInformation !=
                                              null) ...[
                                            _bulleter(
                                              'Adults: ${med.dosageInformation?.adultsDosage ?? 'N/A'}',
                                            ),
                                            _bulleter(
                                              'Children: ${med.dosageInformation?.childrenDosage ?? 'N/A'}',
                                            ),
                                            _bulleter(
                                              'Elderly: ${med.dosageInformation?.elderlyDosage ?? 'N/A'}',
                                            ),
                                          ] else
                                            _sectionValue('N/A'),
                                          _divider(divider),

                                          _sectionTitle('How to Take'),
                                          _bullet(med.howToTake ?? 'N/A'),
                                          _divider(divider),

                                          _sectionTitle('Side Effects'),
                                          if (med.sideEffects != null) ...[
                                            _bullet(
                                              'Common: ${med.sideEffects?.common ?? 'N/A'}',
                                            ),
                                            _bullet(
                                              'Serious: ${med.sideEffects?.serious ?? 'N/A'}',
                                            ),
                                          ] else
                                            _sectionValue('N/A'),
                                          _divider(divider),

                                          _sectionTitle('Warnings'),
                                          _bullet(med.warnings ?? 'N/A'),
                                          _divider(divider),

                                          _sectionTitle('Storage Instructions'),
                                          _bullet(
                                            med.storageInstructions ?? 'N/A',
                                          ),
                                          _divider(divider),

                                          _sectionTitle('Interactions'),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 6,
                                            ),
                                            child: Text(
                                              med.interactions ?? 'N/A',
                                              style: const TextStyle(
                                                fontSize: 13.5,
                                                height: 1.4,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          _sectionTitle('Add notes'),
                                          const SizedBox(height: 6),
                                          Container(
                                            height: 141,
                                            width: 360,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: Colors.grey,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                10.0,
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: TextField(
                                                      controller:
                                                          notesController,
                                                      decoration:
                                                          InputDecoration(
                                                            hintText:
                                                                "Add notes",
                                                            hintStyle:
                                                                TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          top: 3.0,
                                                        ),
                                                    child: Icon(
                                                      Icons.edit,
                                                      size: 30,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 1),

                            // Save button
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.snackbar(
                                      'Success',
                                      'Notes saved',
                                      duration: const Duration(seconds: 2),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0x804F85AA),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text(
                                    'Save',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helpers
  static Widget _chip(String text, Color color) => Container(
    height: 34,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
      color: Color(0xFF5B9BD5),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 12.5,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
  );

  static Widget _chipPills(String text, Color color) => Container(
    height: 34,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    child: Text(
      text,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: color),
    ),
  );

  static Widget _meta(String text) => Text(
    text,
    style: TextStyle(
      fontSize: 13,
      color: Colors.grey[600],
      fontWeight: FontWeight.w600,
    ),
  );

  static Widget _sectionTitle(String t) => Padding(
    padding: const EdgeInsets.only(top: 12),
    child: Text(
      t,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Color(0xFF333333),
      ),
    ),
  );

  static Widget _sectionValue(String v) => Padding(
    padding: const EdgeInsets.only(top: 6),
    child: Text(
      v,
      style: const TextStyle(fontSize: 13.5, height: 1.35, color: Colors.grey),
    ),
  );

  static Widget _bullet(String v) => Padding(
    padding: const EdgeInsets.only(top: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 6),
          child: Icon(Icons.circle, size: 6, color: Colors.grey),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            v,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.4,
              color: Color(0xFF848484),
            ),
          ),
        ),
      ],
    ),
  );

  static Widget _bulleter(String v) => Padding(
    padding: const EdgeInsets.only(top: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            v,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.4,
              color: Color(0xFF848484),
            ),
          ),
        ),
      ],
    ),
  );

  static Widget _divider(Color c) => Padding(
    padding: const EdgeInsets.only(top: 12),
    child: Divider(color: Color(0xFF4F85AA), thickness: 1),
  );

  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }
}
