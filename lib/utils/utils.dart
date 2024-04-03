import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final dateLongFormatter = DateFormat("dd MMM yyyy'\n'h:mm aaa");
final dateShortFormatter = DateFormat("dd MMM yyyy");
final amountFormatter = NumberFormat.simpleCurrency(decimalDigits: 2);

const uuid = Uuid();
