import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';

class LicenseData extends StatelessWidget {
  const LicenseData({
    required this.title,
    required this.value,
    super.key,
  });

  final String title;
  final Widget value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          title,
          style: const TextStyle(
            color: AppColors.blackColor,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),

        const SizedBox(height: 4),

        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.greyColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30),
          ),
          child: value,
        ),

      ],
    );
  }
}