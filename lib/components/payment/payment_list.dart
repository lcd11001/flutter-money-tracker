import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:money_tracker/components/payment/payment_item.dart';
import 'package:money_tracker/models/payment_tracking.dart';
import 'package:money_tracker/utils/utils.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';

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
    final loc = AppLocalizations.of(context)!;

    if (payments.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Text(
            loc.warningNoPaymentData,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    /*
    return ListView.builder(
      itemCount: payments.length,
      itemBuilder: buildListItem,
    );
    */
    return StickyGroupedListView<PaymentTracking, DateTime>(
      elements: payments,
      order: StickyGroupedListOrder.ASC,
      // Group
      groupBy: (PaymentTracking element) => DateTime(
        element.date.year,
        element.date.month,
        element.date.day,
      ),
      groupComparator: (date1, date2) => date2.compareTo(date1),
      groupSeparatorBuilder: buildGroupSeparator,
      // Item
      itemBuilder: buildItem,
      itemComparator: (pay1, pay2) => pay1.date.compareTo(pay2.date),
    );
  }

  Widget buildGroupSeparator(PaymentTracking element) {
    return SizedBox(
      height: 70,
      child: Container(
        margin: const EdgeInsets.only(top: 20.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        color: Colors.grey[300],
        child: Row(
          children: [
            Text(
              element.formattedShortDate,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(BuildContext context, PaymentTracking element) {
    return Dismissible(
      key: ValueKey(element.id),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          onRemovePayment(element.id);
          // Utils.showSnackBar(context, 'Payment removed');
        }
      },
      child: PaymentItem(
        payment: element,
        showOnlyTime: true,
      ),
    );
  }
}
