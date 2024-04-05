import 'package:flutter/material.dart';
import 'package:money_tracker/components/chart/chart_item.dart';

class ChartBar extends ChartItem {
  final double fill;

  const ChartBar({
    super.key,
    required this.fill,
  }) : super(
          builder: _buildBar,
          data: fill,
        );

  static Widget _buildBar<T>(BuildContext context, T item) {
    final colorScheme = Theme.of(context).colorScheme;
    final value = item as double;
    debugPrint('bar value: $value');
    /*
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
            heightFactor: value,
            alignment: Alignment.bottomCenter,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: colorScheme.primary,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
              ),
            )),
      ),
    );
    */
    return Text(value.toString());
  }
}
