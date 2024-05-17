import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/extension/context.dart';

class ResultsCountWidget extends StatelessWidget {
  const ResultsCountWidget({
    required this.value,
    super.key});

  final String value;

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('$value ${l10n.resultsFoundLabel}',
            style: context.textTheme.bodySmall
                ?.copyWith(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
