import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: const Color(0xFF6F35A5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
          child: GNav(
              backgroundColor: const Color(0xFF6F35A5),
              gap: 8,
              color: const Color(0xFFF1E6FF),
              activeColor: const Color(0xFFF1E6FF),
              tabBackgroundColor: Colors.white24,
              onTabChange: (index) {
                //print(index);
              },
              padding: const EdgeInsets.all(18),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                  onPressed: () {},
                ),
                GButton(
                  icon: Icons.chat,
                  text: 'Chat',
                  onPressed: () {},
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                  onPressed: () {
                    Navigator.pushNamed(context, 'profile');
                  },
                ),
              ],
              ),
        ),
      ),
    );
  }
}
