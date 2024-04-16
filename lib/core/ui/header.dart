import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';

class Header extends StatelessWidget {
  const Header({
    required this.content,
    this.height = 50,
    super.key,
  });

  final double? height;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      alignment: Alignment.center,
      child: content,
    );
  }
}
