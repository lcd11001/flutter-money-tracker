import 'package:flutter/material.dart';
import 'package:money_tracker/components/chart/chart_item.dart';

class ChartBar extends ChartItem {
  final double fill;
  final IconData? icon;
  final String? title;
  final String? value;
  final double width;

  ChartBar({
    super.key,
    required this.fill,
    this.icon,
    this.title,
    this.value,
    this.width = 20,
  }) : super(
          builder: (ctx, item) => _buildBar(ctx, item, width),
          data: {
            'fill': fill,
            'icon': icon,
            'title': title,
            'value': value,
          },
        );

  static Widget _buildBar<T>(BuildContext context, T item, double barWidth) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final obj = item as Map<String, dynamic>;
    debugPrint('bar item: ${obj.toString()}');

    final fill = obj['fill'] as double;
    final icon = obj['icon'] as IconData?;
    final title = obj['title'] as String?;
    final value = obj['value'] as String?;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: barWidth,
              child: Tooltip(
                // TODO: make this value above the bar
                message: value ?? '',
                triggerMode: TooltipTriggerMode.tap,
                child: FractionallySizedBox(
                  heightFactor: fill,
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
          ),
          if (icon != null)
            Icon(
              icon,
              color: colorScheme.tertiary,
              size: 20,
            ),
          if (title != null)
            Text(
              title,
              style: textTheme.labelSmall,
            ),
        ],
      ),
    );
  }
}
