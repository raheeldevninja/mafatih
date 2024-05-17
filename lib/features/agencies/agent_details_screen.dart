import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property_model.dart';
import 'package:mafatih/core/ui/custom_app_bar.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/property_grid_item.dart';
import 'package:mafatih/features/agencies/model/agent.dart';
import 'package:mafatih/features/home/property_details/property_details_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AgentDetailsScreen extends StatefulWidget {
  const AgentDetailsScreen({
    required this.agent,
    super.key,
  });

  final Agent agent;

  @override
  State<AgentDetailsScreen> createState() => _AgentDetailsScreenState();
}

class _AgentDetailsScreenState extends State<AgentDetailsScreen> {

  List<PropertyModel> adProperties = [];

  @override
  void initState() {
    super.initState();

    _initAdProperties();
  }

  _initAdProperties() {

    adProperties.add(
      PropertyModel(
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
          Images.propertyImagePng,
          Images.propertyImagePng,
          Images.propertyImagePng,
        ],
      ),
    );

    adProperties.add(
      PropertyModel(
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
          Images.propertyImagePng,
          Images.propertyImagePng,
          Images.propertyImagePng,
        ],
      ),
    );

    adProperties.add(
      PropertyModel(
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
          Images.propertyImagePng,
          Images.propertyImagePng,
          Images.propertyImagePng,
        ],
      ),
    );

    adProperties.add(
      PropertyModel(
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
          Images.propertyImagePng,
          Images.propertyImagePng,
          Images.propertyImagePng,
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: 'Agent Details',
        onTapBackButton: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(
            height: 20,
            content: SizedBox(),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16.0),
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    Container(
                      height: 100,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Image.asset(
                        widget.agent.logo,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.agent.agentName,
                            style: context.textTheme.titleLarge,
                          ),

                          const SizedBox(height: 8),

                          Row(
                            children: [

                              //whatsapp icon
                              GestureDetector(
                                onTap: () {

                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.whatsappBtnColor,
                                  ),
                                  child: SvgPicture.asset(
                                    Images.whatsappIcon,
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.primaryColor,
                                  ),
                                  child: SvgPicture.asset(
                                    Images.phoneIcon,
                                    width: 20,
                                    height: 20,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              GestureDetector(
                                onTap: () {

                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.primaryColor,
                                  ),
                                  child: SvgPicture.asset(
                                    Images.mailIcon,
                                    width: 20,
                                    height: 20,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),

                            ],
                          ),


                        ],
                      ),
                    ),



                  ],
                ),

                const SizedBox(height: 24),

                Text(
                    'Ads ${l10n.propertiesLabel} ${widget.agent.propertiesCount}',
                    style: context.textTheme.bodyLarge
                ),

                const SizedBox(height: 10),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.53,
                  ),
                  itemCount: adProperties.length,
                  itemBuilder: (context, index) {
                    return Container();/*PropertyGridItem(
                      onTap: () {

                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: PropertyDetailsScreen(property: adProperties[index]),
                          withNavBar: true,
                          pageTransitionAnimation: PageTransitionAnimation.cupertino,
                        );

                      },
                      property: adProperties[index],
                    );*/
                  },
                ),



              ],
            ),
          ),
        ],
      ),
    );
  }
}
