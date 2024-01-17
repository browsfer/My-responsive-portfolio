import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_project/constants/constants.dart';

import 'package:responsive_project/pages/mobile_aboutme_page.dart';
import 'package:responsive_project/pages/mobile_findme_page.dart';
import 'package:responsive_project/pages/mobile_home_page.dart';

import 'package:responsive_project/utils/my_bottom_nav_bar.dart';
import 'package:responsive_project/utils/my_floating_button.dart';
import 'package:responsive_project/utils/my_switch.dart';
import 'package:responsive_project/utils/weather_widgets.dart';

import 'package:responsive_project/services/weather_service.dart';
import 'package:app_settings/app_settings.dart';

class MyMobileScaffold extends StatefulWidget {
  const MyMobileScaffold({super.key});

  @override
  State<MyMobileScaffold> createState() => _MyMobileScaffoldState();
}

class _MyMobileScaffoldState extends State<MyMobileScaffold> {
  //Bottom navigation bar default index
  int _selectedIndex = 0;

  //FloatingButtonDelay
  bool _showFloatingButton = false;

  //Bottom navigation bar tab change
  void onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    //Show floatingactionbutton after 10 seconds
    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          _showFloatingButton = true;
        });
      },
    );
    super.initState();
  }

  //Pages list
  final List _pages = [
    const MyHomePage(),
    const AboutMePage(),
    FindMePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final _weather = WeatherService(apiKey: weatherApiKey);
    return Scaffold(
      //
      //MUSIC BUTTON
      floatingActionButton:
          _showFloatingButton ? const MyFloatingActionButton() : null,

      //APP BAR WITH WEATHER
      appBar: AppBar(
        actions: [
          const SizedBox(width: 5),
          //Weather informations
          FutureBuilder(
            future: _weather.getCurrentCity(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //Return weather widgets
                return const WeatherWidgets();
              } else if (snapshot.hasError) {
                //Navigate to app location settings
                return TextButton.icon(
                  onPressed: () {
                    setState(() {
                      AppSettings.openAppSettings(
                          type: AppSettingsType.location);
                    });
                  },
                  label: const Text('Enable location'),
                  icon: const Icon(Icons.location_on),
                );
              } else {
                return LoadingAnimationWidget.horizontalRotatingDots(
                  color: Theme.of(context).colorScheme.primary,
                  size: 50,
                );
              }
            },
          ),

          const Spacer(),

          //THEME SWITCH
          const MyAdaptiveSwitch(),
          const SizedBox(width: 5),
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
