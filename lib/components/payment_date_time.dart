import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:money_tracker/models/payment_tracking.dart';

class PaymentDateTime extends StatelessWidget {
  const PaymentDateTime({
    super.key,
    required this.payment,
  });

  final PaymentTracking payment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          payment.icon,
          size: 16.0,
          color: Colors.grey,
        ),
        const SizedBox(width: 4.0),
        Text(
          payment.formattedDate,
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
