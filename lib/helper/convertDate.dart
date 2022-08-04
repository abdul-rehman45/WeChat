import 'package:intl/intl.dart';

class ConvertDate {
  /// Convert and Format Date from String
  static String? formatDate(String? date, {bool checkToday = false}) {
    DateFormat? formatter;
    DateTime? _dateTime = convertToDateTime(date);
    if (_dateTime == null) return null;
    formatter = DateFormat('dd MMM yy');

    if (checkToday) {
      DateTime now = DateTime.now();
      DateTime lastMidnight = DateTime(now.year, now.month, now.day);
      DateTime yesterday = DateTime(now.year, now.month, now.day - 1);

      if (_dateTime.isAfter(lastMidnight)) {
        formatter = DateFormat('HH:mm');
      } else if (_dateTime.isAfter(yesterday)) {
        return 'Yesterday';
      }
    }
    String formattedDate = formatter.format(_dateTime);
    return formattedDate;
  }

  /// Format date to time
  static String? formatTime(String? time) {
    DateTime? _datetime = convertToDateTime(time);
    if (_datetime == null) return null;
    DateFormat formatter = DateFormat('HH:mm');
    String formattedTime = formatter.format(_datetime);
    return formattedTime;
  }

  /// Convert string to date time
  static DateTime? convertToDateTime(String? date) {
    if (date == null) return null;
    DateTime dateTime = DateTime.parse(date);
    return dateTime;
  }

  /// Returns true if the [date] is the today.
  bool isToday(DateTime date) {
    final now = DateTime.now();
    return now.day == date.day &&
        now.month == date.month &&
        now.year == date.year;
  }

  /// Returns true if the [date] is in the past.
  bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == date.day &&
        yesterday.month == date.month &&
        yesterday.year == date.year;
  }

  /// Returns the difference (in full days) between the provided date and today.
  int calculateDifference(DateTime date) {
    DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }

  static String? formatDateTime(String? dateTime) {
    DateFormat formatter = DateFormat.MEd(); //eg, Mon, 8/1
    if (dateTime != null) {
      formatter.format(DateTime.parse(dateTime));

      return formatter.format(DateTime.parse(dateTime)).toString();
    }
    return null;
  }

  static String? formatIntoDayMonthYear(String? dateTime) {
    DateFormat formatter = DateFormat('dd/MM/yy'); // e.g, 01/08/22
    if (dateTime != null) {
      return formatter.format(DateTime.parse(dateTime)).toString();
    }
    return null;
  }

  static String? formatIntoMonthYear(String? dateTime) {
    DateFormat formatter = DateFormat.yMMMMd('en_US'); // e.g, july 29, 2022
    //DateFormat('M,dd,yyyy');
    if (dateTime != null) {
      return formatter.format(DateTime.parse(dateTime)).toString();
    }
    return null;
  }

  static String? formatDateTimeINYearDayMonth(String? dateTime) {
    DateFormat formatter = DateFormat('yyyy-MM-dd'); //e.g 2022-07-07
    if (dateTime != null) {
      return formatter.format(DateTime.parse(dateTime.toString())).toString();
    }
    return null;
  }

  static String? formatIntoYear(String? dateTime) {
    DateFormat formatter = DateFormat.yM(); //e.g, 8/2022
    if (dateTime != null) {
      return formatter.format(DateTime.parse(dateTime)).toString();
    }
    return null;
  }
}
