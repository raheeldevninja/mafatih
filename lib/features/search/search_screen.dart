import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property_model.dart';
import 'package:mafatih/core/ui/app_text_field.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/property_grid_item.dart';
import 'package:mafatih/features/home/property_details/property_details_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();

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
          Images.propertyImagePng,
          Images.propertyImagePng,
          Images.propertyImagePng,
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
          Images.propertyImagePng,
          Images.propertyImagePng,
          Images.propertyImagePng,
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
          Images.propertyImagePng,
          Images.propertyImagePng,
          Images.propertyImagePng,
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
          Images.propertyImagePng,
          Images.propertyImagePng,
          Images.propertyImagePng,
        ],
      ),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

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
        title: AppTextField(
          controller: _searchController,
          hintText: l10n.searchHint,
          keyboardType: TextInputType.text,
          isSearch: true,
          validator: (value) {
            return null;
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(
            height: 20,
            content: SizedBox(),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(l10n.searchResultsLabel, style: context.textTheme.titleMedium),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.53,
                    ),
                    itemCount: properties.length,
                    itemBuilder: (context, index) {

                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 800),
                        child: ScaleAnimation(
                          child: FadeInAnimation(
                            child: Container()/*PropertyGridItem(
                              property: properties[index],
                              onTap: () {

                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: PropertyDetailsScreen(property: properties[index]),
                                  withNavBar: true,
                                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                );

                              },
                            ),*/
                          ),
                        ),
                      );

                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _searchController.dispose();
  }
}
