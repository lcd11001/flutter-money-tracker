import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:money_tracker/models/payment_tracking.dart';

class PaymentTitle extends StatelessWidget {
  const PaymentTitle({
    super.key,
    required this.payment,
    required this.localize,
  });

  final PaymentTracking payment;
  final AppLocalizations localize;

  @override
  Widget build(BuildContext context) {
    return Text(
      payment.title,
      style: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
