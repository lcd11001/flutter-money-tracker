import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

typedef Callback<T> = void Function(T value);
typedef ReturnCallback<R, P> = R Function(P value);

final dateLongFormatter = DateFormat("dd MMM yyyy'\n'h:mm aaa");
final dateShortFormatter = DateFormat("dd MMM yyyy");
final amountFormatter = NumberFormat.simpleCurrency(decimalDigits: 2);

const uuid = Uuid();

String convertCamelCaseToTitle(String text) {
  final regExp = RegExp(r'(?<=[a-z])[A-Z]');
  String result = text.replaceAllMapped(regExp, (match) {
    return ' ${match.group(0)}';
  });

  return result[0].toUpperCase() + result.substring(1);
}
