import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/screens/home/views/bottom_nav.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // Controllers for text fields
  final TextEditingController _firstNameController = TextEditingController(
    text: "Emily",
  );
  final TextEditingController _lastNameController = TextEditingController(
    text: "Wilson",
  );
  final TextEditingController _emailController = TextEditingController(
    text: "emilywil@gmail.com",
  );

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery, // or ImageSource.camera
      imageQuality: 80, // compress image
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // Custom height
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF8F9FB), // AppBar background color
            boxShadow: [
              BoxShadow(
                color: Color(0x26000000), // Shadow with opacity
                offset: Offset(0, 2), // Shadow position
                blurRadius: 10, // Shadow blur radius
              ),
            ],
          ),
          child: AppBar(
            leading: InkWell(
              onTap: () {
                context.pop("/");
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/icons/Back_Icon.png",
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            title: const Text(
              "Edit Profile",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 24,
                height: 1,
                color: AppColors.primary,
              ),
              textAlign: TextAlign.center,
            ),
            centerTitle: true, // Title center করার জন্য
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Image with upload
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: _image != null
                      ? FileImage(_image!)
                      : const AssetImage("assets/profile.jpg") as ImageProvider,
                ),
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.forgetPasswordOpacity,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: _pickImage,
              child: const Text(
                "Change photo",
                style: TextStyle(color: AppColors.forgetPasswordOpacity),
              ),
            ),
            const SizedBox(height: 30),

            // First Name
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                labelText: "First name",
                labelStyle: TextStyle(color: AppColors.grey, fontSize: 18),

                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Last Name
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                labelText: "Last name",
                labelStyle: TextStyle(color: AppColors.grey, fontSize: 20),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Email (editable)
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: AppColors.grey, fontSize: 20),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 50),

            // Save Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // You can save the updated data here
                  String firstName = _firstNameController.text;
                  String lastName = _lastNameController.text;
                  String email = _emailController.text;

                  debugPrint("First Name: $firstName");
                  debugPrint("Last Name: $lastName");
                  debugPrint("Email: $email");
                },
                child: const Text(
                  "Save changes",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNav(),
    );
  }
}
