// query_details.dart, navigate here from personal_details.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'coin_tossing.dart';
import './dart/responsive.dart';
import './dart/theme.dart';
import './dart/shared_variables.dart';
import './dart/session_data.dart';

class QueryDetails extends StatefulWidget {
  const QueryDetails({super.key});

  @override
  QueryDetailsState createState() => QueryDetailsState();
}

class QueryDetailsState extends State<QueryDetails> {
  String? selectedCategory; // no default selection for the radio

  // controllers for the input fields
  final currentdateController = TextEditingController();
  final currenttimeController = TextEditingController();
  final questionController = TextEditingController();
  final categoryController = TextEditingController();

  // focus nodes to manage the keyboard and dropdowns
  final FocusNode currentdateFocusNode = FocusNode();
  final FocusNode currenttimeFocusNode = FocusNode();
  final FocusNode questionFocusNode = FocusNode();
  final FocusNode categoryFocusNode = FocusNode();

  // track user interaction
  bool hasCurrentdateInteracted = false;
  bool hasCurrenttimeInteracted = false;
  bool hasQuestionInteracted = false;
  bool hasCategoryInteracted = false;

  // track whether the form is filled
  bool isFormFilled = false;

  // error state variables
  bool isCurrentdateError = false;
  bool isCurrenttimeError = false;
  bool isQuestionError = false;
  bool isCategoryError = false;

  @override
  void initState() {
    super.initState();

    // set default system date and time
    final DateTime now = DateTime.now();
    currentdateController.text =
        "${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year}";
    currenttimeController.text =
        "${now.hour % 12 == 0 ? 12 : now.hour % 12}:${now.minute.toString().padLeft(2, '0')} ${now.hour >= 12 ? 'PM' : 'AM'}";

    questionFocusNode.addListener(() {
      if (!questionFocusNode.hasFocus) {
        setState(() {
          hasQuestionInteracted = true;
          validateQuestion();
          checkFormFilled();
        });
      }
    });

    categoryFocusNode.addListener(() {
      if (!categoryFocusNode.hasFocus) {
        setState(() {
          hasCategoryInteracted = true;
          validateCategory();
          checkFormFilled();
        });
      }
    });

    // listeners to all text controllers on real time input
    currentdateController.addListener(onRealTimeInputChange);
    currenttimeController.addListener(onRealTimeInputChange);
    questionController.addListener(onRealTimeInputChange);
    categoryController.addListener(onRealTimeInputChange);
  }

  // method for realtime input change validation
  void onRealTimeInputChange() {
    setState(() {
      if (hasQuestionInteracted) {
        isQuestionError = !isQuestionValid();
      }
      if (hasCategoryInteracted) {
        isCategoryError = !isCategoryValid();
      }

      // check for the entire form being filled correctly
      checkFormFilled();
    });
  }

  // validation checks for each field
  bool isCurrentdateValid() {
    return true;
  }

  bool isCurrenttimeValid() {
    return true;
  }

  bool isQuestionValid() {
    final question = questionController.text;
    final words = question
        .trim()
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .toList();
    return words.length <= 200 &&
        RegExp(r'''^[a-zA-Z0-9.,?"'!\-\n\s]*$''').hasMatch(question);
  }

  bool isCategoryValid() {
    return selectedCategory != null;
  }

  void validateQuestion() {
    setState(() {
      isQuestionError = hasQuestionInteracted && questionController.text.isEmpty
          ? true
          : !isQuestionValid();
    });
  }

  void validateCategory() {
    setState(() {
      isCategoryError = hasCategoryInteracted && !isCategoryValid();
    });
  }

  void checkFormFilled() {
    setState(() {
      isFormFilled = (questionController.text.isNotEmpty ||
              questionController.text.isNotEmpty) &&
          isQuestionValid() &&
          isCategoryValid();
    });
  }

  void onFocusChange(
      FocusNode node, bool Function() validate, Function(bool) setError) {
    if (node == questionFocusNode) {
      hasQuestionInteracted = true;
      final isValid = validate();
      setError(!isValid);
      isQuestionError =
          questionController.text.isEmpty ? true : !isQuestionValid();
    } else if (node == categoryFocusNode) {
      hasCategoryInteracted = true;
      final isValid = validate();
      setError(!isValid);
    }
  }

  @override
  void dispose() {
    // dispose of the controllers
    currentdateController.dispose();
    currenttimeController.dispose();
    questionController.dispose();
    categoryController.dispose();
    questionFocusNode.dispose();
    categoryFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // hides the keyboard
        },
        child: SingleChildScrollView(
          // scrolling to prevent keyboard overflow
          child: Container(
            width: responsive.scaleWidth(360),
            padding: EdgeInsets.only(
              top: responsive.scaleHeight(34),
              left: responsive.scaleWidth(12),
              right: responsive.scaleWidth(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Back button
                InkWell(
                  onTap: () {
                    Navigator.pop(context); // navigate back
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: responsive.scaleWidth(10),
                        vertical: responsive.scaleWidth(12)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: AppTheme.secondaryColor,
                        ),
                        SizedBox(width: responsive.scaleWidth(4)),
                        Text(
                          'Back',
                          style: TextStyle(
                            fontSize: responsive.scaleFontSize(16),
                            color: AppTheme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: responsive.scaleHeight(24)),

                Padding(
                  padding: EdgeInsets.only(left: responsive.scaleWidth(12)),
                  child: Text(
                    'Query Details',
                    style: TextStyle(
                      fontSize: responsive.scaleFontSize(22),
                      color: AppTheme.secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: responsive.scaleHeight(24)),

                // Current Date Field
                Center(
                  child: Container(
                    width: responsive.scaleWidth(312),
                    child: TextField(
                      enabled: false,
                      controller:
                          currentdateController, // pre-filled default value
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Current Date',
                        labelStyle: TextStyle(color: AppTheme.primaryColor),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: const Color(0xFF79747E),
                        ),
                      ),
                      style: TextStyle(color: const Color(0xFF79747E)),
                    ),
                  ),
                ),

                SizedBox(height: responsive.scaleHeight(24)),

                // Current Time Field
                Center(
                  child: Container(
                    width: responsive.scaleWidth(312),
                    child: TextField(
                      enabled: false,
                      controller: currenttimeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Current Time',
                        labelStyle: TextStyle(color: AppTheme.primaryColor),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        prefixIcon: Icon(Icons.access_time,
                            color: const Color(0xFF79747E)),
                        suffixIcon: Icon(Icons.arrow_drop_down,
                            color: const Color(0xFF79747E)),
                      ),
                      style: TextStyle(color: const Color(0xFF79747E)),
                    ),
                  ),
                ),

                SizedBox(height: responsive.scaleHeight(24)),

                // Question TextField
                Center(
                  child: Container(
                    width: responsive.scaleWidth(312),
                    child: TextField(
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Enter your question',
                        hintStyle: TextStyle(color: const Color(0xFF79747E)),
                        border: OutlineInputBorder(),
                        labelText: 'Question',
                        labelStyle: TextStyle(color: AppTheme.primaryColor),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        errorText: isQuestionError
                            ? 'Please enter a valid question'
                            : null,
                        counterText:
                            '${questionController.text.split(RegExp(r'\s+')).where((word) => word.isNotEmpty).length}/200 words',
                      ),
                      style: TextStyle(color: AppTheme.secondaryColor),
                      controller: questionController,
                      focusNode: questionFocusNode,
                      onChanged: (value) {
                        setState(() {
                          isQuestionError = !isQuestionValid();
                          checkFormFilled();
                        });
                      },
                    ),
                  ),
                ),

                SizedBox(height: responsive.scaleHeight(24)),

                Padding(
                    padding: EdgeInsets.only(left: responsive.scaleWidth(12)),
                    child: Text('Category',
                        style: TextStyle(
                          fontSize: responsive.scaleFontSize(12),
                          color: AppTheme.secondaryColor,
                        ))),

                SizedBox(height: responsive.scaleHeight(5)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Radio<String>(
                            value: 'Business',
                            groupValue: selectedCategory,
                            onChanged: (value) {
                              setState(() {
                                selectedCategory = value!;
                                hasCategoryInteracted = true;

                                validateCategory();
                                checkFormFilled();
                              });
                            }),
                        Text('Business',
                            style: TextStyle(color: AppTheme.secondaryColor)),
                      ],
                    ),
                    SizedBox(width: responsive.scaleWidth(24)),
                    Row(
                      children: [
                        Radio<String>(
                            value: 'Love',
                            groupValue: selectedCategory,
                            onChanged: (value) {
                              setState(() {
                                selectedCategory = value!;
                                hasCategoryInteracted = true;

                                validateCategory();
                                checkFormFilled();
                              });
                            }),
                        Text('Love',
                            style: TextStyle(color: AppTheme.secondaryColor)),
                      ],
                    ),
                    SizedBox(width: responsive.scaleWidth(24)),
                    Row(
                      children: [
                        Radio<String>(
                            value: 'General',
                            groupValue: selectedCategory,
                            onChanged: (value) {
                              setState(() {
                                selectedCategory = value!;
                                hasCategoryInteracted = true;
                                validateCategory();
                                checkFormFilled();
                              });
                            }),
                        Text('General',
                            style: TextStyle(color: AppTheme.secondaryColor)),
                      ],
                    )
                  ],
                ),

                SizedBox(height: responsive.scaleHeight(24)),

                Center(
                  child: SizedBox(
                    width: responsive.scaleWidth(312),
                    child: ElevatedButton(
                      onPressed: isFormFilled
                          ? () {
                              SessionData.currentDate =
                                  currentdateController.text;
                              SessionData.currentTime =
                                  currenttimeController.text;
                              SessionData.query = questionController.text;
                              SessionData.sessionCategory = selectedCategory!;

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CoinToss()), // navigate to CoinToss()
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryColor,
                          foregroundColor: const Color(0xFFFFFFFF),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          )),
                      child: Text(
                        'Next',
                        style:
                            TextStyle(fontSize: responsive.scaleFontSize(16)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
