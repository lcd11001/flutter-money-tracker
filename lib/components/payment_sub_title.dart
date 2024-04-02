import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:money_tracker/models/payment_tracking.dart';

class PaymentSubTitle extends StatelessWidget {
  const PaymentSubTitle({
    super.key,
    required this.payment,
    required this.localize,
  });

  final PaymentTracking payment;
  final AppLocalizations localize;

  String currencyFormat(double amount) {
    return localize.paymentAmount(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      currencyFormat(payment.amount),
      style: const TextStyle(
        fontSize: 14.0,
        color: Colors.green,
      ),
    );
  }
}
