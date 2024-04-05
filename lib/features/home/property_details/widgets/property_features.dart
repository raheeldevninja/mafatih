import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/features/home/property_details/widgets/feature_item.dart';


class PropertyFeatures extends StatelessWidget {
  const PropertyFeatures({
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
          const Row(
            children: [
              Expanded(
                child: FeatureItem(
                  icon: Images.wifiIcon,
                  title: 'Coverage',
                  value: '5G Fiber',
                ),
              ),

              SizedBox(width: 8),

              Expanded(
                child: FeatureItem(
                  icon: Images.areaIcon,
                  title: 'Area',
                  value: '625',
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          ///street direction and street width
          const Row(
            children: [
              Expanded(
                child: FeatureItem(
                  icon: Images.streetDirectionIcon,
                  title: 'Street Direction',
                  value: 'East',
                ),
              ),

              SizedBox(width: 8),

              Expanded(
                child: FeatureItem(
                  icon: Images.streetWidthIcon,
                  title: 'Street Width',
                  value: '40 meter',
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          ///real estate age and electricity
          const Row(
            children: [
              Expanded(
                child: FeatureItem(
                  icon: Images.buildingIcon,
                  title: 'Real estate age',
                  value: '10',
                ),
              ),

              SizedBox(width: 8),

              Expanded(
                child: FeatureItem(
                  icon: Images.wireIcon,
                  title: 'Electricity',
                  value: '40 meter',
                ),
              ),
            ],
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