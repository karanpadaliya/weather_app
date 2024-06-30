import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/WeatherDataModel.dart';

class ApiService {
  fetchWeather() async {
    final response = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=22.3039&lon=70.8022&appid=5664ce1fe43335490a274cdc890bd519"),
    );
    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return WeatherData.fromJson(json);
      }else{
        throw Exception("Faild to Load Weather Api Data");
      }
    } catch (e) {
      print("Weather Api Error ${e.toString()}");
    }
  }
}
