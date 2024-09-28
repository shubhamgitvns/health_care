import 'package:flutter/material.dart';

void main() {
  runApp(HealthAdviserApp());
}

class HealthAdviserApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Adviser App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: IntroPage(),
    );
  }
}

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  Color _backgroundColor = Colors.greenAccent;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _animateIntro();
  }

  void _animateIntro() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _opacity = 1.0; // Fade in text
      });
    });
    // Change background color after a delay
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _backgroundColor = Colors.blueAccent; // Change background color
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 2),
        color: _backgroundColor,
        curve: Curves.easeInOut,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo or Image
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green[200],
                    image: DecorationImage(
                      image: AssetImage('assets/logo.png'), // Change to your logo path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // App Name
                AnimatedOpacity(
                  opacity: _opacity,
                  duration: Duration(seconds: 1),
                  child: Text(
                    'Health Adviser',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Introductory Text
                AnimatedOpacity(
                  opacity: _opacity,
                  duration: Duration(seconds: 1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Your personalized health advisor. Get tailored meal plans, workout routines, and health tips based on your profile.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                // Start Button
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the next page (e.g., input page)
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text('Get Started'),
                  style: ElevatedButton.styleFrom(

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Health Adviser'),
      ),
      body: Center(
        child: Text('Home Page Content Goes Here!'),
      ),
    );
  }
}
