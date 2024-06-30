import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Future.delayed(
      Duration(seconds: 3),
          () {
        // Navigator.pushReplacementNamed(context, "WeatherHomePage");
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
      backgroundColor: Color(0xff676BD0),
      body: Stack(
        children: [
          // Rain animation
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: RainPainter(_controller.value),
                size: Size.infinite,
              );
            },
          ),
          // Center content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/s1.png",
                  height: 300,
                  width: 300,
                ),
              ),
              SizedBox(height: 20),
              AnimatedOpacity(
                opacity: _animation.value,
                duration: const Duration(seconds: 3),
                child: Text(
                  'WEATHER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RainPainter extends CustomPainter {
  final double progress;
  final List<Offset> raindrops;

  RainPainter(this.progress)
      : raindrops = List.generate(100, (index) {
    return Offset(
      (index % 10) * 40.0,
      (index ~/ 10) * 80.0,
    );
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0;

    for (var drop in raindrops) {
      final dx = drop.dx;
      final dy = (drop.dy + progress * size.height) % size.height;
      canvas.drawLine(Offset(dx, dy), Offset(dx, dy + 10), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
