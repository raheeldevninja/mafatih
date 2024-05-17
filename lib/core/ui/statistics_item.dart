import 'package:flutter/material.dart';
import 'package:mafatih/core/extension/context.dart';

class StatisticsItem extends StatelessWidget {
  const StatisticsItem({
    required this.title,
    required this.value,
    super.key,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(title, style: context.textTheme.bodyMedium)),
        const SizedBox(width: 16),
        Text(value, style: context.textTheme.bodyMedium),
      ],
    );
  }
}
