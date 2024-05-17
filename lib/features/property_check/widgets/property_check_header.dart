import 'package:flutter/material.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PropertyCheckHeader extends StatelessWidget {
  const PropertyCheckHeader({super.key});

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          children: [
            Image.asset(Images.ayeenImage),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                l10n.propertyCheckHeading,
                style: context.textTheme.titleMedium,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        Text(
          l10n.propertyCheckSubHeading,
          style: context.textTheme.titleMedium,
        ),

        const SizedBox(height: 20),

      ],
    );
  }
}
