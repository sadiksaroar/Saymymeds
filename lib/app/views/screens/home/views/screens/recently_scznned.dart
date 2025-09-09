import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';

class RecentlyScznned extends StatelessWidget {
  const RecentlyScznned({super.key});

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
    {
      "name": "Geaviola",
      "generic_name": "Lipitor",
      "date": "08/08/25",
      "image": "assets/images/bottole.png",
    },

    //
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
                width: double.infinity, // Make card full width
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
                    padding: const EdgeInsets.fromLTRB(10, 10, 12, 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          medicine["image"]!,
                          width: 138,
                          height: 160,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Medicine Name
                              Text(
                                medicine["name"]!,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 26,
                                  height: 1.4,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 12),
                              // Generic Name
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
                                    TextSpan(text: medicine["generic_name"]!),
                                  ],
                                ),
                              ),
                              // const Spacer(),
                              // Date and View details
                              SizedBox(height: 25),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    medicine["date"]!,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () =>
                                        context.push("/medicineDetailPage"),
                                    child: const Text(
                                      'View details',
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0,
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
          padding: const EdgeInsets.only(right: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color:
                        AppColors.buttonColor, // <-- Set your border color here
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => context.push("/medication"),
                        child: Center(
                          child: const Text(
                            'See all',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0,
                              height: 1.0,
                              color: AppColors.grey,
                              // decoration: TextDecoration.underline,
                            ),
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

        // Subscription Banner
        // Center(
        //   child: Container(
        //     width: double.infinity,
        //     height: 136,
        //     padding: const EdgeInsets.all(20),
        //     margin: const EdgeInsets.symmetric(horizontal: 12),
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(25),
        //       gradient: const LinearGradient(
        //         colors: [Color(0xFF4FAAA2), Color(0xFF4F85AA)],
        //         begin: Alignment.topCenter,
        //         end: Alignment.bottomCenter,
        //       ),
        //     ),
        //     child: Row(
        //       children: [
        //         Expanded(
        //           child: RichText(
        //             text: const TextSpan(
        //               style: TextStyle(color: Colors.white, fontSize: 18),
        //               children: <TextSpan>[
        //                 TextSpan(
        //                   text: 'Check out the ',
        //                   style: TextStyle(fontWeight: FontWeight.normal),
        //                 ),
        //                 TextSpan(
        //                   text: 'BEST SUBSCRIPTION PLAN',
        //                   style: TextStyle(fontWeight: FontWeight.bold),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //         IconButton(
        //           icon: Image.asset(
        //             "assets/icons/Back_page.png",
        //             height: 44,
        //             width: 44,
        //           ),
        //           onPressed: () {
        //             context.push('/subscriptionCard');
        //           },
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
