import 'package:flutter/material.dart';
import 'package:money_tracker/models/payment_tracking.dart';

class PaymentSubTitle extends StatelessWidget {
  const PaymentSubTitle({
    super.key,
    required this.payment,
  });

  final PaymentTracking payment;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Text(
      payment.formattedAmount,
      style: TextStyle(
        fontSize: 18.0,
        color: colorScheme.secondary,
      ),
    );
  }
}
