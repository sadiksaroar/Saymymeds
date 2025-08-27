import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/components/CustomButton/custom_button.dart';

class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FB),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // Adjust height
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF8F9FB), // AppBar background color
            boxShadow: [
              BoxShadow(
                color: const Color(0x26000000), // Shadow color with opacity
                offset: const Offset(0, 2), // Shadow position
                blurRadius: 10, // Shadow blur radius
              ),
            ],
          ),
          child: AppBar(
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(
                "assets/icons/cross.png",
                width: 44,
                height: 44,
              ),
            ),
            title: const Center(
              child: Text(
                "Subscription Plan",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 24,
                  height: 1,
                  letterSpacing: 0,
                  color: AppColors.primary, // No letter-spacing
                ),
              ),
            ),

            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 15),

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
            SizedBox(height: 25),
            Column(
              children: [
                SizedBox(height: 24),
                Container(
                  width: 400,
                  height: 490,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.primary),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Subscribe",
                        style: TextStyle(
                          color: AppColors.bgTextDark,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "\$0",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                            // SizedBox(),
                            TextSpan(
                              text: " /month",
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      buildFeature(
                        "Read up to three different prescriptions daily for one person",
                      ),
                      buildFeature(
                        "Enjoy promotional offers tailored for your needs",
                      ),
                      buildFeature("Free with Ads"),
                      buildFeature("Monthly app updates and user stories"),
                      const SizedBox(height: 25),
                      CustomButton(
                        backgroundColor: AppColors.lightBlueGray,
                        child: Text(
                          "Current Plan",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Color(0xFFF8F9FB),
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            height: 1.0,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25),
                Container(
                  width: 400,
                  height: 550,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.primary),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Voice Booster",
                        style: TextStyle(
                          color: AppColors.bgTextDark,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "\$5",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                            // SizedBox(),
                            TextSpan(
                              text: " /month",
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      buildFeature("Includes all subscriber rewards"),
                      buildFeature(" Unlimited scans per day"),
                      buildFeature(
                        "10 scans per day with limited advertisements",
                      ),
                      buildFeature(
                        "Early access to new app features (beta program)",
                      ),
                      buildFeature(
                        "Behind-the-scenes updates on development and impact)",
                      ),

                      const SizedBox(height: 25),
                      CustomButton(
                        backgroundColor: AppColors.buttonColor,
                        child: Text(
                          "Purchase Plan",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Color(0xFFF8F9FB),
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            height: 1.0,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25),
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/icons/Slogun banner.png',
                      ), // Replace with your background image
                      fit: BoxFit
                          .cover, // Adjust how the image fits the container
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                      20.0,
                    ), // Add padding for text spacing
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Your donation helps bring ', // Normal text
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              height: 1.2,
                            ),
                          ),
                          TextSpan(
                            text:
                                'voice-based prescription support', // Bold text
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.bold, // Make this part bold
                              fontFamily: 'Poppins',
                              height: 1.2,
                            ),
                          ),
                          TextSpan(
                            text:
                                ' to people with very low vision. Every tier helps us grow, reach more users, and build a safer, more accessible future.', // Normal text
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.justify, // Align text in the center
                    ),
                  ),
                ),

                SizedBox(height: 25),
                Container(
                  width: 400,
                  height: 550,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.primary),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Accessibility Advocate",
                        style: TextStyle(
                          color: AppColors.bgTextDark,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "\$20",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                            // SizedBox(),
                            TextSpan(
                              text: " /month",
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      buildFeature("All Voice Booster rewards"),
                      buildFeature(
                        " Quarterly live Zoom call with the team & accessibility experts",
                      ),
                      buildFeature(
                        "Digital badge + printable Certificate of Appreciation",
                      ),
                      buildFeature(
                        "Name listed in the website supporter credits)",
                      ),

                      const SizedBox(height: 25),
                      CustomButton(
                        backgroundColor: AppColors.buttonColor,
                        child: Text(
                          "Purchase Plan",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Color(0xFFF8F9FB),
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            height: 1.0,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25),

                SizedBox(height: 25),
                Container(
                  width: 400,
                  height: 780,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.primary),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Health Hero",
                        style: TextStyle(
                          color: AppColors.bgTextDark,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "\$200",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                            // SizedBox(),
                            TextSpan(
                              text: " /month",
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      buildFeature("All Accessibility Advocate rewards"),
                      buildFeature(
                        " A donated premium subscription given in your honor to a low-vision user (with impact update!)",
                      ),
                      buildFeature(
                        "“Supporter Spotlight” mention in newsletter or social media (optional)",
                      ),
                      buildFeature(
                        "Input on feature development (exclusive surveys and feedback group)",
                      ),
                      buildFeature(
                        "Personalized thank-you video from a team member or user",
                      ),
                      buildFeature(
                        "Name and/or logo listed as a gold sponsor on our website",
                      ),

                      const SizedBox(height: 25),
                      CustomButton(
                        backgroundColor: AppColors.buttonColor,
                        child: Text(
                          "Purchase Plan",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Color(0xFFF8F9FB),
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            height: 1.0,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25),

                Container(
                  width: 400,
                  height: 520,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.primary),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Visionary Sponsor",
                        style: TextStyle(
                          color: AppColors.bgTextDark,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "\$500",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                            // SizedBox(),
                            TextSpan(
                              text: " /month",
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      buildFeature("All Health Hero rewards"),
                      buildFeature(" Annual gift box"),
                      buildFeature(
                        "Name and/or logo listed as a platinum major sponsor on our website and inside the app",
                      ),
                      buildFeature(
                        "Name and/or logo listed as a platinum major sponsor on our website and inside the app",
                      ),

                      const SizedBox(height: 25),
                      CustomButton(
                        backgroundColor: AppColors.buttonColor,
                        child: Text(
                          "Purchase Plan",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Color(0xFFF8F9FB),
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            height: 1.0,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25),
                Container(
                  height: 305,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/icons/Slogun banner.png',
                      ), // Replace with your background image
                      fit: BoxFit
                          .cover, // Adjust how the image fits the container
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                      20.0,
                    ), // Add padding for text spacing
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 327,
                          height: 53,
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.whiteBackground,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "One-Time Donations",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Want to give without a monthly commitment? We welcome one-time contributions too — visit ",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: "saymymeds.com/donate",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text:
                                    " or contact us directly for more ways to help.",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFeature(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage('assets/icons/check.png'),
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Poppins', // Font family: Poppins
                fontWeight: FontWeight.w500, // Medium weight (500)
                fontStyle: FontStyle.normal, // Regular (not italic)
                fontSize: 24, // Font size: 24px
                height: 1.0, // Line height: 100%
                letterSpacing: 0.0, // No letter-spacing
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
