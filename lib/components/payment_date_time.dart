import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:money_tracker/models/payment_tracking.dart';

class PaymentDateTime extends StatelessWidget {
  const PaymentDateTime({
    super.key,
    required this.payment,
    required this.localize,
  });

  final PaymentTracking payment;
  final AppLocalizations localize;

  String dateFormat(DateTime date) {
    return localize.paymentDate(date);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.calendar_today,
          size: 16.0,
          color: Colors.grey,
        ),
        Text(
          dateFormat(payment.date),
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
