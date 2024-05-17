import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';

class HeadingAndSeeAllButton extends StatelessWidget {
  const HeadingAndSeeAllButton({
    super.key,
    required this.heading,
    required this.sellAllOnPressed,
  });

  final String heading;
  final VoidCallback sellAllOnPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                heading,
                style: context.textTheme.titleMedium,
              ),
              TextButton(
                onPressed: sellAllOnPressed,
                child: Text(
                  l10n.seeAllBtnText,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
