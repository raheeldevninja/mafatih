import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property_model.dart';
import 'package:mafatih/core/ui/main_heading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdOwner extends StatelessWidget {
  const AdOwner({
    required this.property,
    super.key,
  });

  final PropertyModel property;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainHeading(heading: l10n.adOwnerLabel),
        const SizedBox(height: 16),
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(24),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.greyColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(24),
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    const Text(
                      'Adeen Real Estate',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          l10n.agentLabel,
                          style: context.textTheme.bodyMedium,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Hasnain Ali',
                          style: context.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          l10n.falLicenseNumberLabel,
                          style: context.textTheme.bodyMedium,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '72000418105180',
                          style: context.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -30,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(Images.ownerImage)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
