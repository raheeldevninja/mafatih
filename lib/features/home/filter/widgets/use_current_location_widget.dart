import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UseCurrentLocationWidget extends StatelessWidget {
  const UseCurrentLocationWidget({
    required this.onPressed,
    super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            Images.currentLocationIcon,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 8),
          Text(
            l10n.useCurrentLocationLabel,
            style: context.textTheme.bodyMedium?.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
