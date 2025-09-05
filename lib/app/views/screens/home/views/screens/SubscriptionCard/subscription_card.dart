import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saymymeds/app/core/app_routes/app_routes.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/components/CustomButton/custom_button.dart';
import 'package:saymymeds/app/widgets/BottomNav.dart';

class SubscriptionCard extends StatefulWidget {
  const SubscriptionCard({super.key});

  @override
  State<SubscriptionCard> createState() => _SubscriptionCardState();
}

class _SubscriptionCardState extends State<SubscriptionCard> {
  int _currentIndex = 0;

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
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF8F9FB),
            boxShadow: [
              BoxShadow(
                color: const Color(0x26000000),
                offset: const Offset(0, 2),
                blurRadius: 10,
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
                  fontSize: 24,
                  color: AppColors.primary,
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Image.asset(
              "assets/images/Logo 4.png",
              width: 88,
              height: 83,
            ),
          ),
          const SizedBox(height: 25),

          // Subscription Cards
          subscriptionCard(
            title: "Subscribe",
            price: "\$0",
            features: [
              "Read up to three different prescriptions daily for one person",
              "Enjoy promotional offers tailored for your needs",
              "Free with Ads",
              "Monthly app updates and user stories",
            ],
            buttonText: "Current Plan",
            buttonColor: AppColors.lightBlueGray,
          ),

          const SizedBox(height: 25),
          subscriptionCard(
            title: "Voice Booster",
            price: "\$5",
            features: [
              "Includes all subscriber rewards",
              "Unlimited scans per day",
              "10 scans per day with limited advertisements",
              "Early access to new app features (beta program)",
              "Behind-the-scenes updates on development and impact",
            ],
            buttonText: "Purchase Plan",
            buttonColor: AppColors.buttonColor,
          ),

          const SizedBox(height: 25),
          // Banner
          bannerWidget(
            textParts: [
              "Your donation helps bring ",
              "voice-based prescription support",
              "  Every tier helps us grow, reach more users, and build a safer, ",
            ],
          ),

          const SizedBox(height: 25),
          subscriptionCard(
            title: "Accessibility Advocate",
            price: "\$20",
            features: [
              "All Voice Booster rewards",
              "Quarterly live Zoom call with the team & accessibility experts",
              "Digital badge + printable Certificate of Appreciation",
              "Name listed in the website supporter credits",
            ],
            buttonText: "Purchase Plan",
            buttonColor: AppColors.buttonColor,
          ),

          const SizedBox(height: 25),
          subscriptionCard(
            title: "Health Hero",
            price: "\$200",
            features: [
              "All Accessibility Advocate rewards",
              "A donated premium subscription given in your honor to a low-vision user (with impact update!)",
              "“Supporter Spotlight” mention in newsletter or social media (optional)",
              "Input on feature development (exclusive surveys and feedback group)",
              "Personalized thank-you video from a team member or user",
              "Name and/or logo listed as a gold sponsor on our website",
            ],
            buttonText: "Purchase Plan",
            buttonColor: AppColors.buttonColor,
          ),

          const SizedBox(height: 25),
          subscriptionCard(
            title: "Visionary Sponsor",
            price: "\$500",
            features: [
              "All Health Hero rewards",
              "Annual gift box",
              "Name and/or logo listed as a platinum major sponsor on our website and inside the app",
            ],
            buttonText: "Purchase Plan",
            buttonColor: AppColors.buttonColor,
          ),

          const SizedBox(height: 25),
          bannerWidget(
            textParts: [
              "Want to give without a monthly commitment? We welcome one-time contributions too — visit ",
              "saymymeds.com/donate",
              " or contact us directly for more ways to help.",
            ],
            isDonation: true,
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }

  Widget subscriptionCard({
    required String title,
    required String price,
    required List<String> features,
    required String buttonText,
    required Color buttonColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary),
      ),
      child: SingleChildScrollView(
        // <-- prevents overflow
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppColors.bgTextDark,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: price,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const TextSpan(
                    text: " /month",
                    style: TextStyle(fontSize: 20, color: AppColors.primary),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            ...features.map((e) => buildFeature(e)).toList(),
            const SizedBox(height: 25),
            CustomButton(
              backgroundColor: buttonColor,
              child: Text(
                buttonText,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: const Color(0xFFF8F9FB),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bannerWidget({
    required List<String> textParts,
    bool isDonation = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: isDonation ? 320 : 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: const DecorationImage(
          image: AssetImage('assets/icons/Slogun banner.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: isDonation
            ? Column(
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
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: textParts[0],
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: textParts[1],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: textParts[2],
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: textParts[0],
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: textParts[1],
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: textParts[2],
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
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
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
