import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:money_tracker/components/app_version.dart';
import 'package:money_tracker/components/chart/chart_view.dart';

import 'package:money_tracker/components/modal/modal_add_tracker.dart';
import 'package:money_tracker/components/payment/payment_list.dart';
import 'package:money_tracker/data/payment_data.dart';
import 'package:money_tracker/main.dart';
import 'package:money_tracker/models/payment_bucket.dart';
import 'package:money_tracker/models/payment_category.dart';
import 'package:money_tracker/models/payment_tracking.dart';
import 'package:money_tracker/components/chart/chart_bar.dart';

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
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    // clear all previous snackbars
    ScaffoldMessenger.of(context).clearSnackBars();
    // show the new snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor: colorScheme.surfaceVariant,
        content: Text(
          loc.warningPaymentDeleted(removedItem.title),
          style: textTheme.labelLarge!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        action: SnackBarAction(
          label: loc.warningPaymentUndo,
          textColor: colorScheme.onTertiaryContainer,
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
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: buildAppBar(context),
      drawer: buildDrawer(context),
      body: Container(
        color: colorScheme.surface,
        width: double.infinity,
        child: Column(
          children: [
            buildChartViewByCategory(context),
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

  Drawer buildDrawer(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 150,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: colorScheme.surface,
              ),
              child: Text(
                loc.drawerTitle,
                style: textTheme.headlineSmall!.copyWith(
                  color: colorScheme.primary,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              loc.drawerLightTheme,
              style: textTheme.labelLarge!.copyWith(
                color: colorScheme.secondary,
              ),
            ),
            onTap: () {
              MainApp.changeThemeLight(context);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              loc.drawerDarkTheme,
              style: textTheme.labelLarge!.copyWith(
                color: colorScheme.secondary,
              ),
            ),
            onTap: () {
              MainApp.changeThemeDark(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
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
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(
            Icons.menu,
            size: 40,
          ),
          color: colorScheme.primary,
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
    );
  }

  buildChartViewByCategory(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.3;
    List<PaymentBucket> buckets = List<PaymentBucket>.from(
      Category.values.map(
        (category) => PaymentBucket.forCategory(PaymentData.data, category),
      ),
    );

    return ChartView(
        data: buckets,
        chartBuilder: chartBuilderByCategory,
        height: height,
        title: "The chart by category");
  }

  Widget chartBuilderByCategory(BuildContext context, PaymentBucket bucket) {
    debugPrint(
        "builder bucket: ${bucket.category} - totalAmount: ${bucket.totalAmount}");

    return ChartBar(
      fill: bucket.totalAmount,
      icon: categoryIcons[bucket.category]!,
    );
  }
}
