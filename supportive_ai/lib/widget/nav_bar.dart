import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:supportive_ai/Screens/gard-view.dart';

import '../Screens/psychology-card.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.purple,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
            child: GNav(
              backgroundColor: Colors.purple,
              gap: 20,
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
                  onPressed: () {
                    Navigator.pushNamed(context, 'grid-view/');
                  },
                ),
                GButton(
                  icon: Icons.chat,
                  text: 'Chat',
                  onPressed: () {
                    Navigator.pushNamed(context, 'chat-bot/');
                  },
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                  onPressed: () {
                    Navigator.pushNamed(context, 'user-appointment/');
                  },
                ),
              ],
            ),
          ),
        ),
        body: null,
      ),
    );
  }
}
