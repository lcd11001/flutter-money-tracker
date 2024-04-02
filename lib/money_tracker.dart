import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:money_tracker/components/payment_list.dart';
import 'package:money_tracker/data/payment_data.dart';

class MoneyTrackerApp extends StatefulWidget {
  const MoneyTrackerApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MoneyTrackerAppState();
  }
}

class _MoneyTrackerAppState extends State<MoneyTrackerApp> {
  @override
  void initState() {
    super.initState();
    PaymentData.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
