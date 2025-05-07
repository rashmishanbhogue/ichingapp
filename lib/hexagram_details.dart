// hexagram_details.dart, where the user reads the descriptions and inputs his

import 'package:flutter/material.dart';
import 'query_details.dart';
import 'report_preview.dart';
import './dart/responsive.dart';
import './dart/theme.dart';
import './dart/session_data.dart';
import './dart/compare_hexagram.dart';

class HexagramDetails extends StatefulWidget {
  const HexagramDetails({super.key});

  @override
  HexagramDetailsState createState() => HexagramDetailsState();
}

class HexagramDetailsState extends State<HexagramDetails> {
  final commentsController = TextEditingController();
  final FocusNode commentsFocusNode = FocusNode();
  bool hasCommentsInteracted = false;
  bool isCommentsError = false;
  bool isFormFilled = false;

  @override
  void initState() {
    super.initState();

    commentsFocusNode.addListener(() {
      if (!commentsFocusNode.hasFocus) {
        // only act on focus loss
        setState(() {
          hasCommentsInteracted = true;
          validateComments();
          checkFormFilled();
        });
      }
    });

    commentsController.addListener(onRealTimeInputChange);
  }

  bool isCommentsValid() {
    final comments = commentsController.text;
    final words = comments
        .trim()
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .toList();
    return words.length <= 200 &&
        RegExp(r'''^[a-zA-Z0-9.,?"'!\-\n\s]*$''').hasMatch(comments);
  }

  void validateQuestion() {
    setState(() {
      isCommentsError = hasCommentsInteracted && commentsController.text.isEmpty
          ? true
          : !isCommentsValid();
    });
  }

  void checkFormFilled() {
    setState(() {
      isFormFilled = (commentsController.text.isNotEmpty ||
              commentsController.text.isNotEmpty) &&
          isCommentsValid();
    });
  }

  void onRealTimeInputChange() {
    setState(() {
      isCommentsError = !isCommentsValid();
      checkFormFilled();
    });
  }

  void validateComments() {
    setState(() {
      isCommentsError = hasCommentsInteracted && commentsController.text.isEmpty
          ? true
          : !isCommentsValid();
    });
  }

  void onFocusChange(
      FocusNode node, bool Function() validate, Function(bool) setError) {
    hasCommentsInteracted = true;
    final isValid = validate();
    setError(!isValid);
  }

  @override
  void dispose() {
    // dispose of the controllers
    commentsController.dispose();
    commentsFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      resizeToAvoidBottomInset:
          true, // allow the layout to adjust when the keyboard appears
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // hide the keyboard
        },
        child: Column(
          children: [
            // non-scrollable area: Back button and Hexagram Details title
            Container(
              width: responsive.scaleWidth(360),
              padding: EdgeInsets.only(
                top: responsive.scaleHeight(30),
                left: responsive.scaleWidth(12),
                right: responsive.scaleWidth(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button
                  InkWell(
                    onTap: () => Navigator.pop(context), // navigate back
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: responsive.scaleWidth(10),
                        vertical: responsive.scaleWidth(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
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
                  SizedBox(height: responsive.scaleHeight(22)),
                  Padding(
                    padding: EdgeInsets.only(left: responsive.scaleWidth(12)),
                    child: Text(
                      'Hexagram Details',
                      style: AppTheme.headingStyle.copyWith(
                        fontSize: responsive.scaleFontSize(22),
                      ),
                    ),
                  ),
                  SizedBox(height: responsive.scaleHeight(20)),
                ],
              ),
            ),

            // scrollable area: hexagram descriptions
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: responsive.scaleWidth(340),
                  padding: EdgeInsets.symmetric(
                    vertical: responsive.scaleHeight(8),
                    horizontal: responsive.scaleWidth(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SizedBox(
                          width: responsive.scaleWidth(310),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // hexagram 1 title and description
                              Row(
                                children: [
                                  Text(
                                    SessionData.hex1No,
                                    style: AppTheme.headingStyle.copyWith(
                                      fontSize: responsive.scaleFontSize(16),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    SessionData.hex1Title,
                                    style: AppTheme.headingStyle.copyWith(
                                      fontSize: responsive.scaleFontSize(16),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: responsive.scaleHeight(8)),
                              Text(
                                SessionData.hex1Definition,
                                style: AppTheme.bodyLarge.copyWith(
                                  fontSize: responsive.scaleFontSize(16),
                                ),
                                textAlign: TextAlign.left,
                                maxLines: null,
                                overflow: TextOverflow.clip,
                              ),
                              SizedBox(height: responsive.scaleHeight(24)),
                              // hexagram 2 title and description
                              if (CompareHexagram.hasChangingLines(
                                  SessionData.hexagram1!)) ...[
                                Row(
                                  children: [
                                    Text(
                                      '${SessionData.hex2No}',
                                      style: AppTheme.headingStyle.copyWith(
                                        fontSize: responsive.scaleFontSize(16),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      '${SessionData.hex2Title}',
                                      style: AppTheme.headingStyle.copyWith(
                                        fontSize: responsive.scaleFontSize(16),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: responsive.scaleHeight(8)),
                                Text(
                                  '${SessionData.hex2Definition}',
                                  style: AppTheme.bodyLarge.copyWith(
                                    fontSize: responsive.scaleFontSize(16),
                                  ),
                                  textAlign: TextAlign.left,
                                  maxLines: null,
                                  overflow: TextOverflow.clip,
                                ),
                                SizedBox(height: responsive.scaleHeight(22)),
                              ],
                              // dynamic size textfield
                              Container(
                                width: responsive.scaleWidth(300),
                                constraints: BoxConstraints(
                                  maxHeight: responsive.scaleHeight(200),
                                ),
                                child: TextField(
                                  minLines: 3,
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                    hintStyle: const TextStyle(
                                        color: AppTheme.disabledTextColor),
                                    hintText: 'Type Here',
                                    border: const OutlineInputBorder(),
                                    labelText: 'Enter Comments',
                                    labelStyle: const TextStyle(
                                        color: AppTheme.primaryColor),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    errorText: isCommentsError
                                        ? 'Please enter valid comments'
                                        : null,
                                    counterText:
                                        '${commentsController.text.split(RegExp(r'\s+')).where((word) => word.isNotEmpty).length}/200 words',
                                  ),
                                  controller: commentsController,
                                  focusNode: commentsFocusNode,
                                  onChanged: (value) {
                                    setState(() {
                                      isCommentsError = !isCommentsValid();
                                      checkFormFilled();
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: responsive.scaleHeight(24)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // non-scrollable area - textfield and buttons
            Container(
              width: responsive.scaleWidth(360),
              padding: EdgeInsets.symmetric(
                horizontal: responsive.scaleWidth(12),
                vertical: responsive.scaleHeight(8),
              ),
              child: Column(
                children: [
                  SizedBox(height: responsive.scaleHeight(24)),
                  SizedBox(
                    width: responsive.scaleWidth(312),
                    child: ElevatedButton(
                      onPressed: isFormFilled
                          ? () {
                              // set the form data into sessiondata
                              SessionData.comments = commentsController.text;

                              // parse the time with formatTime function from sessiondata
                              DateTime timestamp = DateTime.now();

                              String hexagram1Description =
                                  SessionData.hex1Definition;
                              String? hexagram2Description =
                                  SessionData.hex2Definition;

                              // create a new questionresult object with the form data
                              QuestionResult result = QuestionResult(
                                  question: SessionData.query,
                                  category: SessionData.sessionCategory,
                                  timestamp: timestamp,
                                  hexagram1No: SessionData.hex1No,
                                  hexagram1Title: SessionData.hex1Title,
                                  hexagram1Description: hexagram1Description,
                                  hexagram2No: SessionData.hex2No,
                                  hexagram2Title: SessionData.hex2Title,
                                  hexagram2Description: hexagram2Description,
                                  interpretation: SessionData.comments);

                              // save the result to sessiondata
                              SessionData.addQuestionResult(result);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ReportPreview()),
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Text(
                        'Generate Report',
                        style: TextStyle(
                          fontSize: responsive.scaleFontSize(16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: responsive.scaleHeight(16)),
                  SizedBox(
                    width: responsive.scaleWidth(312),
                    child: ElevatedButton(
                      onPressed: isFormFilled
                          ? () {
                              // set the form data into sessiondata
                              SessionData.comments = commentsController.text;

                              // parse the time with formatTime function from sessiondata
                              DateTime timestamp = DateTime.now();

                              String hexagram1Description =
                                  SessionData.hex1Definition;
                              String? hexagram2Description =
                                  SessionData.hex2Definition;

                              // create a new questionresult object with the form data
                              QuestionResult result = QuestionResult(
                                  question: SessionData.query,
                                  category: SessionData.sessionCategory,
                                  timestamp: timestamp,
                                  hexagram1No: SessionData.hex1No,
                                  hexagram1Title: SessionData.hex1Title,
                                  hexagram1Description: hexagram1Description,
                                  hexagram2No: SessionData.hex2No,
                                  hexagram2Title: SessionData.hex2Title,
                                  hexagram2Description: hexagram2Description,
                                  interpretation: SessionData.comments);

                              // save the result to sessiondata
                              SessionData.addQuestionResult(result);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const QueryDetails()),
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Text(
                        'Save and Ask Another Question',
                        style: TextStyle(
                          fontSize: responsive.scaleFontSize(16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: responsive.scaleHeight(20)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
