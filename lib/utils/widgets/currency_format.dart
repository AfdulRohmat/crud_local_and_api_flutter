import 'package:intl/intl.dart';

class CurrencyFormat {
  static String convertToIdr(dynamic number, int decimalDigit, String country) {
    NumberFormat currencyFormatter = NumberFormat();

    if (country == "Indonesia") {
      currencyFormatter = NumberFormat.currency(
        locale: 'id',
        symbol: 'Rp ',
        decimalDigits: decimalDigit,
      );
    }
    if (country == "Vietnam") {
      currencyFormatter = NumberFormat.currency(
        locale: 'vie',
        symbol: 'VND ',
        decimalDigits: decimalDigit,
      );
    }
    return currencyFormatter.format(number);
  }
}
