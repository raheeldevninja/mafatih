import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property_model.dart';
import 'package:mafatih/core/ui/main_heading.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/features/home/projects/model_details_screen.dart';
import 'package:mafatih/features/home/projects/schedule_screen.dart';
import 'package:mafatih/features/home/projects/widgets/accommodation_details.dart';
import 'package:mafatih/features/home/projects/widgets/facts_section.dart';
import 'package:mafatih/features/home/projects/widgets/floor_plan_and_videos.dart';
import 'package:mafatih/features/home/projects/widgets/project_header.dart';
import 'package:mafatih/features/home/projects/widgets/project_images_slider.dart';
import 'package:mafatih/features/home/projects/widgets/project_price_range.dart';
import 'package:mafatih/features/home/projects/widgets/units_availability.dart';
import 'package:mafatih/features/home/property_details/widgets/property_features.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({required this.property, super.key});

  final PropertyModel property;

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  int current = 0;

  bool isModelOneSelected = false;
  bool isModelTwoSelected = false;
  bool isModelThreeSelected = false;

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
            ProjectImagesSlider(property: widget.property),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  ProjectHeader(property: widget.property),
                  const SizedBox(height: 16),
                  const AccommodationDetails(),
                  const SizedBox(height: 16),
                  ProjectPriceRange(property: widget.property),
                  const SizedBox(height: 16),
                  MainHeading(heading: l10n.factsLabel),
                  const FactsSection(),
                  const SizedBox(height: 16),
                  MainHeading(heading: l10n.featuresLabel),
                  const SizedBox(height: 16),
                  const PropertyFeatures(),
                  const SizedBox(height: 16),
                  const FactsSection(),
                  const SizedBox(height: 16),
                  MainHeading(heading: l10n.afterSaleFeaturesLabel),
                  const SizedBox(height: 16),
                  const PropertyFeatures(),
                  const SizedBox(height: 16),
                  const FloorPlanAndVideos(),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.greyColor.withOpacity(0.4),
                      ),
                    ),
                    child: Image.asset(Images.floorPlanImage),
                  ),
                  const SizedBox(height: 16),

                  MainHeading(heading: l10n.modelsLabel),
                  const SizedBox(height: 8),
                  Row(
                    children: [

                      Expanded(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {

                            setState(() {
                              isModelOneSelected = true;
                              isModelTwoSelected = false;
                              isModelThreeSelected = false;
                            });

                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: ModelDetailsScreen(property: widget.property),
                              withNavBar: true,
                              pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            );

                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                            decoration: BoxDecoration(
                              color: isModelOneSelected ? AppColors.selectedModelColor : AppColors.greyColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text('2 Bed, 2 Bath', style: context.textTheme.bodySmall?.copyWith(
                              color: isModelOneSelected ? AppColors.whiteColor : AppColors.blackColor,
                            ),),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            setState(() {
                              isModelOneSelected = false;
                              isModelTwoSelected = true;
                              isModelThreeSelected = false;
                            });

                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: ModelDetailsScreen(property: widget.property),
                              withNavBar: true,
                              pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            );

                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                            decoration: BoxDecoration(
                              color: isModelTwoSelected ? AppColors.selectedModelColor : AppColors.greyColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text('2 Bed, 2 Bath', style: context.textTheme.bodySmall?.copyWith(
                              color: isModelTwoSelected ? AppColors.whiteColor : AppColors.blackColor,
                            ),),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            setState(() {
                              isModelOneSelected = false;
                              isModelTwoSelected = false;
                              isModelThreeSelected = true;
                            });

                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: ModelDetailsScreen(property: widget.property),
                              withNavBar: true,
                              pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            );

                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                            decoration: BoxDecoration(
                              color: isModelThreeSelected ? AppColors.selectedModelColor : AppColors.greyColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text('2 Bed, 2 Bath', style: context.textTheme.bodySmall?.copyWith(
                              color: isModelThreeSelected ? AppColors.whiteColor : AppColors.blackColor,
                            ),),
                          ),
                        ),
                      ),

                    ],
                  ),

                  const SizedBox(height: 16),
                  const UnitsAvailability(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 56,
          child: SimpleButton(
            text: l10n.bookVisitBtnText,
            onPressed: () {

              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: const ScheduleScreen(),
                withNavBar: true,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );

            },
          ),
        ),
      ),
    );
  }
}
