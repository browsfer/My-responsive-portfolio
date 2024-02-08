import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_project/constants/constants.dart';
import 'package:responsive_project/models/weather_model.dart';
import 'package:responsive_project/services/error_handler.dart';
import 'package:responsive_project/services/weather_services.dart';

class WeatherWidgets extends StatefulWidget {
  const WeatherWidgets({super.key});

  @override
  State<WeatherWidgets> createState() => _WeatherWidgetsState();
}

class _WeatherWidgetsState extends State<WeatherWidgets> {
  //Weather service
  final _weatherService = WeatherService(apiKey: weatherApiKey);
  Weather? _weather;

  //Fetch weather
  _fetchWeather() async {
    try {
      String cityName = await _weatherService.getCurrentCity();
      final weather = await _weatherService.getWeather(cityName);
      setState(
        () {
          _weather = weather;
        },
      );
    } catch (e) {
      handleError(e, '_fetchWeather');
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
    return Row(
      children: [
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
      ],
    );
  }
}
