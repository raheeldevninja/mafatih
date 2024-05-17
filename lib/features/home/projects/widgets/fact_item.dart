import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/extension/context.dart';

class FactItem extends StatelessWidget {
  const FactItem({
    required this.title,
    required this.value,
    super.key,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.bodyMedium,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: context.textTheme.titleSmall,
        ),
      ],
    );
  }
}
