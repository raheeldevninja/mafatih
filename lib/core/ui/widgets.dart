import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';


class Widgets {
  static Widget labels(BuildContext context, String label, {bool isRequired = false}) {
    return Row(
      children: [
        Text(
          label,
          style: context.textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w600,
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
