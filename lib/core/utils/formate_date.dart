import 'package:intl/intl.dart';

String formateDateBydMMYYYY(DateTime dateTime) {
  return DateFormat('d MMM, yyyy').format(dateTime);
}
