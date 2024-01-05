import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_project/constants/constants.dart';
import 'package:responsive_project/models/weather_model.dart';
import 'package:responsive_project/pages/mobile_aboutme_page.dart';
import 'package:responsive_project/pages/mobile_findme_page.dart';
import 'package:responsive_project/pages/mobile_home_page.dart';
import 'package:responsive_project/services/weather_service.dart';
import 'package:responsive_project/utils/my_bottom_nav_bar.dart';
import 'package:responsive_project/utils/my_switch.dart';

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

  //Weather service
  final _weatherService = WeatherService(apiKey: weatherApiKey);
  Weather? _weather;

  //Fetch weather
  _fetchWeather() async {
    //get current city
    String cityName = await _weatherService.getCurrentCity();

//Get weather for city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    //Fetch data on app start
    _fetchWeather();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Getting theme data

    return Scaffold(
      appBar: AppBar(
        actions: [
          //Animation
          Lottie.asset(
            _weatherService.getWeatherAnimation(
              _weather?.mainCondition,
            ),
          ),
          const SizedBox(width: 5),
          //Temperature
          _weather?.temperature == null
              ? const SizedBox(
                  width: 15,
                  height: 15,
                  child: CircularProgressIndicator(),
                )
              : Text(
                  '${_weather?.temperature.round().toString()}*C',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
          const SizedBox(width: 10),
          //City name
          _weather?.cityName == null
              ? const CircularProgressIndicator()
              : Text(
                  _weather!.cityName,
                  style: TextStyle(
                    color: Theme.of(context).appBarTheme.foregroundColor,
                  ),
                ),

          const Spacer(),

          //THEME SWITCH
          MyAdaptiveSwitch(),
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
