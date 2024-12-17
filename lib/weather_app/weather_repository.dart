import 'dart:convert';
import 'dart:developer' show log;
import 'package:http/http.dart' as http;
import 'package:design/weather_app/weather.dart';

class WeatherRepository {
  final String apiKey =
      '04752a8ee36cc00ad64f476708980d9a'; 

  
  Future<int> fetchCityId(String cityName) async {
    final url =
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey';

    log('Request URL for city ID: $url');

    final response = await http.get(Uri.parse(url));

    log('Response status: ${response.statusCode}');
    log('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['id'];
    } else {
      throw Exception('Failed to fetch city ID: ${response.body}');
    }
  }

  
  Future<Weather> fetchWeather(int cityId) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?id=$cityId&appid=$apiKey&units=metric';

    log('Request URL for weather: $url');

    final response = await http.get(Uri.parse(url));

    log('Response status: ${response.statusCode}');
    log('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather: ${response.body}');
    }
  }

}
