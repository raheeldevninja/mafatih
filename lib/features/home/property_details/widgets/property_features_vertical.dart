import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/features/home/property_details/widgets/feature_item_vertical.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PropertyFeaturesVertical extends StatelessWidget {
  const PropertyFeaturesVertical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ///coverage and area
          FeatureItemVertical(
            icon: Images.wifiIcon,
            title: l10n.coverageLabel,
            value: '5G Fiber',
          ),
          const SizedBox(height: 8),


          FeatureItemVertical(
            icon: Images.areaIcon,
            title: l10n.areaLabel,
            value: '625',
          ),

          const SizedBox(height: 8),

          ///street direction and street width
          FeatureItemVertical(
            icon: Images.streetDirectionIcon,
            title: l10n.streetDirectionLabel,
            value: 'East',
          ),

          const SizedBox(height: 8),

          FeatureItemVertical(
            icon: Images.streetWidthIcon,
            title: l10n.streetWidthLabel,
            value: '40 meter',
          ),

          const SizedBox(height: 8),

          ///real estate age and electricity
          FeatureItemVertical(
            icon: Images.buildingIcon,
            title: l10n.realEstateAgeLabel,
            value: '10',
          ),
          const SizedBox(height: 8),
          FeatureItemVertical(
            icon: Images.wireIcon,
            title: l10n.electricityLabel,
            value: '40 meter',
          ),

          TextButton(
            onPressed: () {},
            child: Text(
              l10n.moreFeaturesBtnText,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}