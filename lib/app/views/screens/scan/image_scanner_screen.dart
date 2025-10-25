// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:saymymeds/app/core/app_routes/app_routes.dart';
// import 'package:saymymeds/app/utlies/apps_color.dart';
// import 'package:saymymeds/app/views/screens/view_details/MedicineApiService/medicineApiService.dart';
// import 'package:saymymeds/app/widgets/BottomNav.dart';

// class ImageScannerScreen extends StatefulWidget {
//   const ImageScannerScreen({super.key});

//   @override
//   State<ImageScannerScreen> createState() => _ImageScannerScreenState();
// }

// class _ImageScannerScreenState extends State<ImageScannerScreen> {
//   File? _image;
//   String _result = "";
//   final ImagePicker _picker = ImagePicker();

//   // Function to pick or capture an image
//   Future<void> _pickImage(ImageSource source) async {
//     try {
//       final XFile? pickedFile = await _picker.pickImage(source: source);
//       if (pickedFile != null) {
//         setState(() {
//           _image = File(pickedFile.path);
//           _result = 'Processing image...';
//         });
//         // await _sendImageToApi(_image!);
//       }
//     } catch (e) {
//       setState(() {
//         _result = 'Error picking image: $e';
//       });
//     }
//   }

//   int _currentIndex = 1;

//   void _onNavTap(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//     switch (index) {
//       case 0:
//         context.go(AppRoutes.homeViewPage);
//         break;
//       case 1:
//         context.go(AppRoutes.imageScannerScreen);
//         break;
//       case 2:
//         context.go(AppRoutes.medication);
//         break;
//       case 3:
//         context.go(AppRoutes.settingPage);
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.whiteBackground,
//         leading: Padding(
//           padding: const EdgeInsets.all(10),
//           child: GestureDetector(
//             onTap: () {
//               context.go(AppRoutes.homeViewPage); // ✅ navigate to home
//             },
//             child: Image.asset('assets/icons/cross.png', width: 24, height: 24),
//           ),
//         ),
//         // title: const Text('Your Title'),
//       ),

//       backgroundColor: AppColors.whiteBackground,
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 150),
//             // Display the selected image
//             _image != null
//                 ? Image.file(
//                     _image!,
//                     height: 200,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   )
//                 : Container(
//                     height: 200,
//                     color: Colors.grey[300],
//                     child: Center(child: Text('No image selected')),
//                   ),
//             SizedBox(height: 50),
//             // Buttons to capture or pick image
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 GestureDetector(
//                   onTap: () => _pickImage(ImageSource.camera),
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 12,
//                       horizontal: 20,
//                     ),
//                     decoration: BoxDecoration(
//                       color: AppColors.forgetPasswordOpacity,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.2),
//                           blurRadius: 6,
//                           offset: const Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: const [
//                         Icon(
//                           Icons.camera_alt,
//                           color: Colors.white,
//                           size: 20, // icon size
//                         ),
//                         SizedBox(width: 8), // text and icon spacing
//                         Text(
//                           'Camera',
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () => _pickImage(ImageSource.gallery),
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 12,
//                       horizontal: 20,
//                     ),
//                     decoration: BoxDecoration(
//                       color: AppColors.buttonColor,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.2),
//                           blurRadius: 6,
//                           offset: const Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: const [
//                         Icon(
//                           Icons.photo,
//                           color: Colors.white,
//                           size: 20, // icon size
//                         ),
//                         SizedBox(width: 8),
//                         Text(
//                           'Photos',
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//           ],
//         ),
//       ),
//       bottomNavigationBar: CustomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: _onNavTap,
//       ),
//     );
//   }
// }

// class ImageScannerScreen extends StatefulWidget {
//   const ImageScannerScreen({super.key});

//   @override
//   State<ImageScannerScreen> createState() => _ImageScannerScreenState();
// }

// class _ImageScannerScreenState extends State<ImageScannerScreen> {
//   File? _image;
//   String _status = '';
//   bool _isLoading = false;
//   final ImagePicker _picker = ImagePicker();
//   int _currentIndex = 1;

//   Future<void> _pickImage(ImageSource source) async {
//     try {
//       final XFile? pickedFile = await _picker.pickImage(source: source);
//       if (pickedFile != null) {
//         setState(() {
//           _image = File(pickedFile.path);
//           _isLoading = true;
//           _status = 'Processing image...';
//         });

//         // Upload to API
//         final preview = await MedicineApiService.uploadAndAnalyzeImage(
//           _image!,
//           lang: 'es',
//         );

//         if (mounted) {
//           // Navigate to detail page with data
//           context.push('/medicine-detail', extra: preview);
//         }
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _status = 'Error: ${e.toString()}';
//       });

//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text(_status)));
//     }
//   }

//   void _onNavTap(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//     switch (index) {
//       case 0:
//         context.go('/home');
//         break;
//       case 1:
//         context.go('/scanner');
//         break;
//       case 2:
//         context.go('/medication');
//         break;
//       case 3:
//         context.go('/settings');
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: Padding(
//           padding: const EdgeInsets.all(10),
//           child: GestureDetector(
//             onTap: () => context.go('/home'),
//             child: Image.asset('assets/icons/cross.png', width: 24, height: 24),
//           ),
//         ),
//       ),
//       backgroundColor: Colors.white,
//       body: _isLoading
//           ? Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircularProgressIndicator(),
//                   SizedBox(height: 20),
//                   Text(_status),
//                 ],
//               ),
//             )
//           : SingleChildScrollView(
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 150),
//                   _image != null
//                       ? Image.file(
//                           _image!,
//                           height: 200,
//                           width: double.infinity,
//                           fit: BoxFit.cover,
//                         )
//                       : Container(
//                           height: 200,
//                           color: Colors.grey[300],
//                           child: Center(child: Text('No image selected')),
//                         ),
//                   SizedBox(height: 50),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       GestureDetector(
//                         onTap: () => _pickImage(ImageSource.camera),
//                         child: _buildButton(
//                           'Camera',
//                           Icons.camera_alt,
//                           Color(0xFF4F85AA),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () => _pickImage(ImageSource.gallery),
//                         child: _buildButton(
//                           'Gallery',
//                           Icons.photo,
//                           Color(0xFF5B9BD5),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   if (_status.isNotEmpty)
//                     Text(_status, style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: _onNavTap,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Scan'),
//           BottomNavigationBarItem(icon: Icon(Icons.medication), label: 'Meds'),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildButton(String label, IconData icon, Color color) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             blurRadius: 6,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, color: Colors.white, size: 20),
//           SizedBox(width: 8),
//           Text(label, style: TextStyle(color: Colors.white, fontSize: 16)),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';
import 'package:saymymeds/app/core/app_routes/app_routes.dart';
import 'package:saymymeds/app/utlies/apps_color.dart';
import 'package:saymymeds/app/views/screens/view_details/medicaton_controlr/medication_controller.dart';
import 'package:saymymeds/app/widgets/BottomNav.dart';

class ImageScannerScreen extends StatefulWidget {
  const ImageScannerScreen({super.key});

  @override
  State<ImageScannerScreen> createState() => _ImageScannerScreenState();
}

class _ImageScannerScreenState extends State<ImageScannerScreen> {
  final MedicineController controller = Get.put(MedicineController());
  int _currentIndex = 1;

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
      appBar: AppBar(
        backgroundColor: AppColors.whiteBackground,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () => context.go(AppRoutes.homeViewPage),
            child: Image.asset('assets/icons/cross.png', width: 24, height: 24),
          ),
        ),
      ),
      backgroundColor: AppColors.whiteBackground,
      body: Obx(
        () => Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 150),

                  // Display selected image
                  controller.selectedImage.value != null
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 2,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Builder(
                              builder: (_) {
                                final imgFile = controller.selectedImage.value;
                                if (imgFile == null) {
                                  return const SizedBox.shrink();
                                }
                                // On non-web platforms show Image.file. On web, Image.file is
                                // not supported — try to show network image if the path
                                // looks like a URL, otherwise render a placeholder.
                                if (!kIsWeb) {
                                  return Image.file(
                                    imgFile,
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  );
                                }

                                final path = imgFile.path;
                                if (path.startsWith('http') ||
                                    path.startsWith('https')) {
                                  return Image.network(
                                    path,
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  );
                                }

                                return Container(
                                  height: 200,
                                  width: double.infinity,
                                  color: Colors.grey[300],
                                  child: const Center(
                                    child: Text(
                                      'Image preview not available on web',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              'No image selected',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(height: 50),

                  // Capture / Gallery buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        // ✅ Pass context to controller
                        onTap: () => controller.pickImageFromCamera(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.forgetPasswordOpacity,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Camera',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        // ✅ Pass context instead of language
                        onTap: () => controller.pickImageFromGallery(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.buttonColor,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.photo, color: Colors.white, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Photos',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),

            // Loading overlay
            if (controller.isLoading.value)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
