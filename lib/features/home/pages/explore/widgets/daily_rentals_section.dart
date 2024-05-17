import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property_model.dart';
import 'package:mafatih/features/home/pages/explore/widgets/heading_and_see_all_button.dart';
import 'package:mafatih/features/home/pages/explore/widgets/property_item.dart';
import 'package:mafatih/features/home/pages/listing/widgets/property_list_screen.dart';
import 'package:mafatih/features/home/property_details/property_details_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class DailyRentalsSection extends StatefulWidget {
  const DailyRentalsSection({super.key});

  @override
  State<DailyRentalsSection> createState() => _DailyRentalsSectionState();
}

class _DailyRentalsSectionState extends State<DailyRentalsSection> {

  List<PropertyModel> properties = [];

  @override
  void initState() {
    super.initState();

    _initPropertiesList();
  }

  _initPropertiesList() {
    properties.add(
      PropertyModel(
        propertyName: 'Property Name',
        price: '44000',
        area: '90m2',
        beds: '2',
        tvLounge: '1',
        bath: '1',
        address: 'ZA Heights Riyadh',
        addOwner: 'Adeen Real Estate',
        ownerImage: 'https://via.placeholder.com/60x60',
        images: [
          Images.propertyImagePort,
          Images.propertyImagePort,
          Images.propertyImagePort,
        ],
      ),
    );

    properties.add(
      PropertyModel(
        propertyName: 'Property Name',
        price: '44000',
        area: '90m2',
        beds: '2',
        tvLounge: '1',
        bath: '1',
        address: 'ZA Heights Riyadh',
        addOwner: 'Adeen Real Estate',
        ownerImage: 'https://via.placeholder.com/40x40',
        images: [
          Images.propertyImagePort,
          Images.propertyImagePort,
          Images.propertyImagePort,
        ],
      ),
    );

    properties.add(
      PropertyModel(
        propertyName: 'Property Name',
        price: '44000',
        area: '90m2',
        beds: '2',
        tvLounge: '1',
        bath: '1',
        address: 'ZA Heights Riyadh',
        addOwner: 'Adeen Real Estate',
        ownerImage: 'https://via.placeholder.com/40x40',
        images: [
          Images.propertyImagePort,
          Images.propertyImagePort,
          Images.propertyImagePort,
        ],
      ),
    );

    properties.add(
      PropertyModel(
        propertyName: 'Property Name',
        price: '44000',
        area: '90m2',
        beds: '2',
        tvLounge: '1',
        bath: '1',
        address: 'ZA Heights Riyadh',
        addOwner: 'Adeen Real Estate',
        ownerImage: 'https://via.placeholder.com/40x40',
        images: [
          Images.propertyImagePort,
          Images.propertyImagePort,
          Images.propertyImagePort,
        ],
      ),
    );

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        ///daily rentals and see all button row
        HeadingAndSeeAllButton(
          heading: l10n.dailyRentalsLabel,
          sellAllOnPressed: () {

            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: const PropertyListScreen(),
              withNavBar: true,
              pageTransitionAnimation:
              PageTransitionAnimation.cupertino,
            );

          },
        ),

        ///daily rentals listview
        SizedBox(
          height: 260,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            scrollDirection: Axis.horizontal,
            itemCount: properties.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 1000),
                child: SlideAnimation(
                  horizontalOffset: 50.0,
                  child: InkWell(
                    onTap: () {
                      _showPropertyDialog(properties[index]);
                    },
                    child: PropertyItem(property: properties[index]),
                  ),
                ),
              );
            },
          ),
        ),


      ],
    );
  }

  void _showPropertyDialog(PropertyModel property) {
    int current = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => InkWell(
              onTap: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: PropertyDetailsScreen(property: property),
                  withNavBar: true,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyColor.withOpacity(0.4),
                      blurRadius: 10.0,
                      offset: const Offset(0.0, 10.0),
                    ),
                  ],
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Stack(
                                children: [
                                  CarouselSlider(
                                    options: CarouselOptions(
                                      height: 200.0,
                                      viewportFraction: 1,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          current = index;
                                        });
                                      },
                                    ),
                                    items: property.images.map((i) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return ClipRRect(
                                            borderRadius:
                                            const BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30),
                                            ),
                                            child: Image.asset(
                                              width: double.maxFinite,
                                              'assets/images/property_image.png',
                                              fit: BoxFit.fill,
                                            ),
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
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: property.images
                                          .asMap()
                                          .entries
                                          .map((entry) {
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
                                                  .withOpacity(
                                                  current == entry.key
                                                      ? 1
                                                      : 0.0),
                                              border: Border.all(
                                                color: AppColors.whiteColor,
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                property.propertyName,
                                                style: context
                                                    .textTheme.titleMedium,
                                              ),
                                              const SizedBox(height: 8),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    Images.areaIcon,
                                                    width: 20,
                                                    height: 20,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    property.area,
                                                    style: context
                                                        .textTheme.bodySmall,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  SvgPicture.asset(
                                                    Images.bedIcon,
                                                    width: 20,
                                                    height: 20,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    property.beds,
                                                    style: context
                                                        .textTheme.bodySmall,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  SvgPicture.asset(
                                                    Images.tvLoungeIcon,
                                                    width: 20,
                                                    height: 20,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    property.tvLounge,
                                                    style: context
                                                        .textTheme.bodySmall,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  SvgPicture.asset(
                                                    Images.bathIcon,
                                                    width: 20,
                                                    height: 20,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    property.bath,
                                                    style: context
                                                        .textTheme.bodySmall,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 50,
                                              child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(8),
                                                child: Image.asset(
                                                  Images.ownerImage,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            height: 50,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryColor,
                                                borderRadius:
                                                BorderRadius.circular(16),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                '3500 SAR',
                                                style: context
                                                    .textTheme.bodyMedium
                                                    ?.copyWith(
                                                  color: AppColors.whiteColor,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Expanded(
                                          child: TextButton(
                                              onPressed: () {},
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SvgPicture.asset(
                                                    Images.distanceIcon,
                                                    width: 20,
                                                    height: 20,
                                                    color:
                                                    AppColors.primaryColor,
                                                  ),
                                                  const SizedBox(width: 4),
                                                  const Expanded(
                                                      child: Text(
                                                        '14.1 km - 26 min',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                            FontWeight.w600,
                                                            color: AppColors
                                                                .primaryColor,
                                                            decoration:
                                                            TextDecoration
                                                                .underline,
                                                            decorationColor:
                                                            AppColors
                                                                .primaryColor),
                                                      )),
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),

                    //close button
                    Positioned(
                      right: 10,
                      top: 10,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor: AppColors.whiteColor,
                            child:
                            Icon(Icons.close, color: AppColors.blackColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}
