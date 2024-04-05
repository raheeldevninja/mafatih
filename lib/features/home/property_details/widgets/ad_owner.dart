import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/models/property.dart';
import 'package:mafatih/core/ui/main_heading.dart';


class AdOwner extends StatelessWidget {
  const AdOwner({
    required this.property,
    super.key});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const MainHeading(heading: 'Ad Owner'),

        const SizedBox(height: 16),

        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.greyColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(24),
              ),
              alignment: Alignment.center,
              child: Column(
                children: [

                  const SizedBox(height: 24),

                  Text(
                    'Adeen Real Estate',
                    style: const TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text(
                        'Agent:',
                        style: const TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      const SizedBox(width: 8),

                      Text(
                        'Hasnain Ali',
                        style: const TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text(
                        'FAL License number:',
                        style: const TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      const SizedBox(width: 8),

                      Text(
                        '72000418105180',
                        style: const TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),

            Positioned(
              top: -30,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.greyColor, width: 1),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: property.ownerImage,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                    const CupertinoActivityIndicator(),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                  ),
                ),
              ),
            ),

          ],
        ),

      ],
    );
  }
}
