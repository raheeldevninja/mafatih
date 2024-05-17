import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/main_heading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FloorPlanAndVideos extends StatelessWidget {
  const FloorPlanAndVideos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MainHeading(heading: l10n.floorPlainAndVideoLabel),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  Images.seeVideosIcon,
                  width: 14,
                  height: 14,
                ),
                const SizedBox(width: 8),
                Text(
                  l10n.seeVideosBtnText,
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: AppColors.whiteColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
