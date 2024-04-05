import 'package:flutter/material.dart';

class ChartItem<T> extends StatelessWidget {
  final Widget Function(BuildContext, T) builder;
  final T data;

  const ChartItem({
    super.key,
    required this.builder,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return builder(context, data);
  }
}
