import 'package:clima/model/weather_data.dart';
import 'package:geolocator/geolocator.dart';

import 'location.dart';
import 'networking.dart';

class WeatherModel {
  String getWeatherIcon(int? condition) {
    print(condition);
    if (condition != null) {
      if (condition < 300) {
        return '🌩';
      } else if (condition < 400) {
        return '🌧';
      } else if (condition < 600) {
        return '☔️';
      } else if (condition < 700) {
        return '☃️';
      } else if (condition < 800) {
        return '🌫';
      } else if (condition == 800) {
        return '☀️';
      } else if (condition <= 804) {
        return '☁️';
      } else {
        return '🤷‍';
      }
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int? temp) {
    if (temp != null) {
      if (temp > 25) {
        return 'It\'s 🍦 time';
      } else if (temp > 20) {
        return 'Time for shorts and 👕';
      } else if (temp < 10) {
        return 'You\'ll need 🧣 and 🧤';
      } else {
        return 'Bring a 🧥 just in case';
      }
    } else {
      return '🤷‍ Unknown Temperature';
    }
  }

  NetworkHelper networkHelper = NetworkHelper();

  Future<WeatherData> getLocationWeather() async {
    Location location = Location();
    Position position = await location.determinePosition();
    var weatherData = await networkHelper.getData(position);
    return weatherData;
  }

  Future<WeatherData> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper();
    var weatherData = await networkHelper.getCityData(cityName);
    return weatherData;
  }
}
