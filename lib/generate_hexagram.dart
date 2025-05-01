import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'hexagram_details.dart';
import './dart/responsive.dart';
import './dart/compare_hexagram.dart';
import './dart/theme.dart';
import './dart/session_data.dart';

class GenerateHexagram extends StatefulWidget {
  const GenerateHexagram({super.key});

  @override
  GenerateHexagramState createState() => GenerateHexagramState();
}

class GenerateHexagramState extends State<GenerateHexagram> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    print("SessionData.hexagram1: ${SessionData.hexagram1}");
    print("SessionData.hexagram2: ${SessionData.hexagram2}");

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
                      SizedBox(
                        width: responsive.scaleWidth(4),
                      ),
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
                  'Hexagram Generation',
                  style: TextStyle(
                    fontSize: responsive.scaleFontSize(22),
                    color: AppTheme.secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: responsive.scaleHeight(24)),

              // tab layout
              DefaultTabController(
                length: CompareHexagram.hasChangingLines(SessionData.hexagram1!)
                    ? 2
                    : 1,
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: responsive.scaleWidth(300),
                        child: TabBar(
                          indicator: BoxDecoration(
                            color: AppTheme.disabledOutlineColor,
                            border: Border(
                              bottom: BorderSide(
                                color: AppTheme.primaryColor,
                                width: 3,
                              ),
                            ),
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: AppTheme.primaryColor,
                          unselectedLabelColor: AppTheme.secondaryColor,
                          labelStyle: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1.42,
                            letterSpacing: 0.1,
                          ),
                          tabs: [
                            Tab(text: 'Hexagram 1'),
                            if (CompareHexagram.hasChangingLines(
                                SessionData.hexagram1!))
                              Tab(text: 'Hexagram 2'),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: responsive.scaleWidth(300),
                      height: responsive.scaleHeight(460),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 2),
                            blurRadius: 4,
                          )
                        ],
                      ),
                      child: TabBarView(
                        children: [
                          // hexagram 1 content
                          Column(
                            children: [
                              Container(
                                height: responsive.scaleHeight(260),
                                alignment: Alignment(0.0,
                                    0.0), // center the SVG with equal space above and below
                                child: SvgPicture.string(
                                  CompareHexagram.hexagram1Svg.isNotEmpty
                                      ? CompareHexagram.hexagram1Svg
                                      : '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 240 180"><rect width="100%" height="100%" fill="gray"/></svg>',
                                  width: 240,
                                  height: 180,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: responsive.scaleWidth(16),
                                  vertical: responsive.scaleHeight(8),
                                ),
                                // title for hexagram 1 interpretation
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${SessionData.hexagram1Title}',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: responsive.scaleFontSize(16),
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.15,
                                      color: AppTheme.secondaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: responsive.scaleWidth(16),
                                  vertical: responsive.scaleHeight(8),
                                ),
                                // short description for Hexagram 1
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${SessionData.hexagram1Definition}',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: responsive.scaleFontSize(16),
                                      fontWeight: FontWeight.normal,
                                      letterSpacing: 0.5,
                                      color: AppTheme.secondaryColor,
                                    ),
                                    textAlign: TextAlign.left,
                                    maxLines: 5,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // hexagram 2 content
                          if (CompareHexagram.hasChangingLines(
                              SessionData.hexagram1!))
                            Column(
                              children: [
                                Container(
                                  height: responsive.scaleHeight(260),
                                  alignment: Alignment(0.0,
                                      0.0), // center the SVG with equal space above and below
                                  child: SvgPicture.string(
                                    CompareHexagram.hexagram2Svg.isNotEmpty
                                        ? CompareHexagram.hexagram2Svg
                                        : '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 240 180"><rect width="100%" height="100%" fill="gray"/></svg>',
                                    width: 240,
                                    height: 180,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: responsive.scaleWidth(16),
                                    vertical: responsive.scaleHeight(8),
                                  ),
                                  // title for hexagram 1 interpretation
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${SessionData.hexagram2Title}',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: responsive.scaleFontSize(16),
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.15,
                                        color: AppTheme.secondaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: responsive.scaleWidth(16),
                                    vertical: responsive.scaleHeight(8),
                                  ),
                                  // short description for Hexagram 2
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${SessionData.hexagram2Definition}',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: responsive.scaleFontSize(16),
                                        fontWeight: FontWeight.normal,
                                        letterSpacing: 0.5,
                                        color: AppTheme.secondaryColor,
                                      ),
                                      textAlign: TextAlign.left,
                                      maxLines: 5,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: responsive.scaleHeight(40)),

              // centered button
              Center(
                child: SizedBox(
                  width: responsive.scaleWidth(312),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HexagramDetails()), // navigate to HexagramDetails()
                      );
                    },
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
                      'View Interpretation',
                      style: TextStyle(
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
    );
  }
}
