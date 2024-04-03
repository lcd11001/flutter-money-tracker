import 'package:flutter/material.dart';
import 'package:money_tracker/models/payment_tracking.dart';

class PaymentDateTime extends StatelessWidget {
  const PaymentDateTime({
    super.key,
    required this.payment,
    this.showIcon = true,
  });

  final PaymentTracking payment;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (showIcon)
          Icon(
            payment.icon,
            size: 20.0,
            color: Colors.grey,
          ),
        if (showIcon)
          const SizedBox(
            width: 4.0,
          ),
        Text(
          payment.formattedDate,
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.grey,
          ),
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
