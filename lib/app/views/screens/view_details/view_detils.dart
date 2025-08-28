/*import 'package:flutter/material.dart';

class MedicineDetailPage extends StatefulWidget {
  const MedicineDetailPage({super.key});

  @override
  State<MedicineDetailPage> createState() => _MedicineDetailPageState();
}

class _MedicineDetailPageState extends State<MedicineDetailPage> {
  String lang = 'English';
  bool isPlaying = false;

  // Grey color for text
  Color textPrimary = Colors.grey[800]!;
  Color textSecondary = Colors.grey[600]!;

  @override
  Widget build(BuildContext context) {
    const divider = Color(0xFF4F85AA);
    const blue = Color(0xFF4F85AA);

    return Container(
      padding: const EdgeInsets.all(10),
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage(
      //       'assets/images/Background.png',
      //     ), // Replace with your asset path
      //     fit: BoxFit.cover, // Adjusts the image to cover the container
      //   ),
      // ),
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: Stack(
                children: [
                  // Background Image Container

                  // Content Container
                  SingleChildScrollView(
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
                                onPressed: () => Navigator.maybePop(context),
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
                                        value: 'German',
                                        child: Text('German'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Chinesh',
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

                                    onChanged: (v) =>
                                        setState(() => lang = v ?? 'English'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Main card
                        Container(
                          padding: const EdgeInsets.fromLTRB(12, 12, 12, 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Image area
                              Container(
                                padding: const EdgeInsets.all(12),

                                decoration: BoxDecoration(
                                  // color: Colors.white, // White background color
                                  border: Border.all(
                                    color: Color(
                                      0xFFC8D9E5,
                                    ), // Apply 50% opacity to the border color
                                    width: 2, // Border width
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ), // Rounded corners
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
                                                    BorderRadius.circular(12),
                                                child: Image.network(
                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRd78HBUUQsCnz1q8LbmAL0c6xBV2-FJQJ3Wg&s',
                                                  width: 160,
                                                  height: 170,
                                                  fit: BoxFit.contain,
                                                  errorBuilder: (_, __, ___) =>
                                                      const Icon(
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
                                                  : Icons.play_arrow_rounded,
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
                                            backgroundColor: Color(0xFF4F85AA),
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
                                            'Lisinopril',
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
                                                _chipPills('(28 Pills)', blue),
                                                _chip('Pain reliever', blue),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),

                                      // Date + time
                                      Row(
                                        children: [
                                          _meta('08-17-2025'),
                                          const SizedBox(width: 12),
                                          const Text(
                                            '|',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          _meta('03:42 AM'),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      _divider(divider),

                                      // Info sections
                                      _sectionTitle('Generic Name'),
                                      _sectionValue('Paracetamol'),
                                      _divider(divider),

                                      _sectionTitle('Brand Name'),
                                      _sectionValue('Panadol'),
                                      _divider(divider),

                                      _sectionTitle('Manufacturer'),
                                      _sectionValue('GSK (GlaxoSmithKline)'),
                                      _divider(divider),

                                      _sectionTitle('Drug Class'),
                                      _sectionValue(
                                        'Analgesic (pain reliever) and antipyretic (fever reducer)',
                                      ),
                                      _divider(divider),

                                      _sectionTitle('Uses'),
                                      _sectionValue(
                                        'Fast effective pain relief',
                                      ),
                                      _divider(divider),

                                      _sectionTitle('Dosage Information'),
                                      const SizedBox(height: 6),
                                      _bulleter(
                                        'Adults: 500mg to 1000mg every 4–6 hours. Max 4000mg in 24 hours.',
                                      ),
                                      _bulleter(
                                        'Children: Varies by weight/age. Consult healthcare provider.',
                                      ),
                                      _bulleter(
                                        'Elderly: May need lower doses. Consult healthcare provider.',
                                      ),
                                      _divider(divider),

                                      _sectionTitle('How to Take'),
                                      _bullet(
                                        'Swallow the tablets whole with a glass of water.',
                                      ),
                                      _bullet(
                                        'Follow the dosage instructions provided by your healthcare provider or on the packaging.',
                                      ),
                                      _divider(divider),

                                      _sectionTitle('Side Effects'),
                                      _bullet(
                                        'Common side effects: nausea, vomiting, allergic reactions.',
                                      ),
                                      _bullet(
                                        'Serious but rare: liver damage in high doses.',
                                      ),
                                      _divider(divider),

                                      _sectionTitle('Warnings'),
                                      _bullet(
                                        'Do not exceed the recommended dose to avoid liver damage.',
                                      ),
                                      _bullet(
                                        'Consult a healthcare provider if you have liver/kidney disease.',
                                      ),
                                      _bullet(
                                        'Avoid alcohol consumption while taking this medication.',
                                      ),
                                      _divider(divider),

                                      _sectionTitle('Storage Instructions'),
                                      _bullet(
                                        'Store at room temperature away from moisture and heat.',
                                      ),
                                      _bullet('Keep out of reach of children.'),
                                      _divider(divider),

                                      _sectionTitle('Interactions'),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 6),
                                        child: Text(
                                          'Paracetamol may interact with blood thinners (e.g., warfarin) and increase bleeding risk. Consult healthcare provider.',
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
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              // Add the TextField for adding notes
                                              Expanded(
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    hintText: "Add notes",
                                                    hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
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
                                // Save logic
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

  static Widget _dot() => const Padding(
    padding: EdgeInsets.symmetric(horizontal: 8),
    child: Icon(Icons.circle, size: 6, color: Colors.grey),
  );

  static Widget _sectionTitle(String t) => Padding(
    padding: const EdgeInsets.only(top: 12),
    child: Text(
      t,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600, // Semi-bold weight
        color: const Color(0xFF333333), // Custom color (#333333)
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
              color: const Color(0xFF848484),
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
        const Padding(padding: EdgeInsets.only(top: 6)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            v,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.4,
              color: const Color(0xFF848484),
            ),
          ),
        ),
      ],
    ),
  );

  static Widget _divider(Color c) => Padding(
    padding: const EdgeInsets.only(top: 12),
    child: Divider(
      color: Color(0xFF4F85AA), // Correct way to apply the color
      thickness: 1,
    ),
  );
}

*/

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';

// MedicineDetailPage
class MedicineDetailPage extends StatefulWidget {
  const MedicineDetailPage({super.key});

  @override
  State<MedicineDetailPage> createState() => _MedicineDetailPageState();
}

class _MedicineDetailPageState extends State<MedicineDetailPage> {
  String lang = 'English';
  bool isPlaying = false;

  // Grey color for text
  Color textPrimary = Colors.grey[800]!;
  Color textSecondary = Colors.grey[600]!;

  @override
  Widget build(BuildContext context) {
    const divider = Color(0xFF4F85AA);
    const blue = Color(0xFF4F85AA);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.10, -1.00),
              end: Alignment(0.10, 1.00),
              colors: [
                const Color(0xFF4F85AA),
                const Color(0xFFF8F9FB),
                const Color(0xFFF8F9FB),
                const Color(0xFFF8F9FB),
                const Color(0xFFF8F9FB),
              ],
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    // Top bar
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Padding(
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
                              onPressed: () => context.pop(),
                            ),
                            const Spacer(),
                            Container(
                              width: 157,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  dropdownColor: AppColors.whiteBackground,
                                  value: lang,
                                  isExpanded: true, // 👈 Prevents overflow
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
                                      ), // 👈 Truncate text
                                    ),
                                    DropdownMenuItem(
                                      value: 'French',
                                      child: Text(
                                        'French (Français)',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Chinese',
                                      child: Text(
                                        'Chinese (简体中文)',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Creole',
                                      child: Text('Creole'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Russian',
                                      child: Text('Russian'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Portuguese',
                                      child: Text('Portuguese'),
                                    ),
                                  ],
                                  onChanged: (v) =>
                                      setState(() => lang = v ?? 'English'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Main card
                    Container(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image area
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFC8D9E5),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 360,
                                    height: 180,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          color: const Color(0xFFF8F9FB),
                                        ),
                                        child: Center(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            child: Image.network(
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRd78HBUUQsCnz1q8LbmAL0c6xBV2-FJQJ3Wg&s',
                                              width: 160,
                                              height: 170,
                                              fit: BoxFit.contain,
                                              errorBuilder: (_, __, ___) =>
                                                  const Icon(
                                                    Icons.medication_outlined,
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
                                              : Icons.play_arrow_rounded,
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
                                        backgroundColor: Color(0xFF4F85AA),
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),

                                  // Title + chips
                                  Row(
                                    children: [
                                      Text(
                                        'Lisinopril',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.primary,
                                        ),
                                      ),

                                      _chipPills(
                                        '(28 Pills)',

                                        AppColors.buttonColor,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),

                                  // Date + time
                                  Row(
                                    children: [
                                      _meta('08-17-2025'),
                                      const SizedBox(width: 12),
                                      const Text(
                                        '|',
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      _meta('03:42 AM'),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  _divider(divider),

                                  // Info sections
                                  _sectionTitle('Generic Name'),
                                  _sectionValue('Paracetamol'),
                                  _divider(divider),

                                  _sectionTitle('Brand Name'),
                                  _sectionValue('Panadol'),
                                  _divider(divider),

                                  _sectionTitle('Manufacturer'),
                                  _sectionValue('GSK (GlaxoSmithKline)'),
                                  _divider(divider),

                                  _sectionTitle('Drug Class'),
                                  _sectionValue(
                                    'Analgesic (pain reliever) and antipyretic (fever reducer)',
                                  ),
                                  _divider(divider),

                                  _sectionTitle('Uses'),
                                  _sectionValue('Fast effective pain relief'),
                                  _divider(divider),

                                  _sectionTitle('Dosage Information'),
                                  const SizedBox(height: 6),
                                  _bulleter(
                                    'Adults: 500mg to 1000mg every 4–6 hours. Max 4000mg in 24 hours.',
                                  ),
                                  _bulleter(
                                    'Children: Varies by weight/age. Consult healthcare provider.',
                                  ),
                                  _bulleter(
                                    'Elderly: May need lower doses. Consult healthcare provider.',
                                  ),
                                  _divider(divider),

                                  _sectionTitle('How to Take'),
                                  _bullet(
                                    'Swallow the tablets whole with a glass of water.',
                                  ),
                                  _bullet(
                                    'Follow the dosage instructions provided by your healthcare provider or on the packaging.',
                                  ),
                                  _divider(divider),

                                  _sectionTitle('Side Effects'),
                                  _bullet(
                                    'Common side effects: nausea, vomiting, allergic reactions.',
                                  ),
                                  _bullet(
                                    'Serious but rare: liver damage in high doses.',
                                  ),
                                  _divider(divider),

                                  _sectionTitle('Warnings'),
                                  _bullet(
                                    'Do not exceed the recommended dose to avoid liver damage.',
                                  ),
                                  _bullet(
                                    'Consult a healthcare provider if you have liver/kidney disease.',
                                  ),
                                  _bullet(
                                    'Avoid alcohol consumption while taking this medication.',
                                  ),
                                  _divider(divider),

                                  _sectionTitle('Storage Instructions'),
                                  _bullet(
                                    'Store at room temperature away from moisture and heat.',
                                  ),
                                  _bullet('Keep out of reach of children.'),
                                  _divider(divider),

                                  _sectionTitle('Interactions'),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      'Paracetamol may interact with blood thinners (e.g., warfarin) and increase bleeding risk. Consult healthcare provider.',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        height: 1.4,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  _sectionTitle('Add notes'),
                                  const SizedBox(height: 10),
                                  Container(
                                    height: 80,
                                    width: 360,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              decoration: const InputDecoration(
                                                hintText: "Add notes",
                                                hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 3.0),
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
                    const SizedBox(height: 0.5),

                    // Save button
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            // Save logic
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0x804F85AA),
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

                    SizedBox(height: 60),
                  ],
                ),
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
      style: const TextStyle(
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
    child: Text(text, style: TextStyle(fontSize: 20, color: color)),
  );

  static Widget _meta(String text) => Text(
    text,
    style: TextStyle(
      fontSize: 20,
      color: Colors.grey[600],
      fontWeight: FontWeight.w600,
    ),
  );

  static Widget _sectionTitle(String t) => Padding(
    padding: const EdgeInsets.only(top: 12),
    child: Text(
      t,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Color(0xFF333333),
      ),
    ),
  );

  static Widget _sectionValue(String v) => Padding(
    padding: const EdgeInsets.only(top: 6),
    child: Text(
      v,
      style: const TextStyle(fontSize: 20, height: 1.35, color: Colors.grey),
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
              fontSize: 20,
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
              fontSize: 20,
              height: 1.4,
              color: Color(0xFF848484),
            ),
          ),
        ),
      ],
    ),
  );

  static Widget _divider(Color c) => const Padding(
    padding: EdgeInsets.only(top: 12),
    child: Divider(color: Color(0xFF4F85AA), thickness: 1),
  );
}
