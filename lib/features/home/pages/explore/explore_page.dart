import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/models/property.dart';
import 'package:mafatih/core/ui/app_drawer.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/features/home/pages/explore/widgets/property_item.dart';


class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Property> properties = [];

  int _current = 0;


  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initPropertiesList();
    });

  }

  _initPropertiesList() {

    properties.add(
      Property(
        propertyName: 'Property Name',
        price: '44000 SAR',
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
        price: '44000 SAR',
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
        price: '44000 SAR',
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
        price: '44000 SAR',
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

    setState(() {

    });

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

            },
            icon: SvgPicture.asset(
              width: 20,
              height: 20,
              Images.searchIcon,
            ),
          ),

          IconButton(
            onPressed: () {

            },
            icon: SvgPicture.asset(
              width: 20,
              height: 20,
              Images.filterIcon,
            ),
          ),

          const SizedBox(width: 10,)

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            const Header(
                height: 20,
              content: SizedBox(),
            ),

            ///properties and see all button row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      const Text('Properties', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                      TextButton(onPressed: () {}, child: const Text('See all', style: TextStyle(color: AppColors.primaryColor, decoration: TextDecoration.underline, decorationColor: AppColors.primaryColor),),),

                    ],
                  ),

                ],
              ),
            ),

            ///properties listview
            SizedBox(
              height: 250,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                scrollDirection: Axis.horizontal,
                itemCount: properties.length,
                itemBuilder: (context, index) {
                  return PropertyItem(property: properties[index]);
                },
              ),
            ),

            ///daily rentals and see all button row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      const Text('Daily Rentals', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                      TextButton(onPressed: () {}, child: const Text('See all', style: TextStyle(color: AppColors.primaryColor, decoration: TextDecoration.underline, decorationColor: AppColors.primaryColor),),),

                    ],
                  ),

                ],
              ),
            ),

            ///properties listview
            SizedBox(
              height: 250,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                scrollDirection: Axis.horizontal,
                itemCount: properties.length,
                itemBuilder: (context, index) {
                  return PropertyItem(property: properties[index]);
                },
              ),
            ),

            const SizedBox(height: 20),

            //rounded corner banner image
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: 'https://via.placeholder.com/400x180',
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 60),

          ],
        ),
      ),
    );
  }
}



