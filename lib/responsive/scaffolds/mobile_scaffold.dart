import 'package:flutter/material.dart';
import 'package:responsive_project/constants/constants.dart';
import 'package:responsive_project/pages/mobile_aboutme_page.dart';
import 'package:responsive_project/pages/mobile_findme_page.dart';
import 'package:responsive_project/pages/mobile_home_page.dart';
import 'package:responsive_project/utils/my_bottom_nav_bar.dart';

class MyMobileScaffold extends StatefulWidget {
  const MyMobileScaffold({super.key});

  @override
  State<MyMobileScaffold> createState() => _MyMobileScaffoldState();
}

class _MyMobileScaffoldState extends State<MyMobileScaffold> {
  int _selectedIndex = 0;

  void onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    const MyHomePage(),
    const AboutMePage(),
    FindMePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      body: _pages[_selectedIndex],

      //Bottom navigation bar
      bottomNavigationBar: myBottomNavBar(
          selectedIndex: _selectedIndex, onTabChange: onTabChange),
    );
  }
}
