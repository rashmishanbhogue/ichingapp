// personal_details.dart, navigate here from main.dart
import 'package:flutter/material.dart';
import 'query_details.dart';
import 'responsive.dart';
import 'theme.dart';
import 'shared_variables.dart';
import 'session_data.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  PersonalDetailsState createState() => PersonalDetailsState();
}

class PersonalDetailsState extends State<PersonalDetails> {
  // controllers for the input fields
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final tobController = TextEditingController();
  final pobController = TextEditingController();

  // focus nodes to manage the keyboard and dropdowns
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode dobFocusNode = FocusNode();
  final FocusNode tobFocusNode = FocusNode();
  final FocusNode pobFocusNode = FocusNode();

  // track user interaction
  bool hasNameInteracted = false;
  bool hasPobInteracted = false;
  bool hasDobInteracted = false;
  bool hasTobInteracted = false;

  // track whether the form is filled
  bool isFormFilled = false;

  // error state variables
  bool isNameError = false;
  bool isDobError = false;
  bool isTobError = false;
  bool isPobError = false;

  @override
  void initState() {
    super.initState();

    nameFocusNode.addListener(() {
      if (!nameFocusNode.hasFocus) {
        hasNameInteracted = true;
        validateName();
      }
    });

    dobFocusNode.addListener(() {
      if (!dobFocusNode.hasFocus) {
        hasDobInteracted = true;
        validateDob();
      }
    });

    tobFocusNode.addListener(() {
      if (!tobFocusNode.hasFocus) {
        hasTobInteracted = true;
        validateTob();
      }
    });

    pobFocusNode.addListener(() {
      if (!pobFocusNode.hasFocus) {
        hasPobInteracted = true;
        validatePob();
      }
    });

    // listeners to all text controllers on real time input
    nameController.addListener(onRealTimeInputChange);
    dobController.addListener(onRealTimeInputChange);
    tobController.addListener(onRealTimeInputChange);
    pobController.addListener(onRealTimeInputChange);
  }

  // method for realtime input change validation
  void onRealTimeInputChange() {
    setState(() {
      if (hasNameInteracted) isNameError = !isNameValid();
      if (hasDobInteracted) isDobError = !isDobValid();
      if (hasTobInteracted) isTobError = !isTobValid();
      if (hasPobInteracted) isPobError = !isPobValid();

      // check for the entire form being filled correctly
      checkFormFilled();
    });
  }

// validation checks for each field
  bool isNameValid() {
    final name = nameController.text;
    return RegExp(r'^[a-zA-Z\s]+$').hasMatch(name) && name.isNotEmpty;
  }

  bool isDobValid() {
    final dob = dobController.text;
    return RegExp(r'^\d{2}/\d{2}/\d{4}$')
        .hasMatch(dob); // check format DD/MM/YYYY
  }

  bool isTobValid() {
    final tob = tobController.text;
    return RegExp(r'^\d{1,2}:\d{2} (AM|PM)$')
        .hasMatch(tob); // check format HH:MM AM/PM
  }

  bool isPobValid() {
    final pob = pobController.text;
    return RegExp(r'^[a-zA-Z\s]+$').hasMatch(pob) && pob.isNotEmpty;
  }

  void validateName() {
    setState(() {
      isNameError = nameController.text.isEmpty || !isNameValid();
    });
  }

  void validateDob() {
    setState(() {
      isDobError = dobController.text.isEmpty || !isDobValid();
    });
  }

  void validateTob() {
    setState(() {
      isTobError = tobController.text.isEmpty || !isTobValid();
    });
  }

  void validatePob() {
    setState(() {
      isPobError = pobController.text.isEmpty || !isPobValid();
    });
  }

  void checkFormFilled() {
    setState(() {
      isFormFilled =
          isNameValid() && isDobValid() && isTobValid() && isPobValid();
    });
  }

  void onFocusChange(
      FocusNode node, bool Function() validate, Function(bool) setError) {
    if (node == nameFocusNode) {
      hasNameInteracted = true;
      final isValid = validate();
      setError(!isValid);
    } else if (node == dobFocusNode) {
      hasDobInteracted = true;
      final isValid = validate();
      setError(!isValid);
    } else if (node == tobFocusNode) {
      hasTobInteracted = true;
      final isValid = validate();
      setError(!isValid);
    } else if (node == pobFocusNode) {
      hasPobInteracted = true;
      final isValid = validate();
      setError(!isValid);
    }
  }

  @override
  void dispose() {
    // dispose of the controllers
    nameController.dispose();
    dobController.dispose();
    tobController.dispose();
    pobController.dispose();
    nameFocusNode.dispose();
    dobFocusNode.dispose();
    tobFocusNode.dispose();
    pobFocusNode.dispose();
    super.dispose();
  }

  // method to show the time picker for Time of Birth
  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        tobController.text = pickedTime.format(context);
        hasTobInteracted = true;
      });
      validateTob();
    } else {
      setState(() {
        isTobError = tobController.text.isEmpty;
      });
    }
  }

  // method to show the date picker
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppTheme.primaryColor,
            colorScheme:
                ColorScheme.light(primary: AppTheme.primaryColor).copyWith(
              secondary: AppTheme.secondaryColor,
            ),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        // format the date to DD/MM/YYYY
        dobController.text =
            "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";
        hasDobInteracted = true;
      });
      validateDob();
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          // prevent overflow
          child: Container(
            width: responsive.scaleWidth(360),
            padding: EdgeInsets.only(
              top: responsive.scaleHeight(104),
              left: responsive.scaleWidth(12),
              right: responsive.scaleWidth(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // keep "Personal Details" left aligned
              mainAxisAlignment:
                  MainAxisAlignment.start, // align children at the start
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: responsive.scaleWidth(
                          12)), // keep left padding for "Personal Details"
                  child: Text(
                    'Personal Details',
                    style: TextStyle(
                      fontSize: responsive.scaleFontSize(22),
                      color: AppTheme.secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: responsive.scaleHeight(24)),
                Center(
                  child: Container(
                    width: responsive.scaleWidth(312),
                    child: TextField(
                      controller: nameController, // controller
                      focusNode: nameFocusNode, // focus node
                      decoration: InputDecoration(
                        hintText: 'Enter Fullname',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: isNameError
                              ? Colors.red
                              : AppTheme.secondaryColor,
                        )),
                        labelText: 'Name',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            nameController.clear();

                            validateName();
                          },
                          child: Icon(Icons.cancel_outlined,
                              color: AppTheme.secondaryColor), // suffix icon
                        ),
                        errorText: isNameError
                            ? validateLetter(nameController.text, 'Full Name')
                            : null,
                      ),
                      style: TextStyle(color: AppTheme.secondaryColor),
                      onChanged: (value) {
                        hasNameInteracted = true;
                        onRealTimeInputChange();
                      },
                    ),
                  ),
                ),
                SizedBox(height: responsive.scaleHeight(30)),
                Center(
                  child: Container(
                    width: responsive.scaleWidth(312),
                    child: TextField(
                      controller: dobController,
                      focusNode: dobFocusNode,
                      readOnly: true,
                      onTap: () => selectDate(context),
                      decoration: InputDecoration(
                        hintText: 'DD/MM/YYYY',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color:
                              isDobError ? Colors.red : AppTheme.secondaryColor,
                        )),
                        labelText: 'Date of Birth',
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: AppTheme.secondaryColor,
                        ), // suffix icon
                        errorText:
                            isDobError ? 'Date of Birth cannot be blank' : null,
                      ),
                      style: TextStyle(color: AppTheme.secondaryColor),
                      onChanged: (value) {
                        hasDobInteracted = true;
                        onRealTimeInputChange();
                      },
                    ),
                  ),
                ),
                SizedBox(height: responsive.scaleHeight(30)),
                Center(
                  child: Container(
                    width: responsive.scaleWidth(312),
                    child: GestureDetector(
                      onTap: () {
                        hasTobInteracted = true;
                        validateTob();
                        selectTime(context);
                      },
                      child: AbsorbPointer(
                        // prevent keyboard from showing
                        child: TextField(
                          controller: tobController,
                          focusNode: tobFocusNode,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: 'HH:MM AM/PM',
                            labelText: 'Time of Birth',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: isTobError
                                  ? Colors.red
                                  : AppTheme.secondaryColor,
                            )),
                            prefixIcon: Icon(
                              Icons.access_time,
                              color: AppTheme.secondaryColor,
                            ),
                            suffixIcon: Icon(
                              Icons.arrow_drop_down,
                              color: AppTheme.secondaryColor,
                            ),
                            errorText: isTobError
                                ? 'Time of Birth cannot be blank'
                                : null,
                          ),
                          style: TextStyle(
                            color: AppTheme.secondaryColor,
                          ),
                          onChanged: (value) {
                            hasTobInteracted = true;
                            onRealTimeInputChange();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: responsive.scaleHeight(30)),
                Center(
                  child: Container(
                    width: responsive.scaleWidth(312),
                    child: TextField(
                      controller: pobController,
                      focusNode: pobFocusNode,
                      decoration: InputDecoration(
                        hintText: 'Enter Place of Birth',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color:
                              isPobError ? Colors.red : AppTheme.secondaryColor,
                        )),
                        labelText: 'Place of Birth',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            pobController.clear();
                            validatePob();
                          },
                          child: Icon(Icons.cancel_outlined,
                              color: AppTheme.secondaryColor),
                        ),
                        errorText: isPobError
                            ? validateLetter(
                                pobController.text, 'Place of Birth')
                            : null,
                      ),
                      style: TextStyle(color: AppTheme.secondaryColor),
                      onChanged: (value) {
                        hasPobInteracted = true;
                        onRealTimeInputChange();
                      },
                    ),
                  ),
                ),
                SizedBox(height: responsive.scaleHeight(40)),
                Center(
                  child: SizedBox(
                    width: responsive.scaleWidth(312),
                    child: ElevatedButton(
                      onPressed: isFormFilled
                          ? () {
                              SessionData.name = nameController.text;
                              SessionData.dob = dobController.text;
                              SessionData.tob = tobController.text;
                              SessionData.pob = pobController.text;

                              // mark the session as started
                              SessionData.sessionStarted = true;

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => QueryDetails(),
                                ),
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          )),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: responsive.scaleFontSize(16),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
