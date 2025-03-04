import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0; // Default selected index

  final List<Widget> _pages = [
    const Center(child: Text('Profile', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Updates', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Home', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Search Donor', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Donate', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_selectedIndex],
      bottomNavigationBar: CircleNavBar(
        activeIcons: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.my_location_rounded, color: Colors.white),
          Icon(Icons.add_circle_outline, color: Colors.white),
          Icon(Icons.notifications_active, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
        inactiveIcons: [
          Column(
            children: [
              Icon(Icons.home_outlined, color: Colors.red.shade400),
              const Text("Home", style: TextStyle(fontSize: 12)),
            ],
          ),
          Column(
            children: [
              Icon(Icons.my_location_outlined, color: Colors.red.shade400),
              const Text("Search",
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
            ],
          ),
          Column(
            children: [
              Icon(Icons.add_circle_outline, color: Colors.red.shade400),
              const Text("Donate", style: TextStyle(fontSize: 12)),
            ],
          ),
          Column(
            children: [
              Icon(Icons.notifications_outlined, color: Colors.red.shade400),
              const Text("Updates", style: TextStyle(fontSize: 12)),
            ],
          ),
          Column(
            children: [
              Icon(Icons.person_outline, color: Colors.red.shade400),
              const Text("Profile", style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
        color: Colors.red.shade100.withOpacity(0.8),
        height: 60,
        circleWidth: 60,

        activeIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        // shadowColor: Colors.deepPurple,
        circleGradient: LinearGradient(
          colors: [Colors.red.shade600, Colors.red.shade300],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        elevation: 10,
      ),
    );
  }
}
