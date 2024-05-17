import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/models/property_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProjectPriceRange extends StatelessWidget {

  const ProjectPriceRange({
    required this.property,
    super.key});

  final PropertyModel property;

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          property.price,
          style: context.textTheme.titleLarge?.copyWith(
            color: AppColors.primaryColor,
            fontSize: 22,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          'SAR',
          style: context.textTheme.titleLarge?.copyWith(
            color: AppColors.primaryColor,
            fontSize: 22,
          ),
        ),
        const SizedBox(width: 30),
        Text(
          l10n.toLabel,
          style: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.greyColor,
          ),
        ),
        const SizedBox(width: 30),
        Text(
          property.price,
          style: context.textTheme.titleLarge?.copyWith(
            color: AppColors.primaryColor,
            fontSize: 22,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          'SAR',
          style: context.textTheme.titleLarge?.copyWith(
            color: AppColors.primaryColor,
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}
