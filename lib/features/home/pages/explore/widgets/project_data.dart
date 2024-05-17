import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';

class ProjectData extends StatelessWidget {
  const ProjectData({
    required this.title,
    required this.value,
    this.titleSize = 12,
    this.valueSize = 14,
    super.key,
  });

  final String title;
  final String value;


  final double? titleSize;
  final double? valueSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: valueSize,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            color: AppColors.greyColor,
            fontSize: titleSize,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
