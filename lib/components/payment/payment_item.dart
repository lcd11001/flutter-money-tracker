import 'package:flutter/material.dart';
import 'package:money_tracker/models/payment_tracking.dart';

import 'payment_date_time.dart';
import 'payment_sub_title.dart';
import 'payment_title.dart';

class PaymentItem extends StatelessWidget {
  final PaymentTracking payment;
  final bool showOnlyTime;

  const PaymentItem({
    super.key,
    required this.payment,
    this.showOnlyTime = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // use Card to make the ListTile have a shadow
    return isDarkMode
        ? Card.outlined(
            margin: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 4.0,
            ),
            color: colorScheme.surface,
            child: buildItemContent(context),
          )
        : Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 4.0,
            ),
            color: colorScheme.surface,
            child: buildItemContent(context),
          );
  }

  ListTile buildItemContent(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      // minVerticalPadding: 10.0,
      // dense: true,
      // visualDensity: const VisualDensity(
      //   horizontal: 4,
      //   vertical: 4,
      // ),
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
            showIcon: false,
            showOnlyTime: showOnlyTime,
          )
        ],
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: colorScheme.secondary,
      ),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            payment.icon,
            size: 35,
            color: colorScheme.tertiary,
          ),
        ],
      ),
    );
  }
}
