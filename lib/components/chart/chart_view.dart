import 'package:flutter/material.dart';

class ChartView<T> extends StatefulWidget {
  final List<T> data;
  final Widget Function(BuildContext, T) chartBuilder;

  const ChartView({
    super.key,
    required this.data,
    required this.chartBuilder,
  });

  @override
  State<StatefulWidget> createState() => _ChartViewState<T>();
}

class _ChartViewState<T> extends State<ChartView<T>> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.data.length,
      itemBuilder: (context, index) =>
          widget.chartBuilder(context, widget.data[index]),
    );
  }
}
