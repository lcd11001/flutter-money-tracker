import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:money_tracker/components/app_version.dart';

import 'package:money_tracker/components/modal/modal_add_tracker.dart';
import 'package:money_tracker/components/payment/payment_list.dart';
import 'package:money_tracker/data/payment_data.dart';
import 'package:money_tracker/models/payment_tracking.dart';

class MoneyTrackerApp extends StatefulWidget {
  const MoneyTrackerApp({super.key});

  @override
  State<StatefulWidget> createState() => _MoneyTrackerAppState();
}

class _MoneyTrackerAppState extends State<MoneyTrackerApp> {
  int paymentsLength = 0;

  @override
  void initState() {
    super.initState();
    PaymentData.init();
    paymentsLength = PaymentData.data.length;
  }

  void _openAddPaymentOverlay() {
    final colorScheme = Theme.of(context).colorScheme;
    // NOTE: do not use showBottomSheet() as it is cause error
    // ‘No Scaffold widget found’
    showModalBottomSheet(
      context: context,
      // make the modal full screen
      isScrollControlled: true,
      backgroundColor: colorScheme.surface,
      builder: (ctx) => ModalAddTracker(
        onAddPayment: _addPayment,
      ),
    );
  }

  void _addPayment(PaymentTracking newPayment) {
    PaymentData.add(newPayment);

    setState(() {
      paymentsLength = PaymentData.data.length;
    });
  }

  void _removePayment(String id) {
    final removedItem = PaymentData.remove(id);

    setState(() {
      paymentsLength = PaymentData.data.length;
    });

    _showSnackBar(removedItem);
  }

  void _showSnackBar(PaymentTracking removedItem) {
    final loc = AppLocalizations.of(context)!;

    // clear all previous snackbars
    ScaffoldMessenger.of(context).clearSnackBars();
    // show the new snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(
          loc.warningPaymentDeleted(removedItem.title),
          style: const TextStyle(fontSize: 16.0),
        ),
        action: SnackBarAction(
          label: loc.warningPaymentUndo,
          onPressed: () {
            PaymentData.add(removedItem);

            setState(() {
              paymentsLength = PaymentData.data.length;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: colorScheme.surface,
        title: Text(
          loc.appbarTitle,
          style: textTheme.headlineLarge!.copyWith(
            color: colorScheme.primary,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              size: 40,
            ),
            color: colorScheme.tertiary,
            onPressed: _openAddPaymentOverlay,
          ),
        ],
      ),
      body: Container(
        color: colorScheme.surface,
        child: Column(
          children: [
            const Text('The chart'),
            Expanded(
              child: PaymentList(
                payments: PaymentData.data,
                onRemovePayment: _removePayment,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: AppVersion(
        textColor: colorScheme.onSurface,
      ),
    );
  }
}
