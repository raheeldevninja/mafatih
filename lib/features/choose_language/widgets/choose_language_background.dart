import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/images/images.dart';

class ChooseLanguageBackground extends StatelessWidget {
  const ChooseLanguageBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return  Positioned.fill(
      child: SvgPicture.asset(
        Images.splashBg,
        fit: BoxFit.fitWidth,
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}
