import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/ApiService.dart';
import 'package:weather_app/controller/CheckInternetProvider.dart';
import 'package:weather_app/controller/ThemeProvider.dart';
import 'package:weather_app/model/WeatherDataModel.dart';
import 'package:weather_app/view/WeatherDetail.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  late WeatherData weatherInfo;
  bool isLoading = false;
  TextEditingController searchCityNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
    Provider.of<CheckInternetProvider>(context, listen: false)
        .CheckingConnection();
    myWeather('');
  }

  Future<void> myWeather(String cityName) async {
    setState(() {
      isLoading = true;
    });
    try {
      final value = await ApiService().fetchWeather(cityName);
      setState(() {
        weatherInfo = value;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red.withOpacity(0.4),
          content: Text(
            ':( something went wrong please try again',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('EEEE dd, MMMM yyyy').format(DateTime.now());
    String formattedTime = DateFormat('hh:mm a').format(DateTime.now());

    return Scaffold(
      backgroundColor: const Color(0xff676BD0),
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5.5),
          height: 50,
          width: 160,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextFormField(
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 16, letterSpacing: 2),
              controller: searchCityNameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Find City",
                hintMaxLines: 1,
                hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: IconButton(
                  onPressed: () {
                    String cityName = searchCityNameController.text.trim();
                    if (cityName.isNotEmpty) {
                      myWeather(cityName);
                      searchCityNameController.clear();
                    }
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return IconButton(
                icon: Icon(
                  themeProvider.isDarkMode
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined,
                ),
                onPressed: () {
                  themeProvider.toggleTheme();
                },
              );
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Consumer<CheckInternetProvider>(
        builder: (BuildContext context, value, Widget? child) {
          bool isConnected =
              value.connectivityResult != ConnectivityResult.none;
          return isConnected
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.9, // Adjust height as needed
                          child: Center(
                            child: isLoading
                                ? const SpinKitFadingCube(color: Colors.white)
                                : WeatherDetail(
                                    weather: weatherInfo,
                                    formattedDate: formattedDate,
                                    formattedTime: formattedTime,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const Center(
                  child: Text(
                    "404\nNo Internet",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
        },
      ),
    );
  }
}
