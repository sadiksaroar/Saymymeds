// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:saymymeds/app/controller/navbar_controller.dart';

// class CustomBottomNavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final currentLocation = GoRouterState.of(context).uri.toString();

//     return NavigationBar(
//       selectedIndex: NavbarController.getSelectedIndex(currentLocation),
//       onDestinationSelected: (index) =>
//           NavbarController.onItemTapped(index, context),
//       destinations: const [
//         NavigationDestination(
//           icon: Icon(Icons.home_outlined),
//           selectedIcon: Icon(Icons.home),
//           label: 'Home',
//         ),
//         NavigationDestination(
//           icon: Icon(Icons.search_outlined),
//           selectedIcon: Icon(Icons.search),
//           label: 'Search',
//         ),
//         NavigationDestination(
//           icon: Icon(Icons.favorite_outline),
//           selectedIcon: Icon(Icons.favorite),
//           label: 'Favorites',
//         ),
//         NavigationDestination(
//           icon: Icon(Icons.person_outline),
//           selectedIcon: Icon(Icons.person),
//           label: 'Profile',
//         ),
//       ],
//     );
//   }
// }
