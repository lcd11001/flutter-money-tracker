import 'package:flutter/material.dart';
import 'package:money_tracker/components/chart/chart_item.dart';

class ChartBar extends ChartItem {
  final double fill;
  final IconData icon;

  ChartBar({
    super.key,
    required this.fill,
    required this.icon,
  }) : super(
          builder: _buildBar,
          data: {
            'fill': fill,
            'icon': icon,
          },
        );

  static Widget _buildBar<T>(BuildContext context, T item) {
    final colorScheme = Theme.of(context).colorScheme;
    final value = item as Map<String, dynamic>;
    debugPrint('bar value: ${value.toString()}');

    final fill = value['fill'] as double;
    final icon = value['icon'] as IconData;
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: 20,
              child: FractionallySizedBox(
                heightFactor: fill / 500,
                alignment: Alignment.bottomCenter,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: colorScheme.primary,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Icon(
            icon,
            color: colorScheme.primary,
            size: 20,
          ),
        ],
      ),
    );
  }
}
