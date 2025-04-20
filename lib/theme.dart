// theme.dart, store app themes to be called everywhere

import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF6750A4);
  static const Color secondaryColor = Color(0xFF1D1B20);
  static const Color accentColor = Color(0xFF9C27B0);
  static const Color errorColor = Color(0xFFFF0000);
  static const Color hintColor = Colors.grey;
  static const Color splashBackgroundColor = Color(0xFFE6E0E9);
  static const labelColor = Color(0xFF4A4A4A);
  static const borderColor = Color(0xFFCCCCCC);
  static const disabledOutlineColor = Color(0xFFFBFBFC);
  static const disabledTextColor = Color(0xFF79747E);

  static const fontFamily = 'Roboto';

  static const TextStyle headingStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: secondaryColor,
  );

  static const TextStyle labelStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: labelColor,
  );

  static const TextStyle errorTextStyle = TextStyle(
    fontSize: 14,
    color: errorColor,
  );

  static const InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    labelStyle: labelStyle,
    hintStyle: TextStyle(color: hintColor, fontSize: 14),
    errorStyle: errorTextStyle,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: borderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: primaryColor),
    ),
  );

  static ThemeData get theme {
    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: accentColor,
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: secondaryColor,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.0,
          color: secondaryColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.0,
          color: errorColor,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xFF79747E), // Default border color
            width: 1.0, // Default thickness for the border
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xFF79747E), // Enabled border color
            width: 1.0, // Thickness of the enabled border
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor, // Color of the border when focused
            width: 2.0, // Thickness of the border when focused
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: errorColor, // Color of the border when there is an error
            width: 2.0, // Thickness of the border when there's an error
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: errorColor, // Color when focused and there is an error
            width: 2.0, // Thickness when focused and there's an error
          ),
        ),
        hintStyle: TextStyle(color: const Color(0xFF79747E)), // Hint text color
        labelStyle: TextStyle(color: primaryColor), // Label text color
        floatingLabelBehavior:
            FloatingLabelBehavior.always, // Floating label behavior
      ),
    );
  }
}
