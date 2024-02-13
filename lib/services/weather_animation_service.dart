class WeatherAnimationService {
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
}
