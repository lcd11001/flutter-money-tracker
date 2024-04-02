import 'package:flutter/material.dart';
import 'package:money_tracker/models/payment_tracking.dart';

import 'payment_date_time.dart';
import 'payment_sub_title.dart';
import 'payment_title.dart';

class PaymentItem extends StatelessWidget {
  final PaymentTracking payment;

  const PaymentItem({
    super.key,
    required this.payment,
  });

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
        title: PaymentTitle(
          payment: payment,
        ),
        subtitle: Row(
          children: [
            PaymentSubTitle(
              payment: payment,
            ),
            const Spacer(),
            PaymentDateTime(
              payment: payment,
            )
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
