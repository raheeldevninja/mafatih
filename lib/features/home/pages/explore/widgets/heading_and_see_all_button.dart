import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/app/app_colors.dart';


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
      padding:
      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                heading,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
              TextButton(
                onPressed: sellAllOnPressed,
                child: Text(
                  l10n.seeAllBtnText,
                  style: const TextStyle(
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

