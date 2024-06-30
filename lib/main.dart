import 'package:flutter/material.dart';
import 'package:weather_app/WeatherHome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff676bd0)
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => WeatherHomePage(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                "onUnknownRoute",
                style: TextStyle(fontSize: 40, color: Colors.black),
              ),
            ),
          ),
        );
      },
    );
  }
}
