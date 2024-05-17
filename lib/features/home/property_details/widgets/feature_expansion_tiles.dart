import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FeatureExpansionTiles extends StatefulWidget {
  const FeatureExpansionTiles({super.key});

  @override
  State<FeatureExpansionTiles> createState() => _FeatureExpansionTilesState();
}

class _FeatureExpansionTilesState extends State<FeatureExpansionTiles> {
  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        ColoredBox(
          color: AppColors.primaryColor.withOpacity(0.1),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 8),
            shape: const RoundedRectangleBorder(
              side: BorderSide.none,
            ),
            title: Text(
              l10n.importantQuestionsLabel,
              style: context.textTheme.bodyMedium,
            ),
            children: [
              ColoredBox(
                color: AppColors.whiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.question1,
                        style: context.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        l10n.noAnswer,
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        l10n.question2,
                        style: context.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        l10n.noAnswer,
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            l10n.question3,
                            style: context.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        l10n.noAnswer,
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            l10n.question4,
                            style: context.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        l10n.noAnswer,
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              l10n.question5,
                              style: context.textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),



            ],
          ),
        ),

        const SizedBox(height: 8),

        ColoredBox(
          color: AppColors.primaryColor.withOpacity(0.1),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 8),
            shape: const RoundedRectangleBorder(
              side: BorderSide.none,
            ),
            title: Text(
              l10n.boundariesLengthLabel,
              style: context.textTheme.bodyMedium,
            ),
            children: [],
          ),
        ),

        const SizedBox(height: 8),

        ColoredBox(
          color: AppColors.primaryColor.withOpacity(0.1),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 8),
            shape: const RoundedRectangleBorder(
              side: BorderSide.none,
            ),
            title: Text(
              l10n.adLicenseInfoLabel,
              style: context.textTheme.bodyMedium,
            ),
            children: [],
          ),
        ),

      ],
    );
  }
}
