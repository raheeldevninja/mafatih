import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';

class AuthChoice extends StatelessWidget {
  const AuthChoice({
    required this.label,
    required this.actionButtonLabel,
    required this.onActionButtonPressed,
    super.key,
  });

  final String label;
  final String actionButtonLabel;
  final VoidCallback onActionButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: context.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: onActionButtonPressed,
          child: Text(
            actionButtonLabel,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryColor,
            ),
          ),),
      ],
    );
  }
}
