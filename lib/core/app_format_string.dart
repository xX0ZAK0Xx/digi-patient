import 'package:intl/intl.dart';

String? formatCurrency(dynamic amount) {
  if (amount == null) return null;
  try {
    final convertDouble = double.tryParse(amount.toString())??0;
    final formatter = NumberFormat.currency(locale: 'en_IN', symbol: '', decimalDigits: 0);
    return "৳${formatter.format(convertDouble)}";
  } catch (e) {
    return null;
  }
}


String formatRemainingTime(int minutes) {
  if (minutes < 60) {
    return '$minutes minute${minutes == 1 ? '' : 's'}';
  } else if (minutes < 1440) {
    final hours = minutes ~/ 60;
    return '$hours hour${hours == 1 ? '' : 's'}';
  } else {
    final days = minutes ~/ 1440;
    return '$days day${days == 1 ? '' : 's'}';
  }
}

String formatMonth(DateTime date) => _monthAbbr[date.month - 1];
String formatDay(DateTime date) => date.day.toString().padLeft(2, '0');
String formatWeekday(DateTime date) => _weekdayAbbr[date.weekday - 1];

const List<String> _monthAbbr = [
  'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
  'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
];

const List<String> _weekdayAbbr = [
  'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'
];
