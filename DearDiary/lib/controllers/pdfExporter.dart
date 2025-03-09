import 'dart:io';

import 'package:collection/collection.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

import '../models/car_model.dart';

class DiaryPDFExporter {
  static Future<void> generatePDF(List<CarModel> entries) async {
    List<String> monthsInAYear = [
      '',
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    List<String> daysInAWeek = [
      '',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: entries
              .mapIndexed((i, entry) => pw.Column(children: [
                    if (i == 0 ||
                        DateTime.parse(entry.date).month !=
                            DateTime.parse(entries[i - 1].date).month)
                      pw.Text(
                          '${monthsInAYear[DateTime.parse(entry.date).month]} ${DateTime.parse(entry.date).year}'),
                    pw.Text(
                        "${daysInAWeek[DateTime.parse(entry.date).weekday]}, ${monthsInAYear[DateTime.parse(entry.date).month]} ${DateTime.parse(entry.date).day}"),
                    pw.Align(
                        alignment: pw.Alignment.topLeft,
                        child: pw.Text(entry.description))
                  ]))
              .toList(),
        ),
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/diary_entries.pdf';
    final file = File(filePath);

    await file.writeAsBytes(await pdf.save());
    OpenFile.open(filePath);
  }
}
