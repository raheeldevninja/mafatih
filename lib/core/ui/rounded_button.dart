import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/app/app_colors.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.text,
    required this.callback,
    this.backgroundColor = AppColors.primaryColor,
  });

  final String text;
  final VoidCallback callback;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        backgroundColor: backgroundColor,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),
      child: FittedBox(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
