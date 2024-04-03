import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';


class ProjectData extends StatelessWidget {
  const ProjectData({
    required this.title,
    required this.value,
    super.key,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(value, style: const TextStyle(color: AppColors.blackColor, fontSize: 14, fontWeight: FontWeight.w500),),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(color: AppColors.greyColor, fontSize: 12, fontWeight: FontWeight.w400),),

      ],
    );
  }
}