import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_project/constants/constants.dart';
import 'package:responsive_project/models/weather_model.dart';
import 'package:responsive_project/services/weather_service.dart';
import 'package:responsive_project/utils/my_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _weatherService = WeatherService(apiKey: weatherApiKey);
  Weather? _weather;

  //Fetch weather
  _fetchWeather() async {
    //get current city
    String cityName = await _weatherService.getCurrentCity();

//Get weathet for city

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  //Weather animations
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/weather/sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
        return 'assets/weather/cloudy.json';
      case 'snow':
        return 'assets/weather/snow.json';
      case 'thunderstorm':
        return 'assets/weather/storm.json';
      case 'clear':
        return 'assets/weather/sunny.json';
      case 'drizzle':
        return 'assets/weather/drizzle.json';
      default:
        return 'assets/weather/sunny.json';
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          //City name
          _weather?.cityName == null
              ? const CircularProgressIndicator()
              : Text(
                  _weather!.cityName,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),

          //Animation
          Lottie.asset(
            getWeatherAnimation(
              _weather?.mainCondition,
            ),
          ),

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
          const SizedBox(height: 200),
          Text(
            isLightTheme ? 'D A R K  M O D E' : 'L I G H T  M O D E',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          MyButton(iconSize: 50),
        ],
      ),
    );
  }
}
