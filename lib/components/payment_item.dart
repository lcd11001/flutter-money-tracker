import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:money_tracker/models/payment_tracking.dart';

class PaymentItem extends StatelessWidget {
  final PaymentTracking payment;

  const PaymentItem({
    super.key,
    required this.payment,
  });

  String currencyFormat(AppLocalizations loc, double amount) {
    return loc.paymentAmount(amount);
  }

  String dateFormat(AppLocalizations loc, DateTime date) {
    return loc.paymentDate(date, date);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 16.0,
        ),
        // minVerticalPadding: 10.0,
        // dense: true,
        // visualDensity: const VisualDensity(
        //   horizontal: 0,
        //   vertical: 4,
        // ),
        title: Text(
          payment.title,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Row(
          children: [
            Text(currencyFormat(loc, payment.amount)),
            const Spacer(),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 16.0,
                  color: Colors.grey,
                ),
                Text(
                  dateFormat(loc, payment.date),
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
