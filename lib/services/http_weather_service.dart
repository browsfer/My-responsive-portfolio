import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:responsive_project/models/weather_model.dart';

abstract class WeatherRepository {
  Future<Weather> getWeather(String cityName);
}

class HttpWeatherRepository implements WeatherRepository {
  static const base_url = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  HttpWeatherRepository({required this.apiKey});

  Uri _buildUrl(String cityName) {
    return Uri.parse('$base_url?q=$cityName&appid=$apiKey&units=metric');
  }

  @override
  Future<Weather> getWeather(String cityName) async {
    try {
      final response = await http.get(_buildUrl(cityName));
      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            'Failed to load weather data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load weather data due to exception: $e');
    }
  }
}
