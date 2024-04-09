import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:money_tracker/components/app_version.dart';
import 'package:money_tracker/components/chart/chart_view.dart';
import 'package:money_tracker/components/chart/sf_chart_view.dart';
import 'package:money_tracker/components/modal/modal_add_tracker.dart';
import 'package:money_tracker/components/payment/payment_list.dart';
import 'package:money_tracker/data/payment_data.dart';
import 'package:money_tracker/main.dart';
import 'package:money_tracker/models/payment_bucket.dart';
import 'package:money_tracker/models/payment_category.dart';
import 'package:money_tracker/models/payment_tracking.dart';
import 'package:money_tracker/components/chart/chart_bar.dart';
import 'package:money_tracker/utils/utils.dart';

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
    final media = MediaQuery.of(context);
    debugPrint('Size: ${media.size.width} x ${media.size.height}');
    final screenWidth = media.size.width;

    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: buildAppBar(context),
      drawer: buildDrawer(context),
      body: Container(
        color: colorScheme.surface,
        width: double.infinity,
        child: screenWidth < 600
            ? Column(
                children: [
                  // buildChartViewByCategory(context),
                  buildChartViewByLastDays(context, days: 7),
                  Expanded(
                    child: PaymentList(
                      payments: PaymentData.data,
                      onRemovePayment: _removePayment,
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    // child: buildChartViewByCategory(context),
                    child: buildChartViewByLastDays(context, days: 7),
                  ),
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

  Widget buildChartViewByLastDays(BuildContext context, {int days = 7}) {
    final media = MediaQuery.of(context);
    final screenWidth = media.size.width;
    final screenHeight = media.size.height;
    double height = screenWidth < 600
        ? MediaQuery.of(context).size.height * 0.3
        : screenHeight;

    final loc = AppLocalizations.of(context)!;

    final now = DateTime.now();
    final lastDays = List.generate(
      days,
      (index) => now.subtract(Duration(days: index)),
    );

    List<PaymentBucket> buckets = List<PaymentBucket>.from(
      lastDays.map(
        (date) => PaymentBucket.forDate(PaymentData.data, date),
      ),
    );

    buckets.sort((a, b) => a.date.compareTo(b.date));

    final maxAmount = buckets.fold<double>(
      0,
      (max, bucket) => bucket.totalAmount > max ? bucket.totalAmount : max,
    );

    /*
    return ChartView(
      data: buckets,
      chartBuilder: (ctx, bucket) =>
          chartBuilderByLastDays(ctx, bucket, maxAmount),
      height: height,
      title: loc.chartTitleByLastDays(days),
    );
    */
    return SfChartView<PaymentBucket, String>(
      data: buckets,
      xValueMapper: xValueMapperByDate,
      yValueMapper: yValueMapper,
      height: height,
      title: loc.chartTitleByLastDays(days),
    );
  }

  String xValueMapperByDate(
      BuildContext context, PaymentBucket bucket, int index) {
    return bucket.formattedDate;
  }

  num yValueMapper(BuildContext context, PaymentBucket bucket, int index) {
    return bucket.totalAmount;
  }

  chartBuilderByLastDays(
    BuildContext ctx,
    PaymentBucket bucket,
    double maxAmount,
  ) {
    // debugPrint("builder bucket: ${bucket.category} - ${bucket.totalAmount}");

    return ChartBar(
      fill: maxAmount > 0 ? bucket.totalAmount / maxAmount : 0,
      // icon: Icons.calendar_today,
      title: bucket.formattedDate,
      value: bucket.formattedTotalAmount,
      width: 40,
    );
  }

  Widget buildChartViewByCategory(BuildContext context) {
    final media = MediaQuery.of(context);
    final screenWidth = media.size.width;
    final screenHeight = media.size.height;
    double height = screenWidth < 600
        ? MediaQuery.of(context).size.height * 0.3
        : screenHeight;

    final loc = AppLocalizations.of(context)!;

    List<PaymentBucket> buckets = List<PaymentBucket>.from(
      Category.values.map(
        (category) => PaymentBucket.forCategory(PaymentData.data, category),
      ),
    );

    final maxAmount = buckets.fold<double>(
      0,
      (max, bucket) => bucket.totalAmount > max ? bucket.totalAmount : max,
    );

    return ChartView(
      data: buckets,
      chartBuilder: (ctx, bucket) =>
          chartBuilderByCategory(ctx, bucket, maxAmount),
      height: height,
      title: loc.chartTitleByCategory,
    );
  }

  Widget chartBuilderByCategory(
    BuildContext context,
    PaymentBucket bucket,
    double maxAmount,
  ) {
    // debugPrint("builder bucket: ${bucket.category} - ${bucket.totalAmount}");

    final categoryName = bucket.category.toString().split('.').last;

    return ChartBar(
      fill: maxAmount > 0 ? bucket.totalAmount / maxAmount : 0,
      icon: categoryIcons[bucket.category]!,
      title: convertCamelCaseToTitle(categoryName),
      value: bucket.formattedTotalAmount,
      width: 40,
    );
  }
}
