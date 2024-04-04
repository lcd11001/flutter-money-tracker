import 'package:flutter/material.dart';
import 'package:money_tracker/components/payment/payment_item.dart';
import 'package:money_tracker/models/payment_tracking.dart';
import 'package:money_tracker/utils/utils.dart';

class PaymentList extends StatelessWidget {
  final List<PaymentTracking> payments;
  final Callback<String> onRemovePayment;

  const PaymentList({
    super.key,
    required this.payments,
    required this.onRemovePayment,
  });

  Widget buildListItem(BuildContext context, int index) {
    return Dismissible(
      key: ValueKey(payments[index].id),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          onRemovePayment(payments[index].id);
          // Utils.showSnackBar(context, 'Payment removed');
        }
      },
      child: PaymentItem(payment: payments[index]),
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
