import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:responsive_project/pages/mobile_aboutme_page.dart';
import 'package:responsive_project/pages/mobile_findme_page.dart';
import 'package:responsive_project/pages/mobile_home_page.dart';

import 'package:responsive_project/utils/my_bottom_nav_bar.dart';
import 'package:responsive_project/utils/my_floating_button.dart';
import 'package:responsive_project/utils/my_switch.dart';
import 'package:responsive_project/utils/weather_widgets.dart';

class MyMobileScaffold extends StatefulWidget {
  const MyMobileScaffold({super.key});

  @override
  State<MyMobileScaffold> createState() => _MyMobileScaffoldState();
}

class _MyMobileScaffoldState extends State<MyMobileScaffold> {
  //Bottom navigation bar default index
  int _selectedIndex = 0;

  //Bottom navigation bar tab change
  void onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //Pages list
  final List _pages = [
    const MyHomePage(),
    const AboutMePage(),
    FindMePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      //MUSIC BUTTON

      floatingActionButton:
          Platform.isAndroid ? const MyFloatingActionButton() : null,

      //APP BAR WITH WEATHER
      appBar: AppBar(
        actions: const [
          SizedBox(width: 5),
          //Weather informations
          WeatherWidgets(),
          Spacer(),

          //THEME SWITCH
          MyAdaptiveSwitch(),
          SizedBox(width: 5),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _pages[_selectedIndex],

      //Bottom navigation bar
      bottomNavigationBar: myBottomNavBar(
        selectedIndex: _selectedIndex,
        onTabChange: onTabChange,
      ),
    );
  }
}
