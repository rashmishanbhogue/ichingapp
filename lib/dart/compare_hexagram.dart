// compare the generated hexagram(s) with the predefined hexagrams in define_hexagram.dart
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'define_hexagram.dart';
import 'session_data.dart';
import 'svg_generator.dart';

class CompareHexagram {
  String matchedHexagram1Title = '';
  String matchedHexagram1Definition = '';
  String? matchedHexagram2Title;
  String? matchedHexagram2Definition;
  bool hasSecondHexagram = false;

  static String hexagram1Svg = '';
  static String hexagram2Svg = '';

  // check if hexagram1 has changing lines
  static bool hasChangingLines(List<String> hexagram) {
    return hexagram.contains('yinchanging') ||
        hexagram.contains('yangchanging');
  }

  // generate hexagram2 if changing lines exist
  List<String>? generateHexagram2(List<String> hexagram1) {
    if (!hasChangingLines(hexagram1)) return null;

    List<String> hexagram2 = List.from(hexagram1);
    for (int i = 0; i < hexagram2.length; i++) {
      if (hexagram2[i] == 'yinchanging') {
        hexagram2[i] = 'yang'; // flip the changing lines
      } else if (hexagram2[i] == 'yangchanging') {
        hexagram2[i] = 'yin'; // flip the changing lines
      }
    }
    return hexagram2;
  }

  // normalize `yinchanging` and `yangchanging` for matching
  List<String> normaliseHexagram(List<String> hexagram) {
    debugPrint("Normalizing hexagram: $hexagram");
    final normalized = hexagram.map((line) {
      if (line == 'yinchanging') return 'yin';
      if (line == 'yangchanging') return 'yang';
      return line;
    }).toList();
    debugPrint("Normalized hexagram: $normalized");
    return normalized;
  }

  // find matching hexagram pattern
  Hexagram findHexagramMatch(List<String> pattern) {
    debugPrint("Debug: Finding match for pattern: $pattern");
    for (final hexagram in predefinedHexagrams) {
      debugPrint("Comparing with hexagram: ${hexagram.pattern}");
      if (const ListEquality().equals(hexagram.pattern, pattern)) {
        debugPrint("Match found: ${hexagram.hexNo}");
        return hexagram; // return the matching hexagram directly
      }
    }
    return predefinedHexagrams.first;
  }

  // compare the generated hexagrams against predefined hexagrams
  void compareHexagrams() {
    // step 1: do not normalize before SVG generation
    final List<String> hexagram1Pattern = List<String>.from(
        SessionData.hexagram1!); // use original pattern for SVG
    debugPrint("SessionData.hexagram1: ${SessionData.hexagram1}");
    debugPrint("Hexagram1 pattern before normalization: $hexagram1Pattern");

    final hexagram2Pattern = SessionData.hexagram2 != null
        ? List<String>.from(
            SessionData.hexagram2!) // use original pattern for SVG
        : null;
    debugPrint("Hexagram1 pattern: $hexagram1Pattern");
    debugPrint("Hexagram2 pattern: $hexagram2Pattern");

    // step 2: generate hexagram2 if necessary
    final List<String>? hexagram2Generated = SessionData.hexagram1 != null
        ? generateHexagram2(List<String>.from(SessionData.hexagram1!))
        : null;

    // step 3: normalize only for matching purposes (not SVG generation)
    final List<String>? normalisedHexagram2Pattern = hexagram2Generated != null
        ? normaliseHexagram(hexagram2Generated)
        : null;

    // step 4: match patterns (normalize only for comparison)
    final hexagram1Match =
        findHexagramMatch(normaliseHexagram(hexagram1Pattern));
    debugPrint("Hexagram1 match: ${hexagram1Match.hexNo}");
    final hexagram2Match = normalisedHexagram2Pattern != null
        ? findHexagramMatch(normalisedHexagram2Pattern)
        : null;
    debugPrint("Hexagram2 match: ${hexagram2Match?.hexNo}");

    // step 5: store results
    matchedHexagram1Title = hexagram1Match.title;
    matchedHexagram1Definition = hexagram1Match.definition;

    if (hexagram2Match != null) {
      hasSecondHexagram = true;
      matchedHexagram2Title = hexagram2Match.title;
      matchedHexagram2Definition = hexagram2Match.definition;
    } else {
      hasSecondHexagram = false;
      matchedHexagram2Title = null;
      matchedHexagram2Definition = null;
    }

    // generate SVGs for both hexagrams before normalizing for matching
    hexagram1Svg =
        generateSvg(hexagram1Pattern); // use the original pattern for SVG
    hexagram2Svg = hexagram2Generated != null
        ? generateSvg(
            hexagram2Generated) // use the original generated pattern for SVG
        : '';
  }

  // generate the SVG for a given hexagram pattern
  String generateSvg(List<String> hexagramPattern) {
    double yPosition = 0.0;
    String svgContent = '';
    // calculate the total height based on the number of lines
    double totalHeight = hexagramPattern.length * 30.0; // 30px gap per line

    // generate SVG content based on the hexagram pattern
    for (String line in hexagramPattern) {
      if (line == 'yin') {
        svgContent += SvgGenerator.getYinLine(yPosition);
      } else if (line == 'yang') {
        svgContent += SvgGenerator.getYangLine(yPosition);
      } else if (line == 'yinchanging') {
        svgContent += SvgGenerator.getYinChangingLine(yPosition);
      } else if (line == 'yangchanging') {
        svgContent += SvgGenerator.getYangChangingLine(yPosition);
      }
      yPosition += 30.0; // update yPosition for the next line
    }

    // add debug print to see the generated SVG content
    debugPrint("Generated SVG content: $svgContent");

    // return the complete SVG string
    return '''<svg xmlns="http://www.w3.org/2000/svg" width="158" height="$totalHeight" viewBox="0 0 158 $totalHeight">
      $svgContent
    </svg>''';
  }
}
