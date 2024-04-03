import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:money_tracker/components/modal/modal_add_tracker.dart';
import 'package:money_tracker/components/payment/payment_list.dart';
import 'package:money_tracker/data/payment_data.dart';

class MoneyTrackerApp extends StatefulWidget {
  const MoneyTrackerApp({super.key});

  @override
  State<StatefulWidget> createState() => _MoneyTrackerAppState();
}

class _MoneyTrackerAppState extends State<MoneyTrackerApp> {
  @override
  void initState() {
    super.initState();
    PaymentData.init();
  }

  void _openAddPaymentOverlay() {
    // NOTE: do not use showBottomSheet() as it is cause error
    // ‘No Scaffold widget found’
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const ModalAddTracker(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.appbarTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            color: Colors.blue,
            onPressed: _openAddPaymentOverlay,
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(
            child: PaymentList(payments: PaymentData.data),
          ),
        ],
      ),
    );
  }
}
