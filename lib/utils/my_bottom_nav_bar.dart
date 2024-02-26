import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'dart:io' show Platform;

import 'package:responsive_project/core/constants.dart';

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  int selectedIndex;
  void Function(int) onTabChange;
  MyBottomNavBar({
    required this.selectedIndex,
    required this.onTabChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      padding: Platform.isIOS ? navBariOs : navBarAndroid,
      child: GNav(
        //Design of bottom navigation bar
        tabBackgroundColor: Theme.of(context).colorScheme.secondaryContainer,

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
