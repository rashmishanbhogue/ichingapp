// session_data.dart, store and track session data for each user until the pdf report is generated
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class QuestionResult {
  final String question;
  final String category;
  final DateTime timestamp;
  final String hexagram1No;
  final String hexagram1Title;
  final String hexagram1Description;
  final String? hexagram2No; // nullable
  final String? hexagram2Title; // nullable
  final String? hexagram2Description; // nullable
  final String interpretation;

  QuestionResult({
    required this.question,
    required this.category,
    required this.timestamp,
    required this.hexagram1No,
    required this.hexagram1Title,
    required this.hexagram1Description,
    this.hexagram2No, // nullable
    this.hexagram2Title, // nullable
    this.hexagram2Description, // nullable
    required this.interpretation,
  });
}

class SessionData {
  static String name = '';
  static String dob = '';
  static String tob = '';
  static String pob = '';
  static String currentDate = '';
  static String currentTime = '';
  static String query = '';
  static String sessionCategory = '';
  static String comments = '';
  static String hex1No = '';
  static String hex1Title = '';
  static String hex1Definition = '';
  static String? hex2No;
  static String? hex2Title;
  static String? hex2Definition;

  // track all questions asked in the session
  static List<QuestionResult> questionResults = [];

  static int questionCounter = 0;

  // a method to add a questionresult to the list
  static void addQuestionResult(QuestionResult result) {
    bool exists = questionResults.any((q) =>
        q.question.trim().toLowerCase() ==
            result.question.trim().toLowerCase() &&
        q.category == result.category);

    if (!exists) {
      questionResults.add(result);
      questionCounter++;
    } else {
      debugPrint('Duplicate question detected – not adding to results.');
    }
  }

  // reset sessiondata
  static void clearSessionData() {
    name = '';
    dob = '';
    tob = '';
    pob = '';
    currentDate = '';
    currentTime = '';
    query = '';
    sessionCategory = '';
    comments = '';
    hex1No = '';
    hex1Title = '';
    hex1Definition = '';
    hex2No = '';
    hex2Title = '';
    hex2Definition = '';
    questionResults.clear();
  }

  static List<String>?
      hexagram1; // full hexagram pattern for the first hexagram (direct from input)
  static List<String>?
      hexagram2; // optional second hexagram that gets generated only if the right conditions are met in the first hexagram

  // flag to indicate if the session has started
  static bool sessionStarted = false; // global session flag

  static String formatTime(DateTime timestamp) {
    // format the timestamp to hh:mm a (12-hour format with AM/PM)
    final DateFormat formatter = DateFormat('hh:mm a');
    return formatter.format(timestamp);
  }

  static void generateSecondHexagram() {
    if (hexagram1 != null) {
      final List<String> secondHexagram = [];
      for (final line in hexagram1!) {
        if (line == 'yinchanging') {
          secondHexagram.add('yang'); // flip changing lines
        } else if (line == 'yangchanging') {
          secondHexagram.add('yin'); // flip changing lines
        } else {
          secondHexagram.add(line); // copy non-changing lines as is
        }
      }
      hexagram2 =
          secondHexagram; // hexagram2 is set only if there are changing lines in hexagram1
    }
  }

  static String getFormattedDate(String dateString) {
    try {
      DateTime parsedDate = DateTime.parse(dateString); // parse the date string
      return DateFormat('ddMMyyyy')
          .format(parsedDate); // format the date as 'MMddyyyy'
    } catch (e) {
      debugPrint(
          "Invalid date format for currentDate, using current date as fallback.");
      return DateFormat('ddMMyyyy')
          .format(DateTime.now()); // fallback to current date if parsing fails
    }
  }

  String formattedDate = getFormattedDate(SessionData.currentDate);

  static String generatePdfFilename() {
    String nameWithUnderscores = SessionData.name.replaceAll(' ', '_');
    String date = getFormattedDate(currentDate);

    return '${nameWithUnderscores}_$date.pdf';
  }
}
