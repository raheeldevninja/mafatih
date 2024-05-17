import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/custom_app_bar.dart';
import 'package:mafatih/core/ui/empty_widget.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/ui/shimmers/list_shimmer.dart';
import 'package:mafatih/features/home/pages/explore/widgets/property_list_item.dart';
import 'package:mafatih/features/my_account/favourite_properties/view_model/favourite_provider.dart';
import 'package:provider/provider.dart';

class FavouritePropertiesScreen extends StatefulWidget {
  const FavouritePropertiesScreen({super.key});

  @override
  State<FavouritePropertiesScreen> createState() =>
      _FavouritePropertiesScreenState();
}

class _FavouritePropertiesScreenState extends State<FavouritePropertiesScreen> {
  //List<PropertyModel> favouriteProperties = [];

  @override
  void initState() {
    super.initState();

    //_initFavouriteProperties();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final favouriteProvider =
          Provider.of<FavouriteProvider>(context, listen: false);
      await favouriteProvider.getFavouriteProperties(context);
    });
  }

  /*
  _initFavouriteProperties() {

    favouriteProperties.add(
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
          Images.propertyImagePort,
          Images.propertyImagePort,
          Images.propertyImagePort,
        ],
      ),
    );

    favouriteProperties.add(
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
          Images.propertyImagePort,
          Images.propertyImagePort,
          Images.propertyImagePort,
        ],
      ),
    );

    favouriteProperties.add(
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
          Images.propertyImagePort,
          Images.propertyImagePort,
          Images.propertyImagePort,
        ],
      ),
    );

    favouriteProperties.add(
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
          Images.propertyImagePort,
          Images.propertyImagePort,
          Images.propertyImagePort,
        ],
      ),
    );

  }
  */

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final favouriteProvider = Provider.of<FavouriteProvider>(context);

    final favouriteProperties =
        favouriteProvider.favouritePropertiesResponse?.properties ?? [];

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: l10n.favouritePropertiesTitle,
        onTapBackButton: () {
          Navigator.pop(context);
        },
      ),
      body: favouriteProvider.isLoading
          ? const ListShimmer()
          : RefreshIndicator(
              onRefresh: () async {
                await favouriteProvider.getFavouriteProperties(context);
              },
              child: Column(
                children: [
                  const Header(
                    height: 20,
                    content: SizedBox(),
                  ),
                  Expanded(
                    child: favouriteProperties.isEmpty
                        ? EmptyWidget(message: l10n.noPropertiesLabel)
                        : ListView.builder(
                            shrinkWrap: true,
                            primary: true,
                            padding: const EdgeInsets.all(8),
                            itemCount: favouriteProperties.length,
                            itemBuilder: (context, index) {

                              if(favouriteProperties[index]
                                  .property == null) {
                                return const SizedBox();
                              }

                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 1000),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      onTap: () async {},
                                      child: PropertyListItem(
                                          property: favouriteProperties[index]
                                              .property!),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
    );
  }
}
