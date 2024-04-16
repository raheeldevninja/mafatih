import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';


class ServicesItem extends StatelessWidget {
  const ServicesItem({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final String title;
  final String icon;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.greyColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [

            SvgPicture.asset(icon, width: 48, height: 48,),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
