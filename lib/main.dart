// main.dart, start of the application

import 'package:flutter/material.dart';
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
      home: const PersonalDetails(),
    );
  }
}
