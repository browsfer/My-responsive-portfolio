import 'package:flutter/material.dart';
import 'package:responsive_project/pages/mobile_aboutme_page.dart';
import 'package:responsive_project/pages/mobile_findme_page.dart';
import 'package:responsive_project/pages/mobile_home_page.dart';
import 'package:responsive_project/utils/my_bottom_nav_bar.dart';
import 'package:responsive_project/utils/my_button.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          MyButton(iconSize: 40),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _pages[_selectedIndex],

      //Bottom navigation bar
      bottomNavigationBar: myBottomNavBar(
          selectedIndex: _selectedIndex, onTabChange: onTabChange),
    );
  }
}
