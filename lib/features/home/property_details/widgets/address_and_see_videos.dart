import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddressAndSeeVideos extends StatelessWidget {
  const AddressAndSeeVideos({
    super.key,
    required this.property,
  });

  final PropertyModel property;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Row(
      children: [
        SvgPicture.asset(
          Images.selectedLocationIcon,
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            property.address,
            style: context.textTheme.bodyMedium,
          ),
        ),
        SizedBox(
          width: 130,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shadowColor: Colors.transparent,
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.black,
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
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
