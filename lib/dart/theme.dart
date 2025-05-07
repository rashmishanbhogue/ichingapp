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

  // Default Font Sizes, Letter Spacing, and Font Weights
  static const double headingFontSize = 22.0;
  static const double bodyFontSize = 16.0;
  static const double labelFontSize = 16.0;
  static const double buttonFontSize = 16.0;
  static const double letterSpacing = 0.5;

  // Text Styles for various elements
  static const TextStyle headingStyle = TextStyle(
    fontSize: headingFontSize,
    fontWeight: FontWeight.bold,
    color: secondaryColor,
    letterSpacing: letterSpacing,
  );

  static const TextStyle labelStyle = TextStyle(
    fontSize: labelFontSize,
    fontWeight: FontWeight.w500,
    color: labelColor,
    letterSpacing: letterSpacing,
  );

  static const TextStyle errorTextStyle = TextStyle(
    fontSize: 14,
    color: errorColor,
    letterSpacing: letterSpacing,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: bodyFontSize,
    color: secondaryColor,
    letterSpacing: letterSpacing,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: headingFontSize,
    fontWeight: FontWeight.bold,
    color: secondaryColor,
    letterSpacing: letterSpacing,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14.0,
    color: errorColor,
    letterSpacing: letterSpacing,
  );

  // Button Text Style
  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: buttonFontSize,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    letterSpacing: letterSpacing,
  );

  static const InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    labelStyle: labelStyle,
    hintStyle:
        TextStyle(color: hintColor, fontSize: 14, letterSpacing: letterSpacing),
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
      textTheme: const TextTheme(
        headlineLarge: headlineMedium, // Use AppTheme's headlineMedium
        bodyLarge: bodyLarge, // Use AppTheme's bodyLarge
        bodyMedium: bodyMedium, // Use AppTheme's bodyMedium
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          textStyle: buttonTextStyle, // Use AppTheme's buttonTextStyle
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF79747E), // Default border color
            width: 1.0, // Default thickness for the border
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF79747E), // Enabled border color
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
        hintStyle: TextStyle(
            color: Color(0xFF79747E),
            letterSpacing: letterSpacing), // Hint text color
        labelStyle: TextStyle(
            color: primaryColor,
            letterSpacing: letterSpacing), // Label text color
        floatingLabelBehavior:
            FloatingLabelBehavior.always, // Floating label behavior
      ),
    );
  }
}
