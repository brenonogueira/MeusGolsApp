import 'package:intl/intl.dart';

class DatesUtils {
  static String formatDate(String date) {

    if (date.isEmpty) {
      DateTime dateNow = DateTime.now();
      DateFormat dateFormat = DateFormat('dd/MM/yyyy', 'pt_BR');
      return dateFormat.format(dateNow);
    }

    List<String> dateSplit = date.split('-');

    if (dateSplit.length != 3) {
      throw const FormatException('invalid date. Use dd-mm-aaaa.');
    }

    String year = dateSplit[0];
    String month = dateSplit[1];
    String day = dateSplit[2];

    DateTime dateTime = DateTime(int.parse(year), int.parse(month), int.parse(day));

    DateFormat dateFormat = DateFormat('dd/MM/yyyy', 'pt_BR');
    return dateFormat.format(dateTime);
  }
}