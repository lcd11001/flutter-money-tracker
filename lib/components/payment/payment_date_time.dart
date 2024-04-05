import 'package:flutter/material.dart';
import 'package:money_tracker/models/payment_tracking.dart';

class PaymentDateTime extends StatelessWidget {
  const PaymentDateTime({
    super.key,
    required this.payment,
    this.showIcon = true,
    this.showOnlyTime = false,
  });

  final PaymentTracking payment;
  final bool showIcon;
  final bool showOnlyTime;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (showIcon)
          Icon(
            payment.icon,
            size: 20.0,
            color: colorScheme.onSurface,
          ),
        if (showIcon)
          const SizedBox(
            width: 4.0,
          ),
        Text(
          showOnlyTime ? payment.formatTime : payment.formattedDate,
          style: textTheme.labelSmall!.copyWith(
            color: colorScheme.secondary,
          ),
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
