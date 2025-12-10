// generate_hexagram.dart, generate hexagram(s) based on the throw inputs

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
  final ScrollController hex1DefController = ScrollController();
  final ScrollController hex2DefController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    hex1DefController.dispose();
    hex2DefController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    debugPrint("SessionData.hexagram1: ${SessionData.hexagram1}");
    debugPrint("SessionData.hexagram2: ${SessionData.hexagram2}");

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
                  style: AppTheme.headingStyle.copyWith(
                    fontSize: responsive.scaleFontSize(22),
                  ),
                ),
              ),
              SizedBox(height: responsive.scaleHeight(24)),
              DefaultTabController(
                length: CompareHexagram.hasChangingLines(SessionData.hexagram1!)
                    ? 2
                    : 1,
                child: Column(
                  children: [
                    Center(
                      child: SizedBox(
                        width: responsive.scaleWidth(300),
                        child: TabBar(
                          indicator: const BoxDecoration(
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
                          labelStyle: AppTheme.labelStyle.copyWith(
                            fontSize: responsive.scaleFontSize(14),
                          ),
                          tabs: [
                            const Tab(text: 'Hexagram 1'),
                            if (CompareHexagram.hasChangingLines(
                                SessionData.hexagram1!))
                              const Tab(text: 'Hexagram 2'),
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
                            color: Colors.black.withValues(),
                            offset: const Offset(0, 2),
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
                                alignment: const Alignment(0.0,
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
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      SessionData.hex1No,
                                      style: AppTheme.headingStyle.copyWith(
                                        fontSize: responsive.scaleFontSize(16),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    // title wraps and takes remaining width
                                    Expanded(
                                      child: Text(
                                        SessionData.hex1Title,
                                        style: AppTheme.headingStyle.copyWith(
                                          fontSize:
                                              responsive.scaleFontSize(16),
                                        ),
                                        softWrap: true,
                                        maxLines: null,
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: responsive.scaleWidth(16),
                                  vertical: responsive.scaleHeight(8),
                                ),
                                // short description for Hexagram 1
                                child: SizedBox(
                                  height: responsive.scaleHeight(90),
                                  child: Scrollbar(
                                    controller: hex1DefController,
                                    thumbVisibility: true,
                                    radius: const Radius.circular(4),
                                    thickness: 8,
                                    child: SingleChildScrollView(
                                      controller: hex1DefController,
                                      padding: const EdgeInsets.only(
                                          right:
                                              12), // space for the scrollbar thumb
                                      physics: const ClampingScrollPhysics(),
                                      child: Text(
                                        SessionData.hex1Definition,
                                        style: AppTheme.bodyLarge.copyWith(
                                          fontSize:
                                              responsive.scaleFontSize(16),
                                        ),
                                        textAlign: TextAlign.left,
                                        softWrap: true,
                                      ),
                                    ),
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
                                  alignment: const Alignment(0.0,
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
                                  // title for hexagram 2 interpretation
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        '${SessionData.hex2No}',
                                        style: AppTheme.headingStyle.copyWith(
                                          fontSize:
                                              responsive.scaleFontSize(16),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      // title wraps and takes remaining width
                                      Expanded(
                                        child: Text(
                                          '${SessionData.hex2Title}',
                                          style: AppTheme.headingStyle.copyWith(
                                            fontSize:
                                                responsive.scaleFontSize(16),
                                          ),
                                          softWrap: true,
                                          maxLines: null,
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: responsive.scaleWidth(16),
                                    vertical: responsive.scaleHeight(8),
                                  ),
                                  // short description for Hexagram 2
                                  child: SizedBox(
                                    height: responsive.scaleHeight(90),
                                    child: Scrollbar(
                                      controller: hex2DefController,
                                      thumbVisibility: true,
                                      radius: const Radius.circular(4),
                                      thickness: 8,
                                      child: SingleChildScrollView(
                                        controller: hex2DefController,
                                        padding: const EdgeInsets.only(
                                            right:
                                                12), // space for the scrollbar thumb
                                        physics: const ClampingScrollPhysics(),
                                        child: Text(
                                          '${SessionData.hex2Definition}',
                                          style: AppTheme.bodyLarge.copyWith(
                                            fontSize:
                                                responsive.scaleFontSize(16),
                                          ),
                                          textAlign: TextAlign.left,
                                          softWrap: true,
                                        ),
                                      ),
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

              SizedBox(height: responsive.scaleHeight(30)),

              // centered button
              Center(
                child: SizedBox(
                  width: responsive.scaleWidth(312),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HexagramDetails()),
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
                      style: AppTheme.buttonTextStyle.copyWith(
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
