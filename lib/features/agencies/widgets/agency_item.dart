import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/apis.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/features/agencies/model/agency_data.dart';
import 'package:mafatih/features/my_account/property_requests/widgets/contact_count.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AgencyItem extends StatelessWidget {
  const AgencyItem({
    super.key,
    required this.agent,
    required this.onTap,
  });

  final AgencyData agent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //agent logo
            Row(
              children: [
                Container(
                  height: 80,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Image.network(
                    '${APIs.imageBaseURL}${agent.image!}',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    agent.companyFullName!,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(width: 10),
                SvgPicture.asset(Images.starIcon),
                const SizedBox(width: 8),
                SvgPicture.asset(Images.verifiedIcon),
              ],
            ),

            const SizedBox(height: 10),

            ///agent description
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: context.textTheme.bodyMedium,
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                SizedBox(
                  child: ContactCount(
                    width: 120,
                    height: 64,
                    title: l10n.saleLabel,
                    value: '5600',
                  ),
                ),
                const SizedBox(width: 10),
                ContactCount(
                  width: 120,
                  height: 64,
                  title: l10n.regionLabel,
                  value: '34',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
