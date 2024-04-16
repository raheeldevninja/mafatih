import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/features/agencies/model/agency.dart';
import 'package:mafatih/features/my_account/property_requests/widgets/contact_count.dart';


class AgencyItem extends StatelessWidget {
  const AgencyItem({
    super.key,
    required this.agent,
    required this.onTap,
  });

  final Agency agent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
                  child: Image.asset(
                    agent.logo,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    agent.agentName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
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
              agent.description,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                SizedBox(
                  child: ContactCount(
                    width: 120,
                    height: 64,
                    title: 'Sale',
                    value: agent.saleCount.toString(),
                  ),
                ),
                const SizedBox(width: 10),
                ContactCount(
                  width: 120,
                  height: 64,
                  title: 'Rent',
                  value: agent.rentCount.toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
