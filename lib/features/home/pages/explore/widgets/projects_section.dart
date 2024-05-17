import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property_model.dart';
import 'package:mafatih/features/home/pages/explore/widgets/heading_and_see_all_button.dart';
import 'package:mafatih/features/home/pages/explore/widgets/project_data.dart';
import 'package:mafatih/features/home/pages/explore/widgets/project_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/features/home/projects/project_details_screen.dart';
import 'package:mafatih/features/home/projects/projects_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {

  List<PropertyModel> projects = [];

  @override
  void initState() {
    super.initState();
    _initProjectsList();
  }

  _initProjectsList() {
    projects.add(
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
          Images.projectImageLand,
          Images.projectImageLand,
          Images.projectImageLand,
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

        ///projects and see all button row
        HeadingAndSeeAllButton(
          heading: l10n.projectsLabel,
          sellAllOnPressed: () {

            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: const ProjectsScreen(),
              withNavBar: false,
              pageTransitionAnimation:
              PageTransitionAnimation.cupertino,
            );

          },
        ),

        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          scrollDirection: Axis.vertical,
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 1000),
              child: SlideAnimation(
                horizontalOffset: 50.0,
                child: ProjectItem(
                  property: projects[index],
                  onTap: () {
                    _showProjectDialog(projects[index]);
                  },
                ),
              ),
            );
          },
        ),

        const SizedBox(height: 40),

      ],
    );
  }

  void _showProjectDialog(PropertyModel property) {
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
                  screen: ProjectDetailsScreen(property: property),
                  withNavBar: true,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              child: Container(
                padding: const EdgeInsets.only(bottom: 10),
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
                                              fit: BoxFit.fitWidth,
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
                                                'Project Title',
                                                style: context.textTheme.titleMedium,
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    Images.selectedLocationIcon,
                                                    width: 16,
                                                    height: 16,
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Flexible(
                                                    child: Text(
                                                      'Riyadh',
                                                      style: context.textTheme.bodyMedium,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 12),
                                                  Flexible(
                                                    child: Text(
                                                      '4km, 10 min',
                                                      style: context.textTheme.bodyMedium?.copyWith(
                                                          color: AppColors.primaryColor
                                                      ),
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 60,
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
                                    const SizedBox(height: 16),
                                    const Row(
                                      children: [
                                        Expanded(
                                          child: ProjectData(
                                            title: 'No of Units',
                                            value: '20',
                                            titleSize: 10,
                                            valueSize: 12,
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: ProjectData(
                                            title: 'Units Type',
                                            value: 'Residential',
                                            titleSize: 10,
                                            valueSize: 12,
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: ProjectData(
                                            title: 'Area',
                                            value: '90m2 to 180m2',
                                            titleSize: 10,
                                            valueSize: 12,
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: ProjectData(
                                            title: 'Rooms',
                                            value: '2 to 5',
                                            titleSize: 10,
                                            valueSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          property.price,
                                          style: const TextStyle(
                                            color: AppColors.primaryColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        const Text(
                                          'SAR',
                                          style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(width: 16),
                                        const Flexible(
                                          child: Text(
                                            'to',
                                            style: TextStyle(
                                                color: AppColors.greyColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Text(
                                          property.price,
                                          style: const TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(width: 4),
                                        const Text(
                                          'SAR',
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
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
