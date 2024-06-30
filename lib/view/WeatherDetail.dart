import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/WeatherDataModel.dart';

class WeatherDetail extends StatelessWidget {
  final WeatherData? weather;
  final String formattedDate;
  final String formattedTime;

  WeatherDetail({
    super.key,
    this.weather,
    required this.formattedDate,
    required this.formattedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          weather?.name ?? "weather?.name",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "${weather?.temperature.current.toStringAsFixed(2) ?? "weather?.temperature.current"}°C",
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (weather!.weather.isNotEmpty)
          Text(
            weather?.weather[0].main ?? "weather?.weather[0].main",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        const SizedBox(height: 30),
        Text(
          formattedDate,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          formattedTime,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/cloudy.png"),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Container(
          height: 250,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.white.withOpacity(0.2),
              Colors.deepPurple.withOpacity(0.5),
            ],begin: Alignment.topLeft),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.wind_power,
                          color: Colors.white,
                        ),
                        weatherInfoCard(
                          title: "Wind",
                          value: "${weather!.wind.speed} km/h",
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sunny,
                          color: Colors.white,
                        ),
                        weatherInfoCard(
                          title: "Max",
                          value:
                              "${weather!.maxTemperature.toStringAsFixed(2)} °C",
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.wind_power,
                          color: Colors.white,
                        ),
                        weatherInfoCard(
                          title: "Min",
                          value:
                              "${weather!.minTemperature.toStringAsFixed(2)} °C",
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.water_drop,
                          color: Colors.amber,
                        ),
                        weatherInfoCard(
                          title: "Humidity",
                          value: "${weather!.humidity} %",
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.air,
                          color: Colors.amber,
                        ),
                        weatherInfoCard(
                          title: "Pressure",
                          value: "${weather!.pressure} hpa",
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.leaderboard,
                          color: Colors.amber,
                        ),
                        weatherInfoCard(
                          title: "Sea-Level",
                          value: "${weather!.seaLevel}m",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Column weatherInfoCard({
  required String title,
  required String value,
}) {
  return Column(
    children: [
      Text(
        value,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
      Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
    ],
  );
}
