import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

import '../model/weather_data.dart';
import '../utilities/constants.dart';

class NetworkHelper {
  Future<WeatherData> getData(Position position) async {
    Response response = await get(
      Uri.parse(
          '$openWeatherBaseURL?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=metric'),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      var weather = WeatherData.fromJson(data);
      return weather;
    } else {
      var errorData = json.decode(response.body);
      return Future.error('Failed to load data: ${errorData['message']}');
    }
  }

  Future<WeatherData> getCityData(String cityName) async {
    Response response = await get(
      Uri.parse('$openWeatherBaseURL?q=$cityName&appid=$apiKey&units=metric'),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      var weather = WeatherData.fromJson(data);
      return weather;
    } else {
      var errorData = json.decode(response.body);
      return Future.error('Failed to load data: ${errorData['message']}');
    }
  }
}
