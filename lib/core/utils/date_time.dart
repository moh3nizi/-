import 'package:intl/intl.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

//date format
class Formats {
  //price
  String toman(num price) {
    return NumberFormat.simpleCurrency(decimalDigits: 0, name: '')
        .format(price);
  }

  //date
  String shamsi(Jalali date) {
    return '${date.year}/${date.month}/${date.day}';
  }

  //date
  String shamsiTime(DateTime date) {
    return 'ساعت: ${DateFormat('kk:mm:a').format(date).substring(0, 5)}';
  }
}
