import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:lottie/lottie.dart';
import 'package:responsive_project/core/connection_check.dart';
import 'package:responsive_project/core/constants.dart';
import 'package:responsive_project/models/weather_model.dart';
import 'package:responsive_project/core/error_handler.dart';
import 'package:responsive_project/services/geolocator_location_services.dart';
import 'package:responsive_project/services/http_weather_service.dart';
import 'package:responsive_project/services/weather_animation_service.dart';

class WeatherWidgets extends StatefulWidget {
  const WeatherWidgets({super.key});

  @override
  State<WeatherWidgets> createState() => _WeatherWidgetsState();
}

class _WeatherWidgetsState extends State<WeatherWidgets> {
  //Weather animation service
  final _weatherAnimationService = WeatherAnimationService();
  //Weather service
  final _weatherService = HttpWeatherRepository(apiKey: weatherApiKey);
  //Location service
  final _locationService = GeolocatorLocationService();

  Weather? _weather;

  //Check if device is connected to the internet VARIABLE
  bool _isConnected = false;

  //Location permission5
  bool _hasLocationPermission = false;

  //Fetch weather
  Future<void> _fetchWeatherData() async {
    try {
      String cityName = await _locationService.getCurrentCity();
      var weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      handleError('Failed to load weather data', '_fetchWeatherData', e);
    }
  }

  Future<void> _checkConnection() async {
    bool isConnected = await CheckConnection.checkConnection();
    bool hasLocationPermission = await _locationService.checkPermission();
    setState(() {
      _isConnected = isConnected;
      _hasLocationPermission = hasLocationPermission;
    });
    if (isConnected && hasLocationPermission) {
      await _fetchWeatherData();
    }
  }

  void openLocationSettings() {
    //Open location settings on the device and refresh the state
    Geolocator.openLocationSettings().then((_) {
      _checkConnection();
    });
  }

  @override
  void initState() {
    super.initState();
    _checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isConnected) {
      return TextButton.icon(
        onPressed: _checkConnection,
        icon: const Icon(Icons.wifi),
        label: const Text('No internet connection'),
      );
    } else if (!_hasLocationPermission) {
      return TextButton.icon(
        onPressed: openLocationSettings,
        icon: const Icon(Icons.location_on),
        label: const Text('Enable location'),
      );
    } else if (_weather == null) {
      return Center(child: myLoadingWidget(context));
    } else {
      return Row(
        children: [
          //Animation
          Lottie.asset(
            _weatherAnimationService.getWeatherAnimation(
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
}
