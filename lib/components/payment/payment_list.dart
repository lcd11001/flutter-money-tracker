import 'package:flutter/material.dart';
import 'package:money_tracker/components/payment/payment_item.dart';
import 'package:money_tracker/models/payment_tracking.dart';

class PaymentList extends StatelessWidget {
  final List<PaymentTracking> payments;

  const PaymentList({
    super.key,
    required this.payments,
  });

  Widget buildListItem(BuildContext context, int index) {
    return PaymentItem(payment: payments[index]);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: payments.length,
      itemBuilder: buildListItem,
    );
  }
}
