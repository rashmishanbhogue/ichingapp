// main.dart, start of
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'personal_details.dart';
import 'theme.dart';

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
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const PersonalDetails()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.splashBackgroundColor,
      body: Center(
        child: SizedBox(
          width: 160,
          height: 224,
          child: SvgPicture.string(
            '''
            <svg width="160" height="224" viewBox="0 0 160 224" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M4.41348e-05 0H74.7619V21.7674H4.41348e-05V0Z" fill="#6750A4"/>
              <path d="M85.2381 0H160V21.7674H85.2381V0Z" fill="#6750A4"/>
              <path d="M0 41.1163H74.7619V62.8838H0V41.1163Z" fill="#6750A4"/>
              <path d="M85.2381 41.1164H160V62.8838H85.2381V41.1164Z" fill="#6750A4"/>
              <path d="M0 82.2325H74.7619V104H0V82.2325Z" fill="#6750A4"/>
              <path d="M85.2381 82.2325H160V104H85.2381V82.2325Z" fill="#6750A4"/>
              <path d="M4.41348e-05 120H74.7619V141.767H4.41348e-05V120Z" fill="#6750A4"/>
              <path d="M85.2381 120H160V141.767H85.2381V120Z" fill="#6750A4"/>
              <path d="M0 161.116H74.7619V182.884H0V161.116Z" fill="#6750A4"/>
              <path d="M85.2381 161.116H160V182.884H85.2381V161.116Z" fill="#6750A4"/>
              <path d="M0 202.233H74.7619V224H0V202.233Z" fill="#6750A4"/>
              <path d="M85.2381 202.233H160V224H85.2381V202.233Z" fill="#6750A4"/>
            </svg>
            ''',
          ),
        ),
      ),
    );
  }
}
