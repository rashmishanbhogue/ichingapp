// session_data.dart, store and track session data for each user until the pdf report is generated
import 'package:intl/intl.dart';

class QuestionResult {
  final String question;
  final String category;
  final DateTime timestamp;
  final String hexagram1Description;
  final String? hexagram2Description; // nullable
  final String interpretation;

  QuestionResult({
    required this.question,
    required this.category,
    required this.timestamp,
    required this.hexagram1Description,
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
  static String hexagram1Title = '';
  static String hexagram1Definition = '';
  static String? hexagram2Title;
  static String? hexagram2Definition;

  // track all questions asked in the session
  static List<QuestionResult> questionResults = [];

  static int questionCounter = 0;

  // a method to add a questionresult to the list
  static void addQuestionResult(QuestionResult result) {
    questionResults.add(result);
    questionCounter++;
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
    hexagram1Definition = '';
    hexagram2Definition = '';
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
      DateTime parsedDate =
          DateTime.parse(dateString); // Try parsing the date string
      return DateFormat('ddMMyyyy')
          .format(parsedDate); // Format the date as 'MMddyyyy'
    } catch (e) {
      print(
          "Invalid date format for currentDate, using current date as fallback.");
      return DateFormat('ddMMyyyy')
          .format(DateTime.now()); // Fallback to current date if parsing fails
    }
  }

  String formattedDate = getFormattedDate(SessionData.currentDate);

  static String generatePdfFilename() {
    // // try parsing currentDate in the expected format (yyyy-MM-dd)
    // DateTime currentDateTime;
    // try {
    //   // if currentDate is in 'yyyy-MM-dd' format, it will parse correctly
    //   currentDateTime = DateTime.parse(SessionData.currentDate);
    // } catch (e) {
    //   // if parsing fails (invalid date format), fallback to the current date
    //   currentDateTime = DateTime.now();
    //   // optionally, log the error or handle it differently if needed
    //   print(
    //       'Invalid date format for currentDate, using current date as fallback.');
    // }
    String nameWithUnderscores = SessionData.name.replaceAll(' ', '_');
    String date = getFormattedDate(currentDate);
    // Format the date as ddMMyyyy
    // String formattedDate = DateFormat('ddMMyyyy').format(currentDateTime);
    //
    //return '${SessionData.name.replaceAll(' ', '_')}_$formattedDate.pdf';
    return '${nameWithUnderscores}_${date}.pdf';
  }
}
