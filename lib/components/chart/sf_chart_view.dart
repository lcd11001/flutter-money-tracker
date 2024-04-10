import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SfChartView<T, D> extends StatefulWidget {
  final List<T> data;
  final D Function(BuildContext, T, int) xValueMapper;
  final num Function(BuildContext, T, int) yValueMapper;
  final double height;
  final String title;
  final double animationDuration;
  final AxisLabelIntersectAction labelIntersectAction;
  final int maximumLabels;

  const SfChartView({
    super.key,
    required this.data,
    required this.xValueMapper,
    required this.yValueMapper,
    required this.height,
    required this.title,
    this.animationDuration = 500,
    this.labelIntersectAction = AxisLabelIntersectAction.rotate45,
    this.maximumLabels = 5,
  });

  @override
  State<StatefulWidget> createState() => _SfChartViewState<T, D>();
}

class _SfChartViewState<T, D> extends State<SfChartView<T, D>> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final screenWidth = media.size.width;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      height: widget.height,
      margin: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: screenWidth < 600 ? 0.0 : 16.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            colorScheme.surface,
            colorScheme.surfaceVariant,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                title: AxisTitle(
                  text: widget.title,
                ),
                labelIntersectAction: widget.labelIntersectAction,
                maximumLabels: widget.maximumLabels,
              ),
              series: <CartesianSeries<T, D>>[
                ColumnSeries<T, D>(
                  dataSource: widget.data,
                  xValueMapper: (data, index) =>
                      widget.xValueMapper(context, data, index),
                  yValueMapper: (data, index) =>
                      widget.yValueMapper(context, data, index),
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    labelAlignment: ChartDataLabelAlignment.outer,
                  ),
                  pointColorMapper: (data, index) => colorScheme.primary,
                  animationDuration: widget.animationDuration,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
