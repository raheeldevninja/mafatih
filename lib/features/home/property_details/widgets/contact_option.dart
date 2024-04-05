import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';

class ContactOption extends StatelessWidget {
  const ContactOption({
    required this.backgroundColor,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  final Color backgroundColor;
  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: SvgPicture.asset(
          icon,
          width: 24,
          height: 24,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
