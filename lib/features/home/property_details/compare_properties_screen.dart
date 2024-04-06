import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/bottom_sheets.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/main_heading.dart';
import 'package:mafatih/features/home/property_details/widgets/about_project.dart';
import 'package:mafatih/features/home/property_details/widgets/location_and_nearby.dart';
import 'package:mafatih/features/home/property_details/widgets/property_features_vertical.dart';
import 'package:mafatih/features/search/search_screen.dart';
import 'package:mafatih/features/search/widgets/property_attribute.dart';


class ComparePropertiesScreen extends StatefulWidget {
  const ComparePropertiesScreen({super.key});

  @override
  State<ComparePropertiesScreen> createState() =>
      _ComparePropertiesScreenState();
}

class _ComparePropertiesScreenState extends State<ComparePropertiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.secondaryColor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.pop(context);
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
        centerTitle: true,
        title: const Text('Compare'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            icon: SvgPicture.asset(
              width: 20,
              height: 20,
              Images.searchIcon,
            ),
          ),
          IconButton(
            onPressed: () {
              BottomSheets.showFilterBottomSheet(context);
            },
            icon: SvgPicture.asset(
              width: 20,
              height: 20,
              Images.filterIcon,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          Header(
            height: 86,
            content: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Row(
                children: [
                  //rounded corner border container
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.greyColor.withOpacity(0.4),
                          width: 1,
                        ),
                      ),
                      child: const Text(
                        'ABC Property',
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: SvgPicture.asset(
                      'assets/icons/compare_property_icon.svg',
                    ),
                  ),

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.greyColor.withOpacity(0.4),
                          width: 1,
                        ),
                      ),
                      child: const Text(
                        'XYZ Property',
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              Images.propertyImagePng,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const MainHeading(heading: 'Appartment for rent'),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SvgPicture.asset(
                              Images.selectedLocationIcon,
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'ZA Heights, Riyadh',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: const PropertyAttribute(
                                icon: Images.areaIcon,
                                value: '90m2',
                              ),
                            ),

                            const SizedBox(width: 4),

                            Expanded(
                              child: PropertyAttribute(
                                icon: Images.bedIcon,
                                value: '1',
                              ),
                            ),


                            const SizedBox(width: 4),

                            Expanded(
                              child: PropertyAttribute(
                                icon: Images.tvLoungeIcon,
                                value: '2',
                              ),
                            ),

                            const SizedBox(width: 4),

                            Expanded(
                              child: PropertyAttribute(
                                icon: Images.bathIcon,
                                value: '1',
                              ),
                            ),


                          ],
                        ),
                        const SizedBox(height: 8),
                        const PropertyFeaturesVertical(),

                        const SizedBox(height: 8),

                        const Text('License ID', style: TextStyle(fontSize: 14, color: AppColors.blackColor)),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                          decoration: BoxDecoration(
                            color: AppColors.greyColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text('123456'),
                        ),
                        const SizedBox(height: 16),
                        const Text('Ad License Number', style: TextStyle(fontSize: 14, color: AppColors.blackColor)),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                          decoration: BoxDecoration(
                            color: AppColors.greyColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text('720008142002'),
                        ),

                        const SizedBox(height: 16),


                        ///about
                        const AboutProject(),
                        const SizedBox(height: 8),

                        const SizedBox(height: 8),
                        const LocationAndNearby(),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 150,
                    //color: AppColors.greyColor.withOpacity(0.4),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              Images.propertyImagePng,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const MainHeading(heading: 'Appartment for rent'),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SvgPicture.asset(
                              Images.selectedLocationIcon,
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'ZA Heights, Riyadh',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: const PropertyAttribute(
                                icon: Images.areaIcon,
                                value: '90m2',
                              ),
                            ),

                            const SizedBox(width: 4),

                            Expanded(
                              child: PropertyAttribute(
                                icon: Images.bedIcon,
                                value: '1',
                              ),
                            ),


                            const SizedBox(width: 4),

                            Expanded(
                              child: PropertyAttribute(
                                icon: Images.tvLoungeIcon,
                                value: '2',
                              ),
                            ),

                            const SizedBox(width: 4),

                            Expanded(
                              child: PropertyAttribute(
                                icon: Images.bathIcon,
                                value: '1',
                              ),
                            ),


                          ],
                        ),
                        const SizedBox(height: 8),
                        const PropertyFeaturesVertical(),
                        const SizedBox(height: 8),

                        const Text('License ID', style: TextStyle(fontSize: 14, color: AppColors.blackColor)),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                          decoration: BoxDecoration(
                            color: AppColors.greyColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text('123456'),
                        ),
                        const SizedBox(height: 16),
                        const Text('Ad License Number', style: TextStyle(fontSize: 14, color: AppColors.blackColor)),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                          decoration: BoxDecoration(
                            color: AppColors.greyColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text('720008142002'),
                        ),

                        const SizedBox(height: 16),

                        ///about
                        const AboutProject(),
                        const SizedBox(height: 8),
                        const LocationAndNearby(),
                        const SizedBox(height: 16),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
