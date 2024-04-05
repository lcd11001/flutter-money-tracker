import 'package:money_tracker/models/payment_category.dart';
import 'package:money_tracker/models/payment_tracking.dart';
import 'package:money_tracker/utils/utils.dart';

class PaymentBucket {
  final Category category;
  final List<PaymentTracking> payments;
  final DateTime date;

  PaymentBucket({
    required this.payments,
    required this.category,
    required this.date,
  });

  PaymentBucket.forCategory(List<PaymentTracking> allPayments, this.category)
      : payments = allPayments
            .where((payment) => payment.category == category)
            .toList(),
        date = DateTime.now();

  PaymentBucket.forDate(List<PaymentTracking> allPayments, DateTime filterDate)
      : payments = allPayments
            .where((payment) =>
                payment.date.year == filterDate.year &&
                payment.date.month == filterDate.month &&
                payment.date.day == filterDate.day)
            .toList(),
        category = Category.others,
        date = filterDate;

  double get totalAmount =>
      payments.fold(0, (sum, payment) => sum + payment.amount);

  String get formattedTotalAmount => amountFormatter.format(totalAmount);
  String get formattedDate => dateDayMonthFormatter.format(date);

  int get length => payments.length;
}
