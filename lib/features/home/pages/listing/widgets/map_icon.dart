import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';

class MapIcon extends StatelessWidget {
  const MapIcon({
    required this.icon,
    required this.onTap,
    this.width = 50,
    this.height = 50,
    super.key,
  });

  final double width;
  final double height;
  final Widget icon;
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
        decoration: const BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: icon,
      ),
    );
  }
}