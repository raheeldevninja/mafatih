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
      body: Column(
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
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.greyColor.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [

                      //carousel slider

                      SizedBox(
                      width: 180,
                        child: Stack(
                          children: [
                            CarouselSlider(

                              options: CarouselOptions(height: 300.0,
                                viewportFraction: 0.95,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                },
                              ),
                              items: properties[index].images.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl: i,
                                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                                        const CupertinoActivityIndicator(),
                                        errorWidget: (context, url, error) => const Icon(Icons.error),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: properties[index].images.asMap().entries.map((entry) {
                                  return GestureDetector(
                                    onTap: () => {},
                                    child: Container(
                                      width: 10.0,
                                      height: 10.0,
                                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: (Theme.of(context).brightness == Brightness.dark
                                              ? Colors.white
                                              : Colors.black)
                                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                                    ),
                                  );
                                }).toList(),
                            ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 16),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(properties[index].propertyName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                          const SizedBox(height: 4),
                          Text(properties[index].price, style: const TextStyle(color: AppColors.primaryColor, fontSize: 16, fontWeight: FontWeight.w500),),
                          const SizedBox(height: 8),

                          Row(
                            children: [

                              SvgPicture.asset(
                                Images.areaIcon,
                                width: 16,
                                height: 16,
                              ),

                              const SizedBox(width: 4),

                              Text(properties[index].area, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),

                              const SizedBox(width: 16),

                              SvgPicture.asset(
                                Images.bedIcon,
                                width: 16,
                                height: 16,
                              ),

                              const SizedBox(width: 4),

                              Text(properties[index].beds, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),

                              const SizedBox(width: 16),

                              SvgPicture.asset(
                                Images.tvLoungeIcon,
                                width: 16,
                                height: 16,
                              ),

                              const SizedBox(width: 4),

                              Text(properties[index].tvLounge, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),

                              const SizedBox(width: 16),

                              SvgPicture.asset(
                                Images.bathIcon,
                                width: 16,
                                height: 16,
                              ),

                              const SizedBox(width: 4),

                              Text(properties[index].bath, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),


                            ],
                          ),

                          const SizedBox(height: 12),

                          Row(
                            children: [

                              SvgPicture.asset(
                                Images.selectedLocationIcon,
                                width: 24,
                                height: 24,
                              ),

                              const SizedBox(width: 4),

                              Text(properties[index].address, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                            ],
                          ),


                          Row(
                            children: [
                              SvgPicture.asset(
                                  Images.distanceIcon,
                                  width: 24,
                                  height: 24,
                                  color: AppColors.primaryColor
                              ),

                              const SizedBox(width: 4),

                              TextButton(
                                onPressed: () {},
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('View Distance', style: TextStyle(color: AppColors.primaryColor, decoration: TextDecoration.underline, decorationColor: AppColors.primaryColor),),
                                  ],
                                ),
                              ),

                            ],
                          ),


                          ///add owner
                          Row(
                            children: [

                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: AppColors.greyColor, width: 1),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: properties[index].ownerImage,
                                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                                    const CupertinoActivityIndicator(),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 8),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text('Ad Owner', style: TextStyle(color: AppColors.greyColor, fontSize: 12),),
                                  Text(properties[index].addOwner, style: TextStyle(color: AppColors.blackColor, fontSize: 16, fontWeight: FontWeight.w600),),

                                ],
                              ),

                            ],
                          ),




                        ],
                      ),

                    ],
                  ),
                );
              },
            ),
          ),


        ],
      ),
    );
  }
}
