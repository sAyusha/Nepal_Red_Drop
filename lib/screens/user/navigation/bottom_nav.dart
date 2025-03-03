import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lucide_icons/lucide_icons.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text("Home Page", style: TextStyle(fontSize: 22))),
    const Center(child: Text("Search Page", style: TextStyle(fontSize: 22))),
    const Center(child: Text("Donor Page", style: TextStyle(fontSize: 22))),
    const Center(child: Text("Donate Page", style: TextStyle(fontSize: 22))),
    const Center(child: Text("Updates Page", style: TextStyle(fontSize: 22))),
    const Center(child: Text("Profile Page", style: TextStyle(fontSize: 22))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(

        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            gap: 8,
            activeColor: Colors.white,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            tabBackgroundColor: Colors.red.shade400,
            color: Colors.black54,
            tabs: const [
              GButton(icon: LucideIcons.home, text: "Home"),
              GButton(icon: LucideIcons.search, text: "Search"),
              // GButton(icon: LucideIcons.users, text: "Donor"),
              GButton(icon: LucideIcons.plusCircle, text: "Donate"),
              GButton(icon: LucideIcons.bell, text: "Updates"),
              GButton(icon: LucideIcons.user, text: "Profile"),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
