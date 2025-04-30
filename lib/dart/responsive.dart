// responsive.dart, define responsiveness for the entire program

import 'package:flutter/widgets.dart';

class Responsive {
  final double widthFactor;
  final double heightFactor;

  Responsive(BuildContext context,
      {double baseWidth = 360.0, double baseHeight = 800.0})
      : widthFactor = MediaQuery.of(context).size.width / baseWidth,
        heightFactor = MediaQuery.of(context).size.height / baseHeight;

  double scaleWidth(double width) {
    return width * widthFactor;
  }

  double scaleHeight(double height) {
    return height * heightFactor;
  }

  double scaleFontSize(double fontSize) {
    return fontSize * widthFactor; // adjust this for height
  }
}
