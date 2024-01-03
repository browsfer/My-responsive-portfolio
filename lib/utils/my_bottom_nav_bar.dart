import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class myBottomNavBar extends StatelessWidget {
  int selectedIndex;
  void Function(int) onTabChange;
  myBottomNavBar({
    required this.selectedIndex,
    required this.onTabChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      child: GNav(
        //Design of bottom navigation bar
        tabBackgroundColor: Theme.of(context).colorScheme.primary,
        gap: 10,
        padding: const EdgeInsets.all(18),

        //Navigation
        selectedIndex: selectedIndex,
        onTabChange: onTabChange,

        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.person,
            text: 'About me',
          ),
          GButton(
            icon: Icons.message,
            text: 'Find me',
          ),
        ],
      ),
    );
  }
}
