import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property_model.dart';

class FavouritePropertyItem extends StatefulWidget {
  const FavouritePropertyItem({required this.property, super.key});

  final PropertyModel property;

  @override
  State<FavouritePropertyItem> createState() => _FavouritePropertyItemState();
}

class _FavouritePropertyItemState extends State<FavouritePropertyItem> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Container(
      height: 224,
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
            width: 120,
            child: Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 300.0,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                  items: widget.property.images.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            i,
                            fit: BoxFit.cover,
                            width: 120,
                            height: 300,
                          )
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
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.whiteColor
                                      : AppColors.blackColor)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
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
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4),
              Text(
                '${widget.property.price} SAR',
                style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),

              Row(
                children: [
                  SvgPicture.asset(
                    Images.areaIcon,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    widget.property.area,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(width: 6),
                  SvgPicture.asset(
                    Images.bedIcon,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    widget.property.beds,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(width: 6),
                  SvgPicture.asset(
                    Images.tvLoungeIcon,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    widget.property.tvLounge,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(width: 6),
                  SvgPicture.asset(
                    Images.bathIcon,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    widget.property.bath,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  SvgPicture.asset(
                    Images.selectedLocationIcon,
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    widget.property.address,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  SvgPicture.asset(Images.distanceIcon,
                      width: 24, height: 24, color: AppColors.primaryColor),
                  const SizedBox(width: 4),
                  TextButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'View Distance',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryColor),
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
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(Images.ownerImage)
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.adOwnerLabel,
                        style:
                            TextStyle(color: AppColors.greyColor, fontSize: 12),
                      ),

                      Text(
                        widget.property.addOwner,
                        style: const TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
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
