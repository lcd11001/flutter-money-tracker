import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/models/payment_tracking.dart';
import 'package:money_tracker/utils/utils.dart';

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
          showOnlyTime ? payment.formatTime : payment.formattedDate,
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
