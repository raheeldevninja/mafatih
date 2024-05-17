import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';

class TextTile extends StatelessWidget {
  const TextTile({
    required this.text,
    required this.isSelected,
    required this.onTap,
    super.key});

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.selectedColor
                  : Colors.grey[200],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              text,
              style: context.textTheme.bodySmall?.copyWith(
                color: isSelected
                    ? Colors.white
                    : AppColors.blackColor,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
