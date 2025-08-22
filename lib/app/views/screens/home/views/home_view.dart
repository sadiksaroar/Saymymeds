import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                ////////// Header
                Row(
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
                                letterSpacing: 0.0,
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
                                letterSpacing: 0.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/icons/raja.png", // Use Image widget for asset image
                      width: 48, // Set width to adjust icon size
                      height: 48, // Set height to adjust icon size
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // ---------------- SCAN MEDICATION CARD ----------------
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: Container(
                    height: 573,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF4FAAA2),
                          Color(0xFF4F85AA),
                          // Color.fromRGBO(79, 133, 170, 0.9),
                        ], // background gradient
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Stack to overlay the Divider over the image
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            // Image layer
                            Image.asset(
                              "assets/images/.png.png",
                              height: 323,
                              fit: BoxFit.contain,
                            ),
                            // Gradient overlay layer
                            Container(
                              height: 255, // Match the height of the image
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment
                                      .topCenter, // Start the gradient from top
                                  end: Alignment
                                      .bottomCenter, // End the gradient at the bottom
                                  colors: [
                                    Color.fromRGBO(
                                      248,
                                      249,
                                      251,
                                      0,
                                    ), // rgba(248, 249, 251, 0)
                                    Color.fromRGBO(
                                      79,
                                      133,
                                      170,
                                      0.9,
                                    ), // rgba(79, 133, 170, 0.9)
                                  ],
                                  stops: [
                                    0.0,
                                    0.9,
                                  ], // Control the stop points for the gradient
                                ),
                              ),
                            ),
                            // Divider layer
                            Positioned(
                              bottom: 35, // Adjust the position of the divider
                              left: 0,
                              right: 0,
                              child: Container(
                                width: double
                                    .infinity, // Make the divider stretch across the full width
                                child: const Divider(
                                  color: Colors.white70,
                                  thickness: 5,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ), // Additional space if needed
                        // Title Text
                        const Text(
                          "Scan Medication",
                          style: TextStyle(
                            color: Color(0xFFF8F9FB),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600, // SemiBold weight
                            fontSize: 30.0,
                            height: 1.0,
                            letterSpacing: 0.0,
                          ),
                        ),
                        const SizedBox(height: 6),

                        // Description Text
                        const Text(
                          "Point your camera at the label\n to identify your medication.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFF8F9FB),
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400, // Regular weight
                            fontSize: 22.0,
                            height: 1.09,
                            letterSpacing: 0.0,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Scan Button
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.qr_code_scanner, size: 50),
                          label: const Text(
                            "Scan",
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w600,
                              fontSize: 50.0,
                              height: 1.0,
                              letterSpacing: 0.0,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            minimumSize: const Size(
                              320,
                              84,
                            ), // Set width 320 and height 84
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
      ),
    );
  }
}
