import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/ui/main_heading.dart';
import 'package:mafatih/features/search/widgets/property_attribute.dart';


class ViewRecordsScreen extends StatefulWidget {
  const ViewRecordsScreen({super.key});

  @override
  State<ViewRecordsScreen> createState() => _ViewRecordsScreenState();
}

class _ViewRecordsScreenState extends State<ViewRecordsScreen> {

  List<Property> favouriteProperties = [];

  @override
  void initState() {
    super.initState();

    _initFavouriteProperties();
  }

  _initFavouriteProperties() {

    favouriteProperties.add(
      Property(
        propertyName: 'Property Name',
        price: '44000',
        area: '90m2',
        beds: '2',
        tvLounge: '1',
        bath: '1',
        address: 'ZA Heights Riyadh',
        addOwner: 'Adeen Real Estate',
        ownerImage: 'https://via.placeholder.com/30x30',
        images: [
          Images.propertyImagePort,
          Images.propertyImagePort,
          Images.propertyImagePort,
        ],
      ),
    );

    favouriteProperties.add(
      Property(
        propertyName: 'Property Name',
        price: '44000',
        area: '90m2',
        beds: '2',
        tvLounge: '1',
        bath: '1',
        address: 'ZA Heights Riyadh',
        addOwner: 'Adeen Real Estate',
        ownerImage: 'https://via.placeholder.com/30x30',
        images: [
          Images.propertyImagePort,
          Images.propertyImagePort,
          Images.propertyImagePort,
        ],
      ),
    );

    favouriteProperties.add(
      Property(
        propertyName: 'Property Name',
        price: '44000',
        area: '90m2',
        beds: '2',
        tvLounge: '1',
        bath: '1',
        address: 'ZA Heights Riyadh',
        addOwner: 'Adeen Real Estate',
        ownerImage: 'https://via.placeholder.com/30x30',
        images: [
          Images.propertyImagePort,
          Images.propertyImagePort,
          Images.propertyImagePort,
        ],
      ),
    );

    favouriteProperties.add(
      Property(
        propertyName: 'Property Name',
        price: '44000',
        area: '90m2',
        beds: '2',
        tvLounge: '1',
        bath: '1',
        address: 'ZA Heights Riyadh',
        addOwner: 'Adeen Real Estate',
        ownerImage: 'https://via.placeholder.com/30x30',
        images: [
          Images.propertyImagePort,
          Images.propertyImagePort,
          Images.propertyImagePort,
        ],
      ),
    );

  }


  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.secondaryColor,
        title: const Text('View Records'),
        centerTitle: true,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(
              height: 20,
              content: SizedBox(),
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: MainHeading(heading: 'Viewed Last 30 days'),
            ),

            GridView.builder(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.58,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              'Appartment for rent',
                              style: TextStyle(
                                color: AppColors.blackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
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
                            //price
                            Text(
                              '1000 SAR',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Images.selectedLocationIcon,
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'ZA Heights',
                                  style: const TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),

                          ],
                        ),
                      ),

                    ],
                  ),
                );
              },
            ),


          ],
        ),
      ),
    );
  }
}
