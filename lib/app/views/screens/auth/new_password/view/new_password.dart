import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/components/AppSubtitleText/app_subtitle_text.dart';
import 'package:saymymeds/app/views/screens/auth/new_password/view/CongratulationsPopupDemo/congratulations_popup_demo.dart';
import 'package:saymymeds/app/views/components/AppHeadingText/app_hedaing_text.dart';
import 'package:saymymeds/app/views/components/CustomButton/custom_button.dart';
import 'package:saymymeds/app/views/components/CustomTextField/custom_text_field.dart';
// import 'CongratulationsPopup.dart'; // Import the CongratulationsPopup class

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController newPasswordController = TextEditingController();
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
              Column(
                children: [
                  Center(
                    child: Container(
                      width: 805,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(child: AppHeadingText("Set new password")),
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Container(
                      width: 805,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          "Please enter a new password and re-enter to confirm.",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 18.0,
                            color: Color(0xFF848484),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSubtitleText('New Password'),
                  SizedBox(height: 10),
                  CustomTextField(
                    hintText: "*********",
                    controller: newPasswordController,
                    isPassword: true,
                    opatictyColor: '',
                  ),
                ],
              ),
              SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSubtitleText('Confirm Password'),
                  SizedBox(height: 10),
                  CustomTextField(
                    hintText: "*********",
                    controller: confirmPasswordController,
                    isPassword: true,
                    opatictyColor: '',
                  ),
                ],
              ),
              SizedBox(height: 25),
              CustomButton(
                backgroundColor: AppColors.buttonColor,
                text: "Continue",
                onPressed: () => CongratulationsPopup.show(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
