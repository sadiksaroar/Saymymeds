// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:saymymeds/app/utlies/apps_color.dart';
// import 'package:saymymeds/app/views/components/AppHeadingText/app_hedaing_text.dart';
// import 'package:saymymeds/app/views/components/CustomButton/custom_button.dart';

// class EnterCode extends StatefulWidget {
//   const EnterCode({super.key});

//   @override
//   State<EnterCode> createState() => _EnterCodeState();
// }

// class _EnterCodeState extends State<EnterCode> {
//   bool isCodeFilled = false; // tracks if 5-digit code is entered

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         toolbarHeight: 80,
//         centerTitle: true,
//         title: Image.asset("assets/images/Logo 4.png", height: 83, width: 88),
//         leading: IconButton(
//           icon: Image.asset(
//             "assets/icons/Back_Icon.png",
//             height: 44,
//             width: 44,
//           ),
//           onPressed: () {
//             context.push('/signin');
//           },
//         ),
//         elevation: 0,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 20),
//               const Center(child: AppHeadingText("Check your email")),
//               const SizedBox(height: 20),
//               const Text(
//                 "We sent a reset link to mytrek@gmail.com. Enter the 5-digit code mentioned in the email.",
//                 style: TextStyle(
//                   color: Color(0xFF848484),
//                   fontFamily: 'Inter',
//                   fontWeight: FontWeight.w400, // Regular
//                   fontStyle: FontStyle.normal, // Regular is normal style
//                   fontSize: 16.0,
//                   height:
//                       1.5, // line-height: 24px (height = line height / font size)
//                   letterSpacing: 0.0, // 0px letter-spacing
//                 ),
//                 // textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),

//               const Align(alignment: Alignment.centerLeft),

//               PinCodeTextField(
//                 appContext: context,
//                 length: 5,
//                 obscureText: false,
//                 animationType: AnimationType.fade,
//                 pinTheme: PinTheme(
//                   shape: PinCodeFieldShape.box,
//                   borderRadius: BorderRadius.circular(16),
//                   fieldHeight: 60,
//                   fieldWidth: 54,
//                   inactiveFillColor: Colors.white,
//                   activeFillColor: Colors.white,
//                   selectedFillColor: Colors.white,
//                   inactiveColor: Colors.grey.shade300,
//                   activeColor: Colors.blue,
//                   selectedColor: Colors.blue,
//                 ),
//                 animationDuration: const Duration(milliseconds: 300),
//                 enableActiveFill: true,
//                 onChanged: (value) {
//                   setState(() {
//                     isCodeFilled =
//                         value.length ==
//                         5; // enable button only if 5 digits entered
//                   });
//                 },
//               ),
//               const SizedBox(height: 20),

//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: CustomButton(
//                   text: "Verify Code",
//                   onPressed: isCodeFilled
//                       ? () {
//                           context.go('/newPassword');
//                         }
//                       : null,
//                   backgroundColor: isCodeFilled
//                       ? AppColors.primary
//                       : const Color(0x804F85AA),
//                   borderRadius: 15,
//                   child: Text(
//                     "Get start",
//                     style: GoogleFonts.poppins(
//                       color: Colors.white,
//                       fontSize: 24,
//                       fontWeight: FontWeight.w600,
//                       fontStyle: FontStyle.normal,
//                       height: 1.0,
//                       letterSpacing: 0.0,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // Resend
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Haven’t got the email yet? ",
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w400, // Regular
//                       fontStyle: FontStyle.normal, // Regular style
//                       fontSize: 24.0,
//                       height: 1.0, // line-height: 100%
//                       letterSpacing: 0.0, // 0px letter-spacing
//                       color: Color(
//                         0xFF848484,
//                       ), // Apply the #848484 color (Grey)
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   GestureDetector(
//                     onTap: () {},
//                     child: const Text(
//                       "Resend code",
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w700, // Bold
//                         fontStyle:
//                             FontStyle.normal, // Bold is handled by FontWeight
//                         fontSize: 24.0,
//                         height: 1.0, // line-height: 100%
//                         letterSpacing: 0.0, // 0px letter-spacing
//                         color: Color(0xFF4F85AA), // Apply #4F85AA color (blue)
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/components/AppHeadingText/app_hedaing_text.dart';
import 'package:saymymeds/app/views/components/CustomButton/custom_button.dart';

class EnterCode extends StatefulWidget {
  const EnterCode({super.key});

  @override
  State<EnterCode> createState() => _EnterCodeState();
}

class _EnterCodeState extends State<EnterCode> {
  bool isCodeFilled = false; // tracks if 6-digit code is entered

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        centerTitle: true,
        title: Image.asset("assets/images/Logo 4.png", height: 83, width: 88),
        leading: IconButton(
          icon: Image.asset(
            "assets/icons/Back_Icon.png",
            height: 44,
            width: 44,
          ),
          onPressed: () {
            context.push('/signin');
          },
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Center(child: AppHeadingText("Check your email")),
              const SizedBox(height: 20),
              const Text(
                "We sent a reset link to mytrek@gmail.com. Enter the 6-digit code mentioned in the email.",
                style: TextStyle(
                  color: Color(0xFF848484),
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0,
                  height: 1.5,
                  letterSpacing: 0.0,
                ),
              ),
              const SizedBox(height: 20),

              PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(16),
                  fieldHeight: 60,
                  fieldWidth: 54,
                  inactiveFillColor: Colors.white,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  inactiveColor: Colors.grey.shade300,
                  activeColor: Colors.blue,
                  selectedColor: Colors.blue,
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onChanged: (value) {
                  setState(() {
                    isCodeFilled = value.length == 6;
                  });
                },
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                  onPressed: isCodeFilled
                      ? () {
                          context.go('/newPassword');
                        }
                      : null,
                  backgroundColor: isCodeFilled
                      ? AppColors.primary
                      : const Color(0x804F85AA),
                  borderRadius: 15,
                  child: Text(
                    "Verify Code",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      height: 1.0,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Resend code section
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Haven’t got the email yet?",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0,
                      height: 1.5,
                      letterSpacing: 0.0,
                      color: Color(0xFF848484),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      // Add resend logic here
                    },
                    child: const Text(
                      "Resend code",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0,
                        height: 1.5,
                        letterSpacing: 0.0,
                        color: Color(0xFF4F85AA),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
