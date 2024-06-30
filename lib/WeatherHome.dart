import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller/ApiService.dart';
import 'package:weather_app/model/WeatherDataModel.dart';
import 'package:weather_app/view/WeatherDetail.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  late WeatherData weatherInfo;
  bool isLoading=  false;

  myWeather() {
    isLoading = false;
    ApiService().fetchWeather().then((value) {
      setState(() {
        weatherInfo = value;
        isLoading = true;
      });
    });
  }

  @override
  void initState() {
    weatherInfo = WeatherData(
      name: '',
      temperature: Temperature(current: 0.0),
      humidity: 0,
      wind: Wind(speed: 0.0),
      maxTemperature: 0.0,
      minTemperature: 0.0,
      pressure: 0,
      seaLevel: 0,
      weather: [],
    );
    myWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE dd, MMMM yyyy').format(
      DateTime.now(),
    );
    String formattedTime = DateFormat('hh:mm a').format(
      DateTime.now(),
    );
    return Scaffold(
      backgroundColor: Color(0xff676BD0),
      appBar: AppBar(
        // title: Text("Weather"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        // bottomOpacity: 0.5,
        // forceMaterialTransparency: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: isLoading ?  WeatherDetail(
                  weather: weatherInfo,
                  formattedDate: formattedDate,
                  formattedTime: formattedTime,
                ): SpinKitFadingCube(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
