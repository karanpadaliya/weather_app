import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weatherModel.dart';

class WeatherApiService {
  final String apiKey = 'b15b0fb55cd04c5cb8930226242906';

  Future<WeatherDetailsModel> fetchWeather(String city) async {
    final response = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$city&days=7'));

    if (response.statusCode == 200) {
      return WeatherDetailsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
