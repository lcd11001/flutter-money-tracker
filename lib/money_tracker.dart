import 'package:flutter/material.dart';

class MoneyTrackerApp extends StatefulWidget {
  const MoneyTrackerApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MoneyTrackerAppState();
  }
}

class _MoneyTrackerAppState extends State<MoneyTrackerApp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('The chart'),
          Text('Tracker list'),
        ],
      ),
    );
  }
}
