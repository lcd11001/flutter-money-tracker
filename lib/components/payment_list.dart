import 'package:flutter/material.dart';
import 'package:money_tracker/models/payment_tracking.dart';

class PaymentList extends StatelessWidget {
  final List<PaymentTracking> payments;

  const PaymentList({
    super.key,
    required this.payments,
  });

  Widget buildListItem(BuildContext context, int index) {
    final payment = payments[index];
    return ListTile(
      title: Text(payment.title),
      subtitle: Text(payment.amount.toString()),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: payments.length,
      itemBuilder: buildListItem,
    );
  }
}
