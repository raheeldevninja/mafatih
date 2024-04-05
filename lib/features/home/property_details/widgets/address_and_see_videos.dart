import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property.dart';


class AddressAndSeeVideos extends StatelessWidget {
  const AddressAndSeeVideos({
    super.key,
    required this.property,
  });

  final Property property;

  @override
  Widget build(BuildContext context) {
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
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            )),
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
                const Text(
                  'See Videos',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.normal,
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