import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 4),
          () {
        print("Navigating to WeatherHomePage"); // Debug print statement
        Navigator.pushReplacementNamed(context, "WeatherHomePage");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xff676BD0),
        systemNavigationBarColor: Color(0xff676BD0),
        systemNavigationBarDividerColor: Color(0xff676BD0),
      ),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      backgroundColor: Color(0xff676bd0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: Image.asset("assets/images/cloudy.png"),
          ),
          Container(
            padding: EdgeInsets.only(left: 100),
            width: double.infinity,
            child: AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText("𝕎𝕖𝕒𝕥𝕙𝕖𝕣",
                    speed: Duration(seconds: 1),
                    textStyle: TextStyle(fontSize: 48),
                    colors: colorizeColors)
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          AnimatedTextKit(
            repeatForever: false,
            animatedTexts: [
              TypewriterAnimatedText("ꜰɪɴᴅ ᴡᴇᴀᴛʜᴇʀ ꜰᴏʀ ʏᴏᴜʀ ʟᴏᴄᴀᴛɪᴏɴ",
                  textStyle: TextStyle(fontSize: 18, color: Colors.white),
                  speed: Duration(milliseconds: 80)),
            ],
            isRepeatingAnimation: false,
          ),
        ],
      ),
    );
  }
}

List<Color> colorizeColors = [
  Colors.white,
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
];
