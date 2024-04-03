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
    return Text(
      payment.title,
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
