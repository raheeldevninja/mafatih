import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property.dart';
import 'package:mafatih/features/home/property_details/widgets/feature_item.dart';
import 'package:mafatih/features/home/property_details/widgets/license_data.dart';


class PropertyDetailsScreen extends StatefulWidget {
  const PropertyDetailsScreen({required this.property, super.key});

  final Property property;

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  int current = 0;

  ///google map
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kRiyadh = CameraPosition(
    target: LatLng(24.7136, 46.6753),
    zoom: 18,
  );

  MapType _currentMapType = MapType.normal;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
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
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.backBtnColor,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: SvgPicture.asset(
                width: 24,
                height: 24,
                Images.favouriteIcon,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.backBtnColor,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: SvgPicture.asset(
                width: 24,
                height: 24,
                Images.shareIcon,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 300.0,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              current = index;
                            });
                          },
                        ),
                        items: widget.property.images.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return CachedNetworkImage(
                                imageUrl:
                                    'https://via.placeholder.com/1000x600',
                                fit: BoxFit.fill,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        const CupertinoActivityIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        widget.property.images.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => {},
                        child: Container(
                          width: 10.0,
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.whiteColor
                                      : AppColors.blackColor)
                                  .withOpacity(
                                      current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.property.propertyName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),

                  ///address and see videos row
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
                        widget.property.address,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      )),
                      SizedBox(
                        width: 130,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shadowColor: Colors.transparent,
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                Images.seeVideosIcon,
                                width: 14,
                                height: 14,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'See Videos',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  ///property area, beds, tv lounge, bath, age row
                  Row(
                    children: [
                      ///area
                      Expanded(
                        child: Container(
                          height: 60,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.greyColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                Images.areaIcon,
                                width: 24,
                                height: 24,
                                color: AppColors.blackColor,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.property.area,
                                      style: const TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Area',
                                      style: const TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      ///beds
                      Expanded(
                        child: Container(
                          height: 60,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.greyColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                Images.bedIcon,
                                width: 24,
                                height: 24,
                                color: AppColors.blackColor,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.property.beds,
                                      style: const TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Bed',
                                      style: const TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      ///bath
                      Expanded(
                        child: Container(
                          height: 60,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.greyColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                Images.bathIcon,
                                width: 24,
                                height: 24,
                                color: AppColors.blackColor,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.property.bath,
                                      style: const TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Bath',
                                      style: const TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      ///age
                      Expanded(
                        child: Container(
                          height: 60,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.greyColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                Images.ageIcon,
                                width: 24,
                                height: 24,
                                color: AppColors.blackColor,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '17+',
                                      style: const TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Age',
                                      style: const TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  ///price and compare button
                  Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ///price
                          Text(
                            widget.property.price,
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(width: 4),

                          Text(
                            'SAR',
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),

                      const Expanded(child: SizedBox()),

                      ///compare button
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              Images.compareIcon,
                              width: 20,
                              height: 20,
                              color: AppColors.blackColor,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Compare',
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  ///features container
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///coverage and area
                        Row(
                          children: [
                            Expanded(
                              child: FeatureItem(
                                icon: Images.wifiIcon,
                                title: 'Coverage',
                                value: '5G Fiber',
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: FeatureItem(
                                icon: Images.areaIcon,
                                title: 'Area',
                                value: '625',
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        ///street direction and street width
                        Row(
                          children: [
                            Expanded(
                              child: FeatureItem(
                                icon: Images.streetDirectionIcon,
                                title: 'Street Direction',
                                value: 'East',
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: FeatureItem(
                                icon: Images.streetWidthIcon,
                                title: 'Street Width',
                                value: '40 meter',
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        ///real estate age and electricity
                        Row(
                          children: [
                            Expanded(
                              child: FeatureItem(
                                icon: Images.buildingIcon,
                                title: 'Real estate age',
                                value: '10',
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: FeatureItem(
                                icon: Images.wireIcon,
                                title: 'Electricity',
                                value: '40 meter',
                              ),
                            ),
                          ],
                        ),

                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'More Features',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  ///license id, ad license number, licensor link row
                  Row(
                    children: [
                      LicenseData(
                        title: 'Listing ID',
                        value: Text(
                          '123456',
                          style: const TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      LicenseData(
                        title: 'Ad License Number',
                        value: Text(
                          '7200041810',
                          style: const TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      LicenseData(
                        title: 'Licensor Link',
                        value: InkWell(
                          onTap: () {},
                          child: Text(
                            'View now',
                            style: const TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.blackColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  ///about project
                  Text(
                    'About Project',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut.',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),

                  const SizedBox(height: 8),

                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Report Ad',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.redColor,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryColor,

                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  ///ad owner
                  Text(
                    'Ad Owner',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [

                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.greyColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          children: [

                            const SizedBox(height: 24),

                            Text(
                              'Adeen Real Estate',
                              style: const TextStyle(
                                color: AppColors.blackColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                            const SizedBox(height: 16),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text(
                                  'Agent:',
                                  style: const TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),

                                const SizedBox(width: 8),

                                Text(
                                  'Hasnain Ali',
                                  style: const TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text(
                                  'FAL License number:',
                                  style: const TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),

                                const SizedBox(width: 8),

                                Text(
                                  '72000418105180',
                                  style: const TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),

                      Positioned(
                        top: -30,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.greyColor, width: 1),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: CachedNetworkImage(
                              imageUrl: widget.property.ownerImage,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                              const CupertinoActivityIndicator(),
                              errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),

                  const SizedBox(height: 16),

                  ///location and near by
                  Text(
                    'Location & Nearby',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 16),

                  //google map widget in rounded corner container
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: SizedBox(
                      height: 200,
                      child: GoogleMap(
                        mapType: _currentMapType,
                        markers: {
                          const Marker(
                            markerId: MarkerId('1'),
                            position: LatLng(24.7136, 46.6753),
                          ),
                        },
                        initialCameraPosition: _kRiyadh,
                        zoomControlsEnabled: false,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [

            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.phoneBtnColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SvgPicture.asset(
                    Images.phoneIcon,
                    width: 24,
                    height: 24,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 8),

            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.whatsappBtnColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SvgPicture.asset(
                    Images.whatsappIcon,
                    width: 24,
                    height: 24,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 8),

            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.messageBtnColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SvgPicture.asset(
                    Images.messageIcon,
                    width: 24,
                    height: 24,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),

          ],
        ),

      ),
    );
  }
}
