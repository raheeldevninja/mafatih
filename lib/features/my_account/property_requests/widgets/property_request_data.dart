import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';

class PropertyRequestData extends StatelessWidget {
  const PropertyRequestData({
    super.key,
    required this.title,
    required this.value,
    this.backgroundColor = AppColors.whiteColor,
  });

  final String title;
  final String value;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: context.textTheme.bodySmall,
            ),
            Text(
              value,
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}