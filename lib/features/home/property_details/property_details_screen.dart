import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property.dart';
import 'package:mafatih/core/ui/main_heading.dart';
import 'package:mafatih/features/agencies/report_ad_screen.dart';
import 'package:mafatih/features/home/property_details/widgets/about_project.dart';
import 'package:mafatih/features/home/property_details/widgets/ad_owner.dart';
import 'package:mafatih/features/home/property_details/widgets/address_and_see_videos.dart';
import 'package:mafatih/features/home/property_details/widgets/contact_options.dart';
import 'package:mafatih/features/home/property_details/widgets/license_info.dart';
import 'package:mafatih/features/home/property_details/widgets/location_and_nearby.dart';
import 'package:mafatih/features/home/property_details/widgets/price_and_compare_property.dart';
import 'package:mafatih/features/home/property_details/widgets/property_attributes.dart';
import 'package:mafatih/features/home/property_details/widgets/property_features.dart';
import 'package:mafatih/features/home/property_details/widgets/property_images_slider.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


class PropertyDetailsScreen extends StatefulWidget {
  const PropertyDetailsScreen({required this.property, super.key});

  final Property property;

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.backBtnColor,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child:
                  const Icon(Icons.arrow_back, color: AppColors.secondaryColor),
            ),
          ),
        ),
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.backBtnColor,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: SvgPicture.asset(
                width: 24,
                height: 24,
                Images.favouriteIcon,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.backBtnColor,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: SvgPicture.asset(
                width: 24,
                height: 24,
                Images.shareIcon,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PropertyImagesSlider(property: widget.property),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainHeading(heading: widget.property.propertyName),

                  const SizedBox(height: 16),

                  ///address and see videos row
                  AddressAndSeeVideos(property: widget.property),

                  const SizedBox(height: 16),

                  ///property area, beds, tv lounge, bath, age row
                  PropertyAttributes(property: widget.property),

                  const SizedBox(height: 16),

                  ///price and compare button
                  PriceAndCompareProperty(property: widget.property),

                  const SizedBox(height: 16),

                  const PropertyFeatures(),

                  const SizedBox(height: 16),

                  ///license id, ad license number, licensor link widget
                  const LicenseInfo(),

                  const SizedBox(height: 16),

                  const AboutProject(),

                  const SizedBox(height: 8),

                  TextButton(
                    onPressed: () {

                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const ReportAdScreen(),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );

                    },
                    child: const Text(
                      'Report Ad',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.redColor,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryColor,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  AdOwner(property: widget.property),

                  const SizedBox(height: 16),

                  const LocationAndNearby(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const ContactOptions(),
    );
  }
}
