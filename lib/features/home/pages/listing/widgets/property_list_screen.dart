import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property.dart';
import 'package:mafatih/core/ui/app_drawer.dart';
import 'package:mafatih/core/ui/bottom_sheets.dart';
import 'package:mafatih/features/home/pages/explore/widgets/property_list_item.dart';
import 'package:mafatih/features/home/property_details/property_details_screen.dart';
import 'package:mafatih/features/search/search_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'map_icon.dart';

class PropertyListScreen extends StatefulWidget {
  const PropertyListScreen({super.key});

  @override
  State<PropertyListScreen> createState() => _PropertyListScreenState();
}

class _PropertyListScreenState extends State<PropertyListScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Property> properties = [];

  @override
  void initState() {
    super.initState();

    _initPropertiesList();
  }

  _initPropertiesList() {
    properties.add(
      Property(
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
          'https://via.placeholder.com/400x600',
          'https://via.placeholder.com/400x600',
          'https://via.placeholder.com/400x600',
        ],
      ),
    );

    properties.add(
      Property(
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
          'https://via.placeholder.com/400x600',
          'https://via.placeholder.com/400x600',
          'https://via.placeholder.com/400x600',
        ],
      ),
    );

    properties.add(
      Property(
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
          'https://via.placeholder.com/400x600',
          'https://via.placeholder.com/400x600',
          'https://via.placeholder.com/400x600',
        ],
      ),
    );

    properties.add(
      Property(
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
          'https://via.placeholder.com/400x600',
          'https://via.placeholder.com/400x600',
          'https://via.placeholder.com/400x600',
        ],
      ),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final languageCode = AppLocalizations.of(context)!.localeName;
    final isEnglishLang = languageCode == 'en';

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.secondaryBgColor,
      drawer: const AppDrawer(),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.secondaryColor,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: SvgPicture.asset(
            Images.menuIcon,
            width: 24,
            height: 24,
          ),
        ),
        centerTitle: true,
        title: SvgPicture.asset(
          width: 50,
          height: 50,
          isEnglishLang ? Images.mafatihLogoEn : Images.mafatihLogoAr,
        ),
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
      body: Stack(
        children: [
          ListView.builder(
            itemCount: properties.length,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {

                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: PropertyDetailsScreen(property: properties[index]),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );

                },
                child: PropertyListItem(property: properties[index]),
              );
            },
          ),

          //map view button
          Positioned(
            bottom: 20,
            right: 20,
            child: MapIcon(
                onTap: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.map)),
          ),
        ],
      ),
    );
  }
}
