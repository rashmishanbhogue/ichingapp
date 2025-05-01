// coin_tossing.dart, navigate here from query_details.dart
import 'package:flutter/material.dart';
import 'generate_hexagram.dart';
import './dart/responsive.dart';
import './dart/theme.dart';
import './dart/session_data.dart';
import './dart/compare_hexagram.dart';

class CoinToss extends StatefulWidget {
  const CoinToss({super.key});

  @override
  CoinTossState createState() => CoinTossState();
}

class CoinTossState extends State<CoinToss> {
  String? throw1, throw2, throw3, throw4, throw5, throw6;

  // disable all dropdowns except for the first on formload
  bool throw1Enabled = true;
  bool throw2Enabled = false;
  bool throw3Enabled = false;
  bool throw4Enabled = false;
  bool throw5Enabled = false;
  bool throw6Enabled = false;

  // disable both buttons on formload
  bool isGenerateEnabled = false;
  bool isResetEnabled = false;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      body: SingleChildScrollView(
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
              // back button
              InkWell(
                onTap: () {
                  Navigator.pop(context);
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
                  'Coin Tossing',
                  style: TextStyle(
                    fontSize: responsive.scaleFontSize(22),
                    color: AppTheme.secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: responsive.scaleHeight(24)),

              // throw dropdown list
              buildDropdown(
                  label: 'Throw1',
                  value: throw1,
                  onChanged: (newValue) {
                    setState(() {
                      throw1 = newValue;
                      throw2Enabled = true;
                      isResetEnabled = true;
                    });
                  },
                  enabled: throw1Enabled),
              buildDropdown(
                  label: 'Throw2',
                  value: throw2,
                  onChanged: (newValue) {
                    setState(() {
                      throw2 = newValue;
                      throw3Enabled = true;
                    });
                  },
                  enabled: throw2Enabled),
              buildDropdown(
                  label: 'Throw3',
                  value: throw3,
                  onChanged: (newValue) {
                    setState(() {
                      throw3 = newValue;
                      throw4Enabled = true;
                    });
                  },
                  enabled: throw3Enabled),
              buildDropdown(
                  label: 'Throw4',
                  value: throw4,
                  onChanged: (newValue) {
                    setState(() {
                      throw4 = newValue;
                      throw5Enabled = true;
                    });
                  },
                  enabled: throw4Enabled),
              buildDropdown(
                  label: 'Throw5',
                  value: throw5,
                  onChanged: (newValue) {
                    setState(() {
                      throw5 = newValue;
                      throw6Enabled = true;
                    });
                  },
                  enabled: throw5Enabled),
              buildDropdown(
                  label: 'Throw6',
                  value: throw6,
                  onChanged: (newValue) {
                    setState(() {
                      throw6 = newValue;
                      isGenerateEnabled = true;
                      checkAllSelected();
                    });
                  },
                  enabled: throw6Enabled),

              SizedBox(height: responsive.scaleHeight(30)),

              Center(
                child: SizedBox(
                  width: responsive.scaleWidth(312),
                  child: ElevatedButton(
                    onPressed: isGenerateEnabled
                        ? () {
                            print(
                                "Dropdown Input Values: throw1=$throw1, throw2=$throw2, throw3=$throw3, throw4=$throw4, throw5=$throw5, throw6=$throw6");
                            // combine throws into hexagram1
                            SessionData.hexagram1 = [
                              throw6!, // throws stored in reverse order for the descending pattern
                              throw5!,
                              throw4!,
                              throw3!,
                              throw2!,
                              throw1!,
                            ];

                            SessionData.generateSecondHexagram();
                            final compareHexagram = CompareHexagram();
                            compareHexagram.compareHexagrams();

                            SessionData.hexagram1Title =
                                compareHexagram.matchedHexagram1Title;
                            SessionData.hexagram1Definition =
                                compareHexagram.matchedHexagram1Definition;
                            SessionData.hexagram2Title =
                                compareHexagram.matchedHexagram2Title;
                            SessionData.hexagram2Definition =
                                compareHexagram.matchedHexagram2Definition;

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      GenerateHexagram()), // navigate to GenerateHexagram()
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                        // backgroundColor: const Color(0xFF6750A4),
                        // foregroundColor: const Color(0xFFFFFFFF),
                        backgroundColor: isGenerateEnabled
                            ? AppTheme.primaryColor
                            : Colors.grey,
                        foregroundColor: isGenerateEnabled
                            ? Colors.white
                            : AppTheme.secondaryColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        )),
                    child: Text(
                      'Generate Hexagram',
                      style: TextStyle(fontSize: responsive.scaleFontSize(16)),
                    ),
                  ),
                ),
              ),

              SizedBox(height: responsive.scaleHeight(16)),

              Center(
                  child: SizedBox(
                width: responsive.scaleWidth(312),
                child: ElevatedButton(
                  onPressed: throw2Enabled
                      ? () {
                          setState(() {
                            throw1 = throw2 =
                                throw3 = throw4 = throw5 = throw6 = null;
                            throw1Enabled = true;
                            throw2Enabled = throw3Enabled = throw4Enabled =
                                throw5Enabled = throw6Enabled = false;
                            isGenerateEnabled = false;
                            isResetEnabled = false;
                          });
                          checkAllSelected();
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          throw1Enabled ? Colors.white : Colors.transparent,
                      foregroundColor: throw2Enabled
                          ? Colors.white // active text colour
                          : AppTheme.secondaryColor, // disabled text colour
                      side: throw2Enabled
                          ? BorderSide(
                              // add border when enabled
                              color: AppTheme
                                  .primaryColor, // border colour when enabled
                              width: 1,
                            )
                          : null, // no border when disabled
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side: BorderSide(
                            color: throw2Enabled
                                ? AppTheme.primaryColor // active outline colour
                                : AppTheme
                                    .disabledOutlineColor, // disabled outline colour
                            width: 1,
                          ))),
                  child: Text(
                    'Reset All',
                    style: TextStyle(
                      fontSize: responsive.scaleFontSize(16),
                      color: throw2Enabled
                          ? AppTheme.primaryColor // active text colour
                          : AppTheme.disabledTextColor, // disabled text colour
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  // build dropdown list
  Widget buildDropdown({
    required String label,
    String? value,
    required ValueChanged<String?> onChanged,
    required bool enabled,
  }) {
    final responsive = Responsive(context);

    // set default value to be displayed before selection
    Color dropdownTextColor =
        value == null ? AppTheme.disabledTextColor : AppTheme.secondaryColor;

    return Padding(
      padding: EdgeInsets.only(bottom: responsive.scaleHeight(24)),
      child: Center(
        child: Container(
          width: responsive.scaleWidth(312),
          child: DropdownButtonFormField<String>(
            value: value, // value will be null when no selection is made
            hint: Text(
              'Select Result', // shown when value is null
              style: TextStyle(
                  color: AppTheme
                      .disabledTextColor), // greyed-out colour for hinttext
            ),
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(color: AppTheme.primaryColor),
              border: OutlineInputBorder(),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            items: [
              // add only the actual options, no 'Select Result'
              DropdownMenuItem<String>(
                value: 'yin',
                child: Text('Yin'),
              ),
              DropdownMenuItem<String>(
                value: 'yang',
                child: Text('Yang'),
              ),
              DropdownMenuItem<String>(
                value: 'yinchanging',
                child: Text('Yin Changing'),
              ),
              DropdownMenuItem<String>(
                value: 'yangchanging',
                child: Text('Yang Changing'),
              ),
            ],
            onChanged: enabled ? onChanged : null,
            style: TextStyle(
                color: dropdownTextColor), // dynamically set the colour
          ),
        ),
      ),
    );
  }

  // enable the generate button only if the last dropdown is selected
  void checkAllSelected() {
    setState(() {
      isGenerateEnabled = throw6 != null;
    });
  }
}
