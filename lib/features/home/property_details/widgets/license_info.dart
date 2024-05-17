import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/features/home/property_details/widgets/license_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LicenseInfo extends StatelessWidget {
  const LicenseInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Row(
      children: [

        LicenseData(
          title: l10n.listingIDLabel,
          value: Text(
            '123456',
            style: const TextStyle(
              color: AppColors.blackColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        const SizedBox(width: 16),

        LicenseData(
          title: l10n.adLicenseNumberLabel,
          value: Text(
            '7200041810',
            style: const TextStyle(
              color: AppColors.blackColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        const SizedBox(width: 16),

        LicenseData(
          title: l10n.licensorLinkLabel,
          value: InkWell(
            onTap: () {},
            child: Text(
              l10n.viewNowBtnText,
              style: const TextStyle(
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
