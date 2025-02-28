// shared variables methods globalkeys to be called for validation across the program

import 'package:flutter/material.dart';

// shared globalkey for formstate
final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

// function to validate non-empty input
String? validateRequired(String? value, String fieldName) {
  if (value == null || value.isEmpty) {
    return 'Please enter your $fieldName';
  }
  return null; // return null if the input is valid
}

// function to validate if the input is a number
String? validateNumber(String? value, String fieldName) {
  if (value == null || value.isEmpty) {
    return 'Please enter a $fieldName';
  } else if (double.tryParse(value) == null) {
    return 'Please enter a valid number for $fieldName';
  }
  return null; // return null if the input is valid
}

// function to validate if the input contains only letters
String? validateLetter(String? value, String fieldName) {
  if (value == null || value.isEmpty) {
    return '$fieldName cannot be blank';
  } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
    return '$fieldName can only contain alphabets';
  }
  return null; // return null if the input is valid
}
