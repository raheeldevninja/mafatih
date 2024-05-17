import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PropertyItem extends StatefulWidget {
  const PropertyItem({required this.property, super.key});

  final PropertyModel property;

  @override
  State<PropertyItem> createState() => _PropertyItemState();
}

class _PropertyItemState extends State<PropertyItem> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyColor.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ///carousel slider
          SizedBox(
            width: 160,
            child: Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 300.0,
                    viewportFraction: 0.98,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                  items: widget.property.images.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                i,
                                fit: BoxFit.cover,
                              )),
                        );
                      },
                    );
                  }).toList(),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        widget.property.images.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => {},
                        child: Container(
                          width: 10.0,
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.whiteColor
                                .withOpacity(_current == entry.key ? 1 : 0.0),
                            border: Border.all(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      //color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () {

                        setState(() {
                          widget.property.copyWith(isFavourite: !widget.property.isFavourite);
                        });

                      },
                      icon: Icon(
                        widget.property.isFavourite ? Icons.favorite : Icons.favorite_border,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.property.propertyName,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${widget.property.price} SAR',
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 8),

              Row(
                children: [
                  SvgPicture.asset(
                    Images.areaIcon,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    widget.property.area,
                    style: context.textTheme.bodySmall,
                  ),
                  const SizedBox(width: 16),
                  SvgPicture.asset(
                    Images.bedIcon,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    widget.property.beds,
                    style: context.textTheme.bodySmall,
                  ),
                  const SizedBox(width: 16),
                  SvgPicture.asset(
                    Images.tvLoungeIcon,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    widget.property.tvLounge,
                    style: context.textTheme.bodySmall,
                  ),
                  const SizedBox(width: 16),
                  SvgPicture.asset(
                    Images.bathIcon,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    widget.property.bath,
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  SvgPicture.asset(
                    Images.selectedLocationIcon,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.property.address,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  SvgPicture.asset(Images.distanceIcon,
                      width: 24, height: 24, color: AppColors.primaryColor),
                  const SizedBox(width: 2),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          l10n.viewDistanceBtnText,
                          style: context.textTheme.titleSmall?.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              ///add owner
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        Images.ownerImage,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.adOwnerLabel,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: AppColors.greyColor,
                        ),
                      ),
                      Text(
                        widget.property.addOwner,
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
