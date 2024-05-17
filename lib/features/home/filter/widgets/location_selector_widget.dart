import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';

class LocationSelectorWidget extends StatelessWidget {
  const LocationSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Row(
      children: [

        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: l10n.yourAreSearchingLabel,
                  style: context.textTheme.bodySmall,
                ),
                TextSpan(
                  text: 'Riyadh',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 10),

        TextButton(
          onPressed: () {},
          child: Text(l10n.changeLocationBtnText,
              style: const TextStyle(
                fontSize: 14,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primaryColor,
              )),
        ),
      ],
    );
  }
}
