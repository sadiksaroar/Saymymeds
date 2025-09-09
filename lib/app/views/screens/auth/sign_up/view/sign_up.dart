// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:saymymeds/app/utlies/apps_color.dart';
// import 'package:saymymeds/app/views/components/AppHeadingText/app_hedaing_text.dart';
// import 'package:saymymeds/app/views/components/AppSubtitleText/app_subtitle_text.dart';
// import 'package:saymymeds/app/views/components/CustomButton/custom_button.dart';
// import 'package:saymymeds/app/views/components/CustomTextField/custom_text_field.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();

//   bool rememberMe = false;
//   bool isPasswordVisible = false;

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
//               Column(
//                 // crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Center(
//                     child: Container(
//                       width: 250,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         // color: const Color(0xFF5B9BD5),
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       child: Center(child: AppHeadingText("Sign Up")),
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const AppSubtitleText('Name'),
//                   const SizedBox(height: 12),
//                   CustomTextField(
//                     // label: "Email",
//                     // icon: Icons.email, // You need to specify an icon here
//                     hintText: "Emily smith",
//                     controller: nameController,
//                     opatictyColor: '', // Optional, only if needed
//                   ),
//                   const SizedBox(height: 12),
//                   const AppSubtitleText('Email'),
//                   const SizedBox(height: 12),
//                   CustomTextField(
//                     // label: "Email",
//                     // icon: Icons.email, // You need to specify an icon here
//                     hintText: "emilysm@gmail.com",
//                     controller: emailController,
//                     opatictyColor: '', // Optional, only if needed
//                   ),
//                   const SizedBox(height: 12),
//                   const AppSubtitleText('Password'),
//                   const SizedBox(height: 12),
//                   CustomTextField(
//                     hintText: "*********",
//                     controller: passwordController,
//                     isPassword: true,
//                     opatictyColor: '', // This enables suffixIcon toggle
//                   ),
//                   const SizedBox(height: 12),
//                   const AppSubtitleText('Confirm Password'),
//                   const SizedBox(height: 12),
//                   CustomTextField(
//                     hintText: "*********",
//                     controller: confirmPasswordController,
//                     isPassword: true,
//                     opatictyColor: '', // This enables suffixIcon toggle
//                   ),
//                   const SizedBox(height: 12),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //   children: [
//                   //     Row(
//                   //       children: [
//                   //         Checkbox(
//                   //           value: rememberMe,
//                   //           onChanged: (value) {
//                   //             setState(() {
//                   //               rememberMe = value ?? false;
//                   //             });
//                   //           },
//                   //           activeColor: const Color(0xFF5B9BD5),
//                   //           // materialTapTargetSize: materialTapTargetSize.shri,
//                   //           materialTapTargetSize:
//                   //               MaterialTapTargetSize.shrinkWrap,
//                   //           visualDensity: VisualDensity.compact,
//                   //         ),

//                   //         const Text(
//                   //           'I agree with the terms and policies.',
//                   //           style: TextStyle(
//                   //             fontFamily: 'Open Sans',
//                   //             color: Color(0xFF848484),
//                   //             fontWeight: FontWeight.w600, // SemiBold
//                   //             fontStyle: FontStyle
//                   //                 .normal, // SemiBold has no specific font-style in Flutter
//                   //             fontSize: 18.0,
//                   //             height:
//                   //                 1.0, // 100% line-height (this is the same as line-height: 100%)
//                   //             letterSpacing: 0.0, // 0% letter-spacing
//                   //           ),
//                   //         ),
//                   //       ],
//                   //     ),
//                   //     const SizedBox(height: 40),
//                   //   ],
//                   // ),
//                 ],
//               ),

//               SizedBox(height: 25),

//               CustomButton(
//                 backgroundColor: AppColors.buttonColor,
//                 text: "Sign up",
//                 onPressed: () {
//                   // Your action here
//                 },
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 50, // adjust this width as needed
//                     child: Divider(thickness: 0.8, color: Colors.grey),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       "or",
//                       style: TextStyle(color: Colors.grey, fontSize: 14),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 50, // adjust this width as needed
//                     child: Divider(thickness: 0.8, color: Colors.grey),
//                   ),
//                 ],
//               ),

//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset("assets/icons/Google.png", height: 70, width: 70),
//                   const SizedBox(width: 16),
//                   Image.asset("assets/icons/Apple.png", height: 70, width: 70),
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
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/components/AppHeadingText/app_hedaing_text.dart';
import 'package:saymymeds/app/views/components/AppSubtitleText/app_subtitle_text.dart';
import 'package:saymymeds/app/views/components/CustomButton/custom_button.dart';
import 'package:saymymeds/app/views/components/CustomTextField/custom_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
              Center(
                child: Container(
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(child: AppHeadingText("Sign Up")),
                ),
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSubtitleText('Name'),
                  const SizedBox(height: 12),
                  CustomTextField(
                    hintText: "Emily Smith",
                    controller: nameController,
                    opatictyColor: '',
                  ),
                  const SizedBox(height: 12),
                  const AppSubtitleText('Email'),
                  const SizedBox(height: 12),
                  CustomTextField(
                    hintText: "emilysm@gmail.com",
                    controller: emailController,
                    opatictyColor: '',
                  ),
                  const SizedBox(height: 12),
                  const AppSubtitleText('Password'),
                  const SizedBox(height: 12),
                  CustomTextField(
                    hintText: "*********",
                    controller: passwordController,
                    isPassword: true,
                    opatictyColor: '',
                  ),
                  const SizedBox(height: 12),
                  const AppSubtitleText('Confirm Password'),
                  const SizedBox(height: 12),
                  CustomTextField(
                    hintText: "*********",
                    controller: confirmPasswordController,
                    isPassword: true,
                    opatictyColor: '',
                  ),
                ],
              ),
              const SizedBox(height: 25),
              CustomButton(
                backgroundColor: AppColors.buttonColor,
                text: "Sign up",
                onPressed: () {
                  _showTermsAndConditions(context);
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    child: Divider(thickness: 0.8, color: Colors.grey),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "or",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: Divider(thickness: 0.8, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/Google.png", height: 70, width: 70),
                  const SizedBox(width: 16),
                  Image.asset("assets/icons/Apple.png", height: 70, width: 70),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //   void _showTermsAndConditions(BuildContext context) {
  //     bool agreed = false;
  //     showModalBottomSheet(
  //       backgroundColor: AppColors.whiteBackground,
  //       context: context,
  //       isScrollControlled: true,
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
  //       ),
  //       builder: (context) {
  //         return StatefulBuilder(
  //           builder: (context, setState) {
  //             return Padding(
  //               padding: EdgeInsets.only(
  //                 bottom: MediaQuery.of(context).viewInsets.bottom,
  //               ),
  //               child: Container(
  //                 height: MediaQuery.of(context).size.height * 0.8,
  //                 padding: const EdgeInsets.all(16),
  //                 child: Column(
  //                   children: [
  //                     Container(
  //                       width: 50,
  //                       height: 5,
  //                       decoration: BoxDecoration(
  //                         color: Colors.grey[300],
  //                         borderRadius: BorderRadius.circular(10),
  //                       ),
  //                     ),
  //                     const SizedBox(height: 16),
  //                     const Text(
  //                       "Say My Meds – End User Agreement",
  //                       style: TextStyle(
  //                         fontSize: 21,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     const SizedBox(height: 12),
  //                     Expanded(
  //                       child: SingleChildScrollView(
  //                         child: Text(
  //                           """
  // 1. Acceptance of Terms
  // By downloading, installing, or using the Say My Meds application (“App”), you (“End User”) agree to be bound by this End User Agreement (“Agreement”). If you do not agree with these terms, you must not use or access the App.

  // 2. Informational Use Only
  // The App is provided solely for informational purposes to assist users in reading and understanding medication labels. The App is not a medical device and should not be relied upon for medical decision-making.

  // 3. No Medical Advice
  // • The App does not provide medical advice, diagnosis, or treatment.
  // • The App is not a substitute for professional medical advice, judgment, or care.
  // • Always consult a licensed physician, pharmacist, or other qualified healthcare provider for any medical questions or concerns.
  // • Never disregard professional medical advice or delay seeking care because of information provided by the App.

  // 4. End User Acknowledgment
  // By using the App, you expressly acknowledge and agree that:
  // 1. You understand the App is not intended to replace medical professionals.
  // 2. You assume full responsibility for verifying all medication instructions with your healthcare provider or pharmacist.
  // 3. You are solely responsible for your reliance on the App and any actions taken based on its use.
  // 4. You release and hold harmless Say My Meds, its affiliates, officers, employees, contractors, and licensors from any and all liability associated with your use of the App.

  // 5. Disclaimer of Warranties
  // The App is provided “as is” and “as available”, without any warranties of any kind, express or implied.
  // • Say My Meds makes no guarantees as to the accuracy, reliability, timeliness, or completeness of any information provided through the App.
  // • To the fullest extent permitted by law, Say My Meds disclaims all warranties, including but not limited to warranties of merchantability, fitness for a particular purpose, non-infringement, and uninterrupted service.

  // 6. Limitation of Liability
  // To the maximum extent permitted by law:
  // • Say My Meds, its affiliates, officers, employees, contractors, and licensors shall not be liable for any indirect, incidental, consequential, special, exemplary, or punitive damages, including but not limited to damages for loss of profits, data, goodwill, or other intangible losses, arising out of or related to the use or inability to use the App.
  // • Say My Meds shall not be liable for any damages resulting from errors, inaccuracies, omissions, delays, or interruptions in service.
  // • The aggregate liability of Say My Meds for all claims arising under this Agreement, whether in contract, tort, or otherwise, shall be limited to the amount paid (if any) by the End User to access the App in the twelve (12) months preceding the claim.

  // 7. Indemnification
  // You agree to indemnify, defend, and hold harmless Say My Meds and its affiliates, officers, employees, contractors, and licensors from and against any claims, liabilities, damages, losses, or expenses (including reasonable attorneys’ fees) arising out of or in any way connected with your use of the App or violation of this Agreement.

  // 8. Updates and Modifications
  // Say My Meds may update, modify, or discontinue the App or this Agreement at any time. Continued use of the App following such updates constitutes acceptance of the revised terms.

  // 9. Governing Law
  // This Agreement shall be governed by and construed in accordance with the laws of the State of Florida, United States, without regard to conflict of law principles.
  //                           """,
  //                           style: const TextStyle(fontSize: 18, height: 1.6),
  //                           textAlign: TextAlign.justify,
  //                         ),
  //                       ),
  //                     ),
  //                     Row(
  //                       children: [
  //                         Checkbox(
  //                           value: agreed,
  //                           onChanged: (value) {
  //                             setState(() {
  //                               agreed = value ?? false;
  //                             });
  //                           },
  //                         ),
  //                         const Expanded(
  //                           child: Text(
  //                             "I have read and agree to the Terms & Conditions.",
  //                             style: TextStyle(fontSize: 14),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     CustomButton(
  //                       backgroundColor: agreed
  //                           ? AppColors.buttonColor
  //                           : AppColors.lightBlueGray,
  //                       text: "Proceed",
  //                       onPressed: agreed
  //                           ? () {
  //                               Navigator.pop(context);
  //                               // Here you can handle the actual signup action
  //                               ScaffoldMessenger.of(context).showSnackBar(
  //                                 const SnackBar(
  //                                   content: Text("Signed Up Successfully!"),
  //                                 ),
  //                               );
  //                             }
  //                           : null,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             );
  //           },
  //         );
  //       },
  //     );
  //   }
  void _showTermsAndConditions(BuildContext context) {
    bool agreed = false;
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height * 0.85,
              child: Column(
                children: [
                  // Header with handle and close button
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      border: Border(
                        bottom: BorderSide(color: Colors.grey[200]!, width: 1),
                      ),
                    ),
                    child: Column(
                      children: [
                        // Drag handle
                        Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Title and close button
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "End User License Agreement",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Say My Meds Application",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(Icons.close, color: Colors.grey[600]),
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.grey[100],
                                shape: const CircleBorder(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Content
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSection(
                              "1. Acceptance of Terms",
                              "• By downloading, installing, or using the Say My Meds application, you agree to be bound by this End User Agreement. If you do not agree with these terms, you must not use or access the App.",
                            ),
                            _buildSection(
                              "2. Informational Use Only",
                              "•  The App is provided solely for informational purposes to assist users in reading and understanding medication labels. The App is not a medical device and should not be relied upon for medical decision-making.",
                            ),
                            _buildSection(
                              "3. No Medical Advice",
                              "• The App does not provide medical advice, diagnosis, or treatment.\n"
                                  "• The App is not a substitute for professional medical advice, judgment, or care.\n"
                                  "• Always consult a licensed physician, pharmacist, or other qualified healthcare provider for any medical questions or concerns.\n"
                                  "• Never disregard professional medical advice or delay seeking care because of information provided by the App.",
                            ),
                            _buildSection(
                              "4. End User Acknowledgment",
                              "By using the App, you expressly acknowledge and agree that:\n\n"
                                  "• You understand the App is not intended to replace medical professionals.\n"
                                  "• You assume full responsibility for verifying all medication instructions with your healthcare provider or pharmacist.\n"
                                  "• You are solely responsible for your reliance on the App and any actions taken based on its use.\n"
                                  "• You release and hold harmless Say My Meds, its affiliates, officers, employees, contractors, and licensors from any and all liability associated with your use of the App.",
                            ),
                            _buildSection(
                              "5. Disclaimer of Warranties",
                              "The App is provided \"as is\" and \"as available\", without any warranties of any kind, express or implied.\n\n"
                                  "• Say My Meds makes no guarantees as to the accuracy, reliability, timeliness, or completeness of any information provided through the App.\n"
                                  "• To the fullest extent permitted by law, Say My Meds disclaims all warranties, including but not limited to warranties of merchantability, fitness for a particular purpose, non-infringement, and uninterrupted service.",
                            ),
                            _buildSection(
                              "6. Limitation of Liability",
                              "To the maximum extent permitted by law:\n\n"
                                  "• Say My Meds, its affiliates, officers, employees, contractors, and licensors shall not be liable for any indirect, incidental, consequential, special, exemplary, or punitive damages, including but not limited to damages for loss of profits, data, goodwill, or other intangible losses, arising out of or related to the use or inability to use the App.\n"
                                  "• Say My Meds shall not be liable for any damages resulting from errors, inaccuracies, omissions, delays, or interruptions in service.\n"
                                  "• The aggregate liability of Say My Meds for all claims arising under this Agreement, whether in contract, tort, or otherwise, shall be limited to the amount paid (if any) by the End User to access the App in the twelve (12) months preceding the claim.",
                            ),
                            _buildSection(
                              "7. Indemnification",
                              "• You agree to indemnify, defend, and hold harmless Say My Meds and its affiliates, officers, employees, contractors, and licensors from and against any claims, liabilities, damages, losses, or expenses (including reasonable attorneys' fees) arising out of or in any way connected with your use of the App or violation of this Agreement.",
                            ),
                            _buildSection(
                              "8. Updates and Modifications",
                              "• Say My Meds may update, modify, or discontinue the App or this Agreement at any time. Continued use of the App following such updates constitutes acceptance of the revised terms.",
                            ),
                            _buildSection(
                              "9. Governing Law",
                              "• This Agreement shall be governed by and construed in accordance with the laws of the State of Florida, United States, without regard to conflict of law principles.",
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Footer with checkbox and button
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      border: Border(
                        top: BorderSide(color: Colors.grey[200]!, width: 1),
                      ),
                    ),
                    child: Column(
                      children: [
                        // Checkbox
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          child: Row(
                            children: [
                              Transform.scale(
                                scale: 1.2,
                                child: Checkbox(
                                  value: agreed,
                                  onChanged: (value) {
                                    setState(() {
                                      agreed = value ?? false;
                                    });
                                  },
                                  activeColor: AppColors.buttonColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[700],
                                      height: 1.4,
                                    ),
                                    children: [
                                      const TextSpan(text: "I have read and "),
                                      TextSpan(
                                        text: "agree to the Terms & Conditions",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                      const TextSpan(text: " above."),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Action buttons
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: OutlinedButton(
                                onPressed: () => Navigator.pop(context),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  side: BorderSide(color: Colors.grey[400]!),
                                ),
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              flex: 2,
                              child: ElevatedButton(
                                onPressed: agreed
                                    ? () {
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: const Row(
                                              children: [
                                                Icon(
                                                  Icons.check_circle,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(width: 12),
                                                Text(
                                                  "Successfully agreed to terms!",
                                                ),
                                              ],
                                            ),
                                            backgroundColor: Colors.green[600],
                                            behavior: SnackBarBehavior.floating,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        );
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: agreed
                                      ? AppColors.buttonColor
                                      : Colors.grey[300],
                                  foregroundColor: Colors.white,
                                  elevation: agreed ? 2 : 0,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  "Accept & Continue",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: agreed
                                        ? Colors.white
                                        : Colors.grey[500],
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
            );
          },
        );
      },
    );
  }

  Widget _buildSection(String title, String content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.grey[800],
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 40,
            height: 2,
            decoration: BoxDecoration(
              color: AppColors.buttonColor,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: TextStyle(
              fontSize: 15,
              height: 1.6,
              color: Colors.grey[700],
              letterSpacing: 0.2,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
