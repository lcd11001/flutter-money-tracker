import 'package:flutter/material.dart';
import 'package:money_tracker/components/chart/chart_item.dart';

class ChartView<T> extends StatefulWidget {
  final List<T> data;
  final Widget Function(BuildContext, T) chartBuilder;
  final double height;
  final String title;

  const ChartView({
    super.key,
    required this.data,
    required this.chartBuilder,
    required this.height,
    required this.title,
  });

  @override
  State<StatefulWidget> createState() => _ChartViewState<T>();
}

class _ChartViewState<T> extends State<ChartView<T>> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final screenWidth = media.size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      height: widget.height,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.data.length,
              itemBuilder: (context, index) => ChartItem<T>(
                data: widget.data[index],
                builder: widget.chartBuilder,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            widget.title,
            style: textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
