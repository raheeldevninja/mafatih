import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/features/home/property_details/widgets/feature_item.dart';
import 'package:mafatih/features/home/property_details/widgets/feature_item_vertical.dart';


class PropertyFeaturesVertical extends StatelessWidget {
  const PropertyFeaturesVertical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            title: 'Coverage',
            value: '5G Fiber',
          ),
          const SizedBox(height: 8),


          FeatureItemVertical(
            icon: Images.areaIcon,
            title: 'Area',
            value: '625',
          ),

          const SizedBox(height: 8),

          ///street direction and street width
          FeatureItemVertical(
            icon: Images.streetDirectionIcon,
            title: 'Street Direction',
            value: 'East',
          ),

          const SizedBox(height: 8),

          FeatureItemVertical(
            icon: Images.streetWidthIcon,
            title: 'Street Width',
            value: '40 meter',
          ),

          const SizedBox(height: 8),

          ///real estate age and electricity
          FeatureItemVertical(
            icon: Images.buildingIcon,
            title: 'Real estate age',
            value: '10',
          ),
          const SizedBox(height: 8),
          FeatureItemVertical(
            icon: Images.wireIcon,
            title: 'Electricity',
            value: '40 meter',
          ),

          TextButton(
            onPressed: () {},
            child: const Text(
              'More Features',
              style: TextStyle(
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