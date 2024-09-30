import 'package:flutter/material.dart';
import 'dart:async';

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
  int _currentWordIndex = 0;
  int _colorIndex = 0;
  final List<String> _appNameWords = [
    'Health',
    'Adviser',
  ];

  final List<List<Color>> _backgroundColors = [
    [Colors.purple, Colors.deepOrangeAccent],
    [Colors.teal, Colors.cyanAccent],
    [Colors.blueGrey, Colors.lime],
    [Colors.indigo, Colors.pinkAccent],
  ];

  @override
  void initState() {
    super.initState();
    // Timer to change the words
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentWordIndex = (_currentWordIndex + 1) % _appNameWords.length;
      });
    });

    // Timer to change the background color every 3 seconds
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _colorIndex = (_colorIndex + 1) % _backgroundColors.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 2),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _backgroundColors[_colorIndex],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // App Name that changes word by word
              Text(
                _appNameWords[_currentWordIndex],
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              // Introductory Text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'Your personalized health advisor. Get tailored meal plans, workout routines, and health tips based on your profile.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
              ),
              SizedBox(height: 40),
              // Start Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to the next page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('Get Started'),
                style: ElevatedButton.styleFrom(
                 // primary: Colors.white,
                 // onPrimary: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
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
