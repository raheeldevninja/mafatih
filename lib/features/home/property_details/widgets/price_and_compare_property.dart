import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property_model.dart';
import 'package:mafatih/features/home/property_details/compare_properties_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PriceAndCompareProperty extends StatelessWidget {
  const PriceAndCompareProperty({
    required this.property,
    super.key});

  final PropertyModel property;

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Row(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            ///price
            Text(
              property.price,
              style: context.textTheme.titleLarge?.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              )
            ),

            const SizedBox(width: 4),

            Text(
              'SAR',
              style: context.textTheme.bodyLarge?.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),

        const Expanded(child: SizedBox()),

        ///compare button
        TextButton(
          onPressed: () {

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ComparePropertiesScreen(),
              ),
            );

          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                Images.compareIcon,
                width: 20,
                height: 20,
                color: AppColors.blackColor,
              ),

              const SizedBox(width: 8),

              Text(
                l10n.compareBtnText,
                style: context.textTheme.bodyMedium?.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.blackColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
