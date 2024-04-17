import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/features/agencies/model/agent.dart';
import 'package:mafatih/features/agencies/report_ad_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


class AgentItem extends StatelessWidget {
  const AgentItem({
    super.key,
    required this.agent,
    required this.onTap,
  });

  final Agent agent;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              height: 70,
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
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    agent.agentName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Properties: ${agent.propertiesCount}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(width: 16),

            //whatsapp icon
            GestureDetector(
              onTap: () {

              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.whatsappBtnColor,
                ),
                child: SvgPicture.asset(
                  Images.whatsappIcon,
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primaryColor,
                ),
                child: SvgPicture.asset(
                  Images.phoneIcon,
                  width: 20,
                  height: 20,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: () {

              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primaryColor,
                ),
                child: SvgPicture.asset(
                  Images.mailIcon,
                  width: 20,
                  height: 20,
                  color: AppColors.whiteColor,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}