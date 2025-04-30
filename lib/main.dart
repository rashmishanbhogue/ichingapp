// main.dart, start of the application
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'personal_details.dart';
import './dart/theme.dart';

void main() {
  runApp(const IchingApp());
}

class IchingApp extends StatelessWidget {
  const IchingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late Timer navigationTimer; // avoid potential memory leak

  @override
  void initState() {
    super.initState();
    navigationTimer = Timer(const Duration(milliseconds: 500), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => PersonalDetails()),
        );
      }
    });
  }

  @override
  void dispose() {
    navigationTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.splashBackgroundColor,
      body: Center(
        child: SizedBox(
          width: 160,
          height: 224,
          child: SvgPicture.asset(
              'assets/images/splash.svg'), // moved the svg code to an imported asset file
        ),
      ),
    );
  }
}
