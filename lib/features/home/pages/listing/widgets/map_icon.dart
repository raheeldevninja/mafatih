import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';

class MapIcon extends StatelessWidget {
  const MapIcon({
    required this.icon,
    required this.onTap,
    this.width = 50,
    this.height = 50,
    this.backgroundColor = AppColors.secondaryColor,
    super.key,
  });

  final double width;
  final double height;
  final Widget icon;
  final Color? backgroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          //shadow
          boxShadow: [
            BoxShadow(
              color: AppColors.greyColor.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: icon,
      ),
    );
  }
}
