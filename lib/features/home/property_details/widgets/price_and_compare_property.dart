import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property.dart';
import 'package:mafatih/features/home/property_details/compare_properties_screen.dart';


class PriceAndCompareProperty extends StatelessWidget {
  const PriceAndCompareProperty({
    required this.property,
    super.key});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            ///price
            Text(
              property.price,
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(width: 4),

            const Text(
              'SAR',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
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

              const Text(
                'Compare',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.normal,
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
