import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property_model.dart';
import 'package:mafatih/core/ui/custom_app_bar.dart';
import 'package:mafatih/core/ui/empty_widget.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/ui/property_grid_item.dart';
import 'package:mafatih/core/ui/shimmers/property_grid_shimmer.dart';
import 'package:mafatih/features/home/property_details/property_details_screen.dart';
import 'package:mafatih/features/my_account/view_records/view_model/viewed_records_provider.dart';
import 'package:provider/provider.dart';

class ViewRecordsScreen extends StatefulWidget {
  const ViewRecordsScreen({super.key});

  @override
  State<ViewRecordsScreen> createState() => _ViewRecordsScreenState();
}

class _ViewRecordsScreenState extends State<ViewRecordsScreen> {
  List<PropertyModel> viewedRecords = [];

  @override
  void initState() {
    super.initState();

    //_initFavouriteProperties();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final viewedRecordsProvider =
          Provider.of<ViewedRecordsProvider>(context, listen: false);
      await viewedRecordsProvider.getViewedRecords(context);
    });
  }

  _initFavouriteProperties() {
    viewedRecords.add(
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

    viewedRecords.add(
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

    viewedRecords.add(
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

    viewedRecords.add(
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

    final viewedRecordsProvider = Provider.of<ViewedRecordsProvider>(context);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final viewedProperties =
        viewedRecordsProvider.viewedRecordsResponse?.properties ?? [];

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: l10n.viewRecordsTitle,
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
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Text(
              l10n.viewedDaysAgo,
              style: context.textTheme.titleMedium,
            ),
            //MainHeading(heading: l10n.viewedDaysAgo),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: viewedRecordsProvider.isLoading
                ? const PropertyGridShimmer()
                : viewedProperties.isEmpty
                    ? EmptyWidget(message: l10n.noViewedRecordsLabel)
                    : GridView.builder(
                        padding: const EdgeInsets.all(16),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.53,
                        ),
                        itemCount: viewedProperties.length,
                        itemBuilder: (context, index) {
                          return PropertyGridItem(
                            property: viewedProperties[index].property!,
                            onTap: () {
                              /*PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: PropertyDetailsScreen(property: viewedRecords[index]),
                      withNavBar: true,
                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    );*/
                            },
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
