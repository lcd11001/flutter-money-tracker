import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:money_tracker/models/payment_tracking.dart';

class PaymentItem extends StatelessWidget {
  final PaymentTracking payment;

  const PaymentItem({
    super.key,
    required this.payment,
  });

  String currencyFormat(BuildContext context, double amount) {
    final loc = AppLocalizations.of(context)!;
    return loc.paymentAmount(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 16.0,
        ),
        // minVerticalPadding: 10.0,
        dense: true,
        visualDensity: const VisualDensity(
          horizontal: 0,
          vertical: 4,
        ),
        title: Text(payment.title),
        subtitle: Text(currencyFormat(context, payment.amount)),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
