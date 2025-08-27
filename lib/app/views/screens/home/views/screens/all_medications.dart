import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';

class AllMedications extends StatelessWidget {
  const AllMedications({super.key});

  final List<Map<String, String>> medicines = const [
    {
      "name": "Atrovastatin",
      "dosage": "20 mg once daily at night",
      "date": "08/08/25",
      "image": "assets/images/image 4.png",
    },
    {
      "name": "Lisinopril",
      "dosage": "10 mg once daily",
      "date": "08/08/25",
      "image": "assets/images/Lisinpril.png",
    },
    {
      "name": "Metformin",
      "dosage": "500 mg twice daily with meal",
      "date": "08/08/25",
      "image": "assets/images/Metform.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: medicines.length,
            padding: const EdgeInsets.all(12),
            itemBuilder: (context, index) {
              final medicine = medicines[index];
              return SizedBox(
                width: 400,
                height: 190,
                child: Card(
                  color: AppColors.whiteBackground,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Color(0xFF4F85AA), width: 1),
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
                                          fontSize: 30,
                                          height: 1.0,
                                          letterSpacing: 0.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      // Icon(
                                      //   Icons.delete, // apni je icon chai seta
                                      //   color: Colors.red,
                                      //   size: 28,
                                      // ),
                                    ],
                                  ),
                                  // const SizedBox(height: 10),
                                  // Dosage: bold
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
                                          text: "Dosage: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(text: medicine["dosage"]!),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              // Date and View details
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    medicine["date"]!,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () =>
                                        context.go("/medicineDetailPage"),
                                    child: const Text(
                                      'View details',
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.0,
                                        height: 1.0,
                                        letterSpacing: 0.0,
                                        color: Color(0xFF4F85AA),
                                        decoration: TextDecoration.underline,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        decorationThickness: 1.0,
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
        // Sell All Button
        Padding(
          padding: const EdgeInsets.only(right: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => context.go(""),
                child: const Text(
                  'See all',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w400,
                    fontSize: 20.0,
                    height: 1.0,
                    letterSpacing: 0.0,
                    color: AppColors.grey,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationThickness: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Optional: Subscription Banner
        SizedBox(height: 25),
        Center(
          child: Container(
            width: 400, // width: 400
            height: 136, // height: 136
            padding: const EdgeInsets.all(35), // left, top, right, bottom
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                colors: [Color(0xFF4FAAA2), Color(0xFF4F85AA)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // space managed manually via gap
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Check out the ', // Regular text
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),

                        const TextSpan(
                          text: 'BEST SUBSCRIPTION PLAN', // Bold text
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 36), // gap: 36px
                IconButton(
                  icon: Image.asset(
                    "assets/icons/Back_page.png", // Your image path
                    height: 44, // Set the height
                    width: 44, // Set the width
                  ),
                  onPressed: () {
                    // Navigates to the 'signin' screen when the icon is pressed
                    context.push('');
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
