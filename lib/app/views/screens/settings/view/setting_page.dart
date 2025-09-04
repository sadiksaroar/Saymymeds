// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:saymymeds/app/utlies/apps_color.dart';
// import 'package:saymymeds/app/views/screens/home/views/bottom_nav.dart';

// class SettingPage extends StatefulWidget {
//   const SettingPage({super.key});

//   @override
//   State<SettingPage> createState() => _SettingPageState();
// }

// class _SettingPageState extends State<SettingPage> {
//   bool isNotificationOn = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           /// HEADER
//           Container(
//             width: double.infinity,
//             height: 120,
//             padding: const EdgeInsets.only(top: 60, bottom: 20),
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment(0.50, 1.00),
//                 end: Alignment(0.50, -0.00),
//                 colors: [Color(0xFF4FAAA2), Color(0xFF4F85AA)],
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Color(0x26000000),
//                   blurRadius: 10,
//                   offset: Offset(0, 2),
//                   spreadRadius: 0,
//                 ),
//               ],
//             ),
//             child: const Center(
//               child: Text(
//                 "Settings",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontFamily: "Poppins",
//                   fontWeight: FontWeight.w600,
//                   fontSize: 30,
//                   height: 1.0,
//                   letterSpacing: 0.0,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),

//           const SizedBox(height: 20),

//           /// OPTIONS
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               children: [
//                 buildSettingsTile(
//                   Icons.person,
//                   "Edit Profile",
//                   () => context.push("/editProfile"),
//                 ),
//                 buildSettingsTile(
//                   Icons.language,
//                   "Language Selection",
//                   () => context.push("/languageSelection"),
//                 ),
//                 buildSettingsTile(
//                   Icons.info_outline,
//                   "About Us",
//                   () => context.go("/about"),
//                 ),
//                 buildSettingsTile(
//                   Icons.contact_mail_outlined,
//                   "Contact Us",
//                   () => context.go("/contact"),
//                 ),
//                 buildNotificationTile(),
//                 const SizedBox(height: 30),
//                 buildLogoutButton(),
//                 const SizedBox(height: 30),
//               ],
//             ),
//           ),
//         ],
//       ),
//       //  bottomNavigationBar: ,
//     );
//   }

//   /// --- REUSABLE TILE ---
//   Widget buildSettingsTile(IconData icon, String title, VoidCallback onTap) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: ListTile(
//         leading: Icon(icon, color: AppColors.forgetPasswordOpacity, size: 20),
//         title: Text(title, style: const TextStyle(fontSize: 20)),
//         trailing: const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
//         onTap: onTap,
//       ),
//     );
//   }

//   /// --- NOTIFICATION SWITCH ---
//   Widget buildNotificationTile() {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: SwitchListTile(
//         secondary: const Icon(
//           Icons.notifications_none,
//           color: AppColors.forgetPasswordOpacity,
//         ),
//         title: const Text("Notification", style: TextStyle(fontSize: 20)),
//         value: isNotificationOn,
//         onChanged: (value) {
//           setState(() {
//             isNotificationOn = value;
//           });
//         },
//       ),
//     );
//   }

//   /// --- LOGOUT BUTTON ---
//   Widget buildLogoutButton() {
//     return SizedBox(
//       height: 60,
//       width: double.infinity,
//       child: ElevatedButton.icon(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.primary,
//           padding: const EdgeInsets.symmetric(vertical: 14),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//         icon: const Icon(Icons.logout, color: Colors.white, size: 20),
//         label: const Text(
//           "Logout",
//           style: TextStyle(
//             fontSize: 20,
//             color: Colors.white,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         onPressed: () {
//           context.go("/login"); // example logout route
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saymymeds/app/core/app_routes/app_routes.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/screens/home/views/bottom_nav.dart';
import 'package:saymymeds/app/widgets/BottomNav.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isNotificationOn = true;
  int _currentIndex = 3;

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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          /// HEADER
          Container(
            width: double.infinity,
            height: 120,
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.50, 1.00),
                end: Alignment(0.50, -0.00),
                colors: [Color(0xFF4FAAA2), Color(0xFF4F85AA)],
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x26000000),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: const Center(
              child: Text(
                "Settings",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  height: 1.0,
                  letterSpacing: 0.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// OPTIONS
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                buildSettingsTile(
                  Icons.person,
                  "Edit Profile",
                  () => context.push("/editProfile"),
                ),
                buildSettingsTile(
                  Icons.language,
                  "Language Selection",
                  () => context.push("/languageSelection"),
                ),
                buildSettingsTile(
                  Icons.info_outline,
                  "About Us",
                  () =>
                   context.go("/settingPage"),
                ),
                buildSettingsTile(
                  Icons.contact_mail_outlined,
                  "Contact Us",
                  () => context.go("/settingPage"),
                ),
                buildNotificationTile(),
                const SizedBox(height: 30),
                buildLogoutButton(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }

  /// --- REUSABLE TILE ---
  Widget buildSettingsTile(IconData icon, String title, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.forgetPasswordOpacity, size: 20),
        title: Text(title, style: const TextStyle(fontSize: 20)),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
        onTap: onTap,
      ),
    );
  }

  /// --- NOTIFICATION SWITCH ---
  Widget buildNotificationTile() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: SwitchListTile(
        secondary: const Icon(
          Icons.notifications_none,
          color: AppColors.forgetPasswordOpacity,
        ),
        title: const Text("Notification", style: TextStyle(fontSize: 20)),
        value: isNotificationOn,
        onChanged: (value) {
          setState(() {
            isNotificationOn = value;
          });
        },
      ),
    );
  }

  /// --- LOGOUT BUTTON ---
  Widget buildLogoutButton() {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        icon: const Icon(Icons.logout, color: Colors.white, size: 20),
        label: const Text(
          "Logout",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: () {
          context.go("/settingPage"); // example logout route
        },
      ),
    );
  }
}
