import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:money_tracker/components/payment/payment_item.dart';
import 'package:money_tracker/models/payment_bucket.dart';
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
    final media = MediaQuery.of(context);
    final screenWidth = media.size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final loc = AppLocalizations.of(context)!;

    if (payments.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(32.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: colorScheme.onSurfaceVariant,
              width: 2,
            ),
          ),
          gradient: LinearGradient(
            colors: [
              colorScheme.surface,
              colorScheme.surfaceVariant,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
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
    return Container(
      margin: EdgeInsets.only(
        right: screenWidth < 600 ? 0 : 16.0,
      ),
      child: StickyGroupedListView<PaymentTracking, DateTime>(
        elements: payments,
        order: StickyGroupedListOrder.ASC,
        stickyHeaderBackgroundColor: colorScheme.surface,
        // Group
        groupBy: (PaymentTracking element) => DateTime(
          element.date.year,
          element.date.month,
          element.date.day,
        ),
        groupComparator: (date1, date2) => date2.compareTo(date1),
        groupSeparatorBuilder: (element) =>
            buildGroupSeparator(context, element, payments),
        // Item
        itemBuilder: buildItem,
        itemComparator: (pay1, pay2) => pay1.date.compareTo(pay2.date),
      ),
    );
  }

  Widget buildGroupSeparator(
    BuildContext context,
    PaymentTracking element,
    List<PaymentTracking> payments,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      color: colorScheme.primary,
      child: Row(
        children: [
          Text(
            element.formattedShortDate,
            style: textTheme.headlineMedium!.copyWith(
              color: colorScheme.onPrimary,
            ),
          ),
          const Spacer(),
          Text(
            PaymentBucket.forDate(payments, element.date).formattedTotalAmount,
            style: textTheme.headlineSmall!.copyWith(
              color: colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(BuildContext context, PaymentTracking element) {
    return Dismissible(
      key: ValueKey(element.id),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          onRemovePayment(element.id);
        }
      },
      // restrict swipe direction
      direction: DismissDirection.endToStart,
      child: PaymentItem(
        payment: element,
        showOnlyTime: true,
      ),
    );
  }
}
