import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';

class Widgets {
  static Widget labels(String label, {bool isRequired = false}) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        isRequired
            ? const Text(
          '*',
          style: TextStyle(color: AppColors.requiredColor),
        )
            : const SizedBox(),
      ],
    );
  }
}