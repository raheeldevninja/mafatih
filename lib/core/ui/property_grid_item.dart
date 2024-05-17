import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/apis.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property.dart';
import 'package:mafatih/core/ui/property_attribute.dart';

class PropertyGridItem extends StatelessWidget {
  const PropertyGridItem({
    required this.property,
    required this.onTap,
    super.key,
  });

  final Property property;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {


    var address = '';

    if(property.region != null){
      //address += property.region!;
    }

    if(property.city != null) {
      address += ', ${property.city}';
    }

    if(property.neighborhood != null) {
      address += ', ${property.neighborhood}';
    }


    if(property.images!.isNotEmpty) {
      print('image: ${property.images?.first.imageName}');
    }


    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                color: AppColors.greyColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: property.images!.isNotEmpty ? CachedNetworkImage(
                  imageUrl: '${APIs.imageBaseURL}${property.images?.first.imageName ?? ''}',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const CupertinoActivityIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ) : const SizedBox(),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    property.adTitle ?? '',
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Flexible(
                        child: PropertyAttribute(
                          icon: Images.areaIcon,
                          value: property.areaUnit.toString(),
                        ),
                      ),

                      const SizedBox(width: 8),

                      Flexible(
                        child: PropertyAttribute(
                          icon: Images.bedIcon,
                          value: property.bedrooms.toString(),
                        ),
                      ),


                      /*const SizedBox(width: 4),

                      Expanded(
                        child: PropertyAttribute(
                          icon: Images.tvLoungeIcon,
                          value: property.tvLounge,
                        ),
                      ),*/

                      const SizedBox(width: 8),

                      Flexible(
                        child: PropertyAttribute(
                          icon: Images.bathIcon,
                          value: property.bathrooms.toString(),
                        ),
                      ),


                    ],
                  ),
                  const SizedBox(height: 8),
                  //price
                  Text(
                    '${property.price} SAR',
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        Images.selectedLocationIcon,
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          address.isEmpty ? 'NA' : address,
                          style: context.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}