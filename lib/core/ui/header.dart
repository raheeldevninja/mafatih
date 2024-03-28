import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Header extends StatelessWidget {
  const Header({
    required this.subTitle,
    super.key});

  final String subTitle;

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Container(
      height: 50,
      decoration: const BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      alignment: Alignment.center,
      child: Text(subTitle),
    );
  }
}
