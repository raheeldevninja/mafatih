import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';

class GlowWidget extends StatelessWidget {
  const GlowWidget({required this.child,
    this.duration = 2000,
    super.key});

  final Widget child;
  final int duration;


  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      duration: Duration(milliseconds: duration),
      repeat: true,
      curve: Curves.easeOutQuad,
      glowColor: AppColors.primaryColor.withOpacity(0.02),
      glowRadiusFactor: 0.2,
      child: child,
    );
  }
}
