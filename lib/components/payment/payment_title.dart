import 'package:flutter/material.dart';
import 'package:money_tracker/models/payment_tracking.dart';

class PaymentTitle extends StatelessWidget {
  const PaymentTitle({
    super.key,
    required this.payment,
  });

  final PaymentTracking payment;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Text(
      payment.title,
      style: textTheme.titleLarge!.copyWith(
        color: colorScheme.secondary,
      ),
    );
  }
}
