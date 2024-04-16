import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';

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
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}