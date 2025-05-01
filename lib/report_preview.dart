// report_preview.dart, view and download report in pdf formatted for a5
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import './dart/responsive.dart';
import './dart/theme.dart';
import './dart/session_data.dart';

class ReportPreview extends StatelessWidget {
  const ReportPreview({super.key});

  void addQuestionResult(QuestionResult result) {
    SessionData.questionResults.add(result);
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      body: Column(
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
                  onTap: () {
                    Navigator.pop(context); // navigate back
                  },
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
                    'I-Ching Report',
                    style: TextStyle(
                      fontSize: responsive.scaleFontSize(22),
                      color: AppTheme.secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: responsive.scaleHeight(20)),
              ],
            ),
          ),

          // scrollable area: Hexagram descriptions
          Flexible(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                width: responsive.scaleWidth(320),
                padding: EdgeInsets.symmetric(
                  vertical: responsive.scaleHeight(8),
                  horizontal: responsive.scaleWidth(8),
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
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: responsive.scaleFontSize(14),
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.15,
                                    color: AppTheme.secondaryColor,
                                  ),
                                ),
                                SizedBox(width: responsive.scaleWidth(8)),
                                Expanded(
                                  child: Text(
                                    '$SessionData.name',
                                    style: TextStyle(
                                      fontSize: responsive.scaleFontSize(16),
                                      color: AppTheme.secondaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: responsive.scaleHeight(4)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Date of Birth',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: responsive.scaleFontSize(14),
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.15,
                                    color: AppTheme.secondaryColor,
                                  ),
                                ),
                                SizedBox(width: responsive.scaleWidth(8)),
                                Text(
                                  '$SessionData.dob',
                                  style: TextStyle(
                                    fontSize: responsive.scaleFontSize(16),
                                    color: AppTheme.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: responsive.scaleHeight(4)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Place of Birth',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: responsive.scaleFontSize(14),
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.15,
                                    color: AppTheme.secondaryColor,
                                  ),
                                ),
                                SizedBox(width: responsive.scaleWidth(8)),
                                Text(
                                  '$SessionData.pob',
                                  style: TextStyle(
                                    fontSize: responsive.scaleFontSize(16),
                                    color: AppTheme.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: responsive.scaleHeight(4)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Consultation Date',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: responsive.scaleFontSize(14),
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.15,
                                    color: AppTheme.secondaryColor,
                                  ),
                                ),
                                SizedBox(width: responsive.scaleWidth(8)),
                                Text(
                                  '$SessionData.currentDate',
                                  style: TextStyle(
                                    fontSize: responsive.scaleFontSize(16),
                                    color: AppTheme.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: responsive.scaleHeight(16)),

                            // loop through question results and render them
                            Column(
                              children: [
                                // use the spread operator to inject the list of widgets generated by map
                                ...SessionData.questionResults.map(
                                  (result) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Q: ${result.question}',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize:
                                              responsive.scaleFontSize(16),
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                          color: AppTheme.secondaryColor,
                                        ),
                                      ),
                                      SizedBox(
                                          height: responsive.scaleHeight(4)),
                                      Text(
                                        '(Time: ${SessionData.formatTime(result.timestamp)}  \t\t Category: ${result.category})',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize:
                                              responsive.scaleFontSize(14),
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                          color: AppTheme.secondaryColor,
                                        ),
                                      ),
                                      SizedBox(
                                          height: responsive.scaleHeight(8)),
                                      Text(
                                        '$result.hexagram1Description',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize:
                                              responsive.scaleFontSize(16),
                                          fontWeight: FontWeight.normal,
                                          letterSpacing: 0.5,
                                          color: AppTheme.secondaryColor,
                                        ),
                                      ),
                                      SizedBox(
                                          height: responsive.scaleHeight(4)),
                                      // conditionally display hexagram 2 description if it exists
                                      if (result.hexagram2Description != null)
                                        Text(
                                          '${result.hexagram2Description}',
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize:
                                                responsive.scaleFontSize(16),
                                            fontWeight: FontWeight.normal,
                                            letterSpacing: 0.5,
                                            color: AppTheme.secondaryColor,
                                          ),
                                        ),
                                      SizedBox(
                                          height: responsive.scaleHeight(8)),
                                      Text(
                                        'Comments',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize:
                                              responsive.scaleFontSize(16),
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.15,
                                          color: AppTheme.secondaryColor,
                                        ),
                                      ),
                                      SizedBox(
                                          height: responsive.scaleHeight(8)),
                                      Text(
                                        '$result.interpretation',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize:
                                              responsive.scaleFontSize(16),
                                          fontWeight: FontWeight.normal,
                                          letterSpacing: 0.5,
                                          color: AppTheme.secondaryColor,
                                        ),
                                      ),
                                      SizedBox(
                                          height: responsive.scaleHeight(20)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // non-scrollable area - TextField and buttons
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
                    onPressed: () async {
                      // snackbar display before PDF is generated
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Container(
                            height: 60, // trial increase of the snackbar height
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Downloading PDF, please wait...',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: responsive.scaleFontSize(16)),
                            ),
                          ),
                          backgroundColor:
                              AppTheme.primaryColor, // light purple background
                          duration:
                              const Duration(seconds: 2), // show for 2 seconds
                        ),
                      );

                      final pdfFile =
                          await generatePDF(); // await the PDF document
                      final pdfBytes = await pdfFile
                          .save(); // await the saving process to get the bytes

                      await Printing.sharePdf(
                        bytes: pdfBytes, // pass the Uint8List bytes here
                        filename:
                            '${SessionData.name.replaceAll(' ', '_')}_${SessionData.getFormattedDate(SessionData.currentDate)}.pdf',
                        // filename: SessionData.generatePdfFilename(),
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
                      'Download Report',
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
                    onPressed: () {
                      // clear sessiondata
                      SessionData.clearSessionData();
                      // close the app
                      SystemNavigator.pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.disabledOutlineColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: const BorderSide(
                          color: AppTheme.primaryColor,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Text(
                      'Exit',
                      style: TextStyle(
                        fontSize: responsive.scaleFontSize(16),
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<pw.Document> generatePDF() async {
    final pdf = pw.Document();

    final logoBytes = await rootBundle.load('assets/images/logo.jpg');
    final logoImage = pw.MemoryImage(logoBytes.buffer.asUint8List());

    final content = generateReportContent();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a5,
        margin: const pw.EdgeInsets.all(20),
        header: (context) => pw.Container(
          margin: const pw.EdgeInsets.symmetric(horizontal: 20),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(
                    children: [
                      pw.Image(logoImage, width: 30, height: 30),
                      pw.SizedBox(width: 8),
                      pw.Text(
                        'Your Firm Name',
                        style: pw.TextStyle(
                            fontSize: 10, fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              pw.Row(
                children: [
                  pw.Text(
                    'I C H I N G\t\t\tR E P O R T',
                    style: pw.TextStyle(
                        fontSize: 16, fontWeight: pw.FontWeight.bold),
                  ),
                ],
              ),
              pw.SizedBox(height: 16),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Name: ${SessionData.name}',
                      style: const pw.TextStyle(fontSize: 9)),
                  pw.Text('DoB: ${SessionData.dob}, ${SessionData.tob}',
                      style: const pw.TextStyle(fontSize: 9)),
                  pw.Text('PoB: ${SessionData.pob}',
                      style: const pw.TextStyle(fontSize: 9)),
                  pw.Text('Consultation Date: ${SessionData.currentDate}',
                      style: const pw.TextStyle(fontSize: 9)),
                ],
              ),
              pw.Divider(thickness: 1),
              pw.SizedBox(height: 20),
            ],
          ),
        ),
        build: (context) => [
          pw.Container(
            margin: const pw.EdgeInsets.symmetric(horizontal: 22),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: content,
            ),
          ),
        ],
        footer: (context) => pw.Container(
          margin: const pw.EdgeInsets.symmetric(horizontal: 20),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
            children: [
              pw.Divider(thickness: 1),
              pw.SizedBox(height: 4),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Firm Address Line 1 - A',
                          style: const pw.TextStyle(fontSize: 9)),
                      pw.Text('Firm Address Line 2 - A',
                          style: const pw.TextStyle(fontSize: 9)),
                      pw.Text('Firm Address Line 3 - A',
                          style: const pw.TextStyle(fontSize: 9)),
                    ],
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Firm Address Line 1 - B',
                          style: const pw.TextStyle(fontSize: 9)),
                      pw.Text('Firm Address Line 2 - B',
                          style: const pw.TextStyle(fontSize: 9)),
                      pw.Text('Firm Address Line 3 - B',
                          style: const pw.TextStyle(fontSize: 9)),
                    ],
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Firm Address Line 1 - C',
                          style: const pw.TextStyle(fontSize: 9)),
                      pw.Text('Firm Address Line 2 - C',
                          style: const pw.TextStyle(fontSize: 9)),
                      pw.Text('Firm Address Line 3 - C',
                          style: const pw.TextStyle(fontSize: 9)),
                    ],
                  ),
                ],
              ),
              pw.Divider(thickness: 1),
              pw.SizedBox(height: 4),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text('${context.pageNumber} / ${context.pagesCount}',
                      style: const pw.TextStyle(fontSize: 9)),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    return pdf;
  }

  List<pw.Widget> generateReportContent() {
    List<pw.Widget> content = [];

    for (var i = 0; i < SessionData.questionResults.length; i++) {
      var result = SessionData.questionResults[i];

      content.add(
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'Q: ${result.question}',
              style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 5),
            pw.Text(
              '(Time: ${SessionData.formatTime(result.timestamp)} | Category: ${result.category})',
              style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 4),
            pw.Text('$result.hexagram1Description',
                style: const pw.TextStyle(fontSize: 11)),
            if (result.hexagram2Description != null) ...[
              pw.SizedBox(height: 6),
              pw.Text('${result.hexagram2Description}',
                  style: const pw.TextStyle(fontSize: 11)),
            ],
            pw.SizedBox(height: 6),
            pw.Text('Comments:',
                style:
                    pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 4),
            pw.Text('$result.interpretation',
                style: const pw.TextStyle(fontSize: 11)),
          ],
        ),
      );
    }

    return content;
  }
}
