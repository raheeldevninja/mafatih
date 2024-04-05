import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/features/home/property_details/widgets/license_data.dart';

class LicenseInfo extends StatelessWidget {
  const LicenseInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        const LicenseData(
          title: 'Listing ID',
          value: Text(
            '123456',
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        const SizedBox(width: 16),

        const LicenseData(
          title: 'Ad License Number',
          value: Text(
            '7200041810',
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        const SizedBox(width: 16),

        LicenseData(
          title: 'Licensor Link',
          value: InkWell(
            onTap: () {},
            child: const Text(
              'View now',
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.blackColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
