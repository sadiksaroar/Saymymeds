import 'package:flutter/material.dart';
import 'package:saymymeds/app/views/screens/home/views/home_view.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeViewPage(),
    const Center(child: Text("Scan Page")),
    const Center(child: Text("Medications Page")),
    const Center(child: Text("Settings Page")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 93,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedLabelStyle: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500, // Medium weight
            fontSize: 14.0,
            color: Color(0xFF333333), // #333333
            height: 1.0, // Line height 100%
            letterSpacing: 0.0,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            color: Color(0xFF848484), // grey for unselected
          ),
          items: [
            BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/home.png", height: 24, width: 24),
                  SizedBox(height: 5), // Add space between icon and label
                ],
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/scan.png", height: 24, width: 24),
              label: "Scan",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/Medicine.png",
                height: 24,
                width: 24,
              ),
              label: "Medications",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/settings.png",
                height: 24,
                width: 24,
              ),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
