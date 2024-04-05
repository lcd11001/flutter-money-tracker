import 'package:money_tracker/models/payment_category.dart';
import 'package:money_tracker/models/payment_tracking.dart';
import 'package:money_tracker/utils/utils.dart';

class PaymentBucket {
  final Category category;
  final List<PaymentTracking> payments;

  PaymentBucket({
    required this.payments,
    required this.category,
  });

  PaymentBucket.forCategory(List<PaymentTracking> allPayments, this.category)
      : payments = allPayments
            .where((payment) => payment.category == category)
            .toList();

  PaymentBucket.forDate(List<PaymentTracking> allPayments, DateTime date)
      : payments = allPayments
            .where((payment) =>
                payment.date.year == date.year &&
                payment.date.month == date.month &&
                payment.date.day == date.day)
            .toList(),
        category = Category.others;

  double get totalAmount =>
      payments.fold(0, (sum, payment) => sum + payment.amount);

  String get formattedTotalAmount => amountFormatter.format(totalAmount);

  int get length => payments.length;
}
