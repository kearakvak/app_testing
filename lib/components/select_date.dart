import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

class SelectDate {
  static Future<String?> show(BuildContext context) async {
    // final localProvider = context.read<DataHandlingLocal>();

    final currentLocale = Localizations.localeOf(context);

    final values = await showDialog<List<DateTime?>>(
      context: context,
      builder: (dialogContext) {
        return Localizations.override(
          context: dialogContext,
          locale: currentLocale,
          child: Dialog(
            insetPadding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: CalendarDatePicker2WithActionButtons(
              value: [],
              config: CalendarDatePicker2WithActionButtonsConfig(
                calendarType: CalendarDatePicker2Type.single,
                firstDayOfWeek: 1,
                gapBetweenCalendarAndButtons: 20,
                cancelButtonTextStyle: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
                okButtonTextStyle: TextStyle(
                  color: Colors.black12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onValueChanged: (dates) {
                Navigator.of(dialogContext).pop(dates);
              },
              onCancelTapped: () => Navigator.of(dialogContext).pop(null),
            ),
          ),
        );
      },
    );
    print("Datais Ring = $values");
    if (values != null && values.isNotEmpty) {
      final start = values[0];
      final end = values.length > 1 ? values[1] : null;

      String formatDate(DateTime d) =>
          "${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}";

      String formattedRange = "";
      if (start != null) {
        formattedRange = formatDate(start);
        if (end != null) {
          formattedRange += "&endDate=${formatDate(end)}";
        }
      }

      return formattedRange;
    }
    return null;
  }
}
