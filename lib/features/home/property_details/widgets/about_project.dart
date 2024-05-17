import 'package:flutter/material.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutProject extends StatelessWidget {
  const AboutProject({super.key});

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(l10n.aboutProjectLabel, style: context.textTheme.titleMedium,),
        const SizedBox(height: 16),

        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut.',
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
