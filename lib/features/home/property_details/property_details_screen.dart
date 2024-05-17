import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property_model.dart';
import 'package:mafatih/core/ui/main_heading.dart';
import 'package:mafatih/features/agencies/report_ad_screen.dart';
import 'package:mafatih/features/home/property_details/widgets/about_project.dart';
import 'package:mafatih/features/home/property_details/widgets/ad_owner.dart';
import 'package:mafatih/features/home/property_details/widgets/address_and_see_videos.dart';
import 'package:mafatih/features/home/property_details/widgets/contact_options.dart';
import 'package:mafatih/features/home/property_details/widgets/feature_expansion_tiles.dart';
import 'package:mafatih/features/home/property_details/widgets/location_and_nearby.dart';
import 'package:mafatih/features/home/property_details/widgets/price_and_compare_property.dart';
import 'package:mafatih/features/home/property_details/widgets/property_attributes.dart';
import 'package:mafatih/features/home/property_details/widgets/property_features.dart';
import 'package:mafatih/features/home/property_details/widgets/property_images_slider.dart';
import 'package:mafatih/features/my_account/property_requests/widgets/property_request_data.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PropertyDetailsScreen extends StatefulWidget {
  const PropertyDetailsScreen({required this.property, super.key});

  final PropertyModel property;

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  int current = 0;

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

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
                  AddressAndSeeVideos(property: widget.property),
                  const SizedBox(height: 16),
                  PropertyAttributes(property: widget.property),
                  const SizedBox(height: 16),
                  PriceAndCompareProperty(property: widget.property),
                  const SizedBox(height: 16),
                  const PropertyFeatures(),
                  const SizedBox(height: 16),
                  const AboutProject(),
                  const SizedBox(height: 8),

                  TextButton(
                    onPressed: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const ReportAdScreen(),
                        withNavBar: false,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    child: Text(
                      l10n.reportAdBtnText,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.redColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.redColor,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),
                  const FeatureExpansionTiles(),
                  const SizedBox(height: 16),

                  Text(
                    l10n.scanOrPressTheCodeLabel,
                    style: context.textTheme.bodyMedium,
                  ),

                  //qr code
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: QrImageView(
                      data: '1234567890',
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  ),

                  const SizedBox(height: 16),

                  PropertyRequestData(
                    title: l10n.adLicenseNumberLabel,
                    value: '4359347548',
                  ),

                  PropertyRequestData(
                    title: l10n.adLicenseCreationDateLabel,
                    value: '31/02/2024',
                  ),

                  PropertyRequestData(
                    title: l10n.adLicenseExpirationDateLabel,
                    value: '31/02/2024',
                  ),

                  PropertyRequestData(
                    title: l10n.falLicenseNumberLabel,
                    value: '3454535',
                  ),

                  PropertyRequestData(
                    title: l10n.nationalCRNumberLabel,
                    value: '7003454535',
                  ),

                  PropertyRequestData(
                    title: l10n.titleDeedTypeLabel,
                    value: 'ABC',
                  ),

                  PropertyRequestData(
                    title: l10n.deedNumberLabel,
                    value: '1200343435',
                  ),
                  const SizedBox(height: 16),
                  AdOwner(property: widget.property),
                  const SizedBox(height: 16),

                  const LocationAndNearby(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ContactOptions(
        onPhonePressed: () {},
        onWhatsappPressed: () {},
        onMessagePressed: () {},
      ),
    );
  }
}
