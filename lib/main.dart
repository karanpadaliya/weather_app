import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/WeatherHomePage.dart';
import 'package:weather_app/controller/CheckInternetProvider.dart';
import 'package:weather_app/controller/ThemeProvider.dart';
import 'package:weather_app/view/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CheckInternetProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          themeMode: value.themeMode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          routes: {
            "/": (context) => SplashScreen(),
            "WeatherHomePage": (context) => WeatherHomePage(),
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
        },
      ),
    );
  }
}
