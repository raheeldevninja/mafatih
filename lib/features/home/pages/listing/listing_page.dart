import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/AppTextField.dart';
import 'package:mafatih/core/ui/app_drawer.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/util/utils.dart';
import 'package:mafatih/features/home/pages/listing/choose_from_map_screen.dart';
import 'package:mafatih/features/home/pages/listing/widgets/main_list_item.dart';
import 'package:mafatih/features/home/pages/listing/widgets/map_icon.dart';
import 'package:location/location.dart';


class ListingPage extends StatefulWidget {
  const ListingPage({super.key});

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {


  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kRiyadh = CameraPosition(
    target: LatLng(24.7136, 46.6753),
    zoom: 18,
  );

  CameraPosition? _kUserCurrentLocation /*= CameraPosition(
      target: LatLng(24.7136, 46.6753),
      zoom: 18,
  )*/;

  bool _isDistanceBottomSheetVisible = false;

  //distance
  final _startLocationController = TextEditingController();
  final _endLocationController = TextEditingController();

  //search by location
  final _cityAndDistrictController = TextEditingController();

  Set<Marker> _markers = {};
  Location location = Location();

  MapType _currentMapType = MapType.normal;


  @override
  void initState() {
    super.initState();
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
              _showSearchByLocationBottomSheet();
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
      body: Stack(
        children: [

          ///main content
          GoogleMap(
            mapType: _currentMapType,
            initialCameraPosition: _kRiyadh,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),

          ///top row selected location and distance icon buttons
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  MapIcon(
                    width: 120,
                    height: 36,
                    onTap: () {},
                    icon: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        SvgPicture.asset(
                          Images.selectedLocationIcon,
                        ),

                        const SizedBox(width: 8),

                        const Flexible(child: Text('Riyadh', overflow: TextOverflow.ellipsis, maxLines: 1,),),

                      ],
                    ),
                  ),

                  MapIcon(
                    isSelected: _isDistanceBottomSheetVisible,
                    onTap: () {

                      setState(() {
                        _isDistanceBottomSheetVisible = !_isDistanceBottomSheetVisible;
                      });

                      _showDistanceBetweenTwoPointsBottomSheet();
                    },
                    icon: SvgPicture.asset(
                      width: 20,
                      height: 20,
                      Images.distanceIcon,
                      color: _isDistanceBottomSheetVisible ? AppColors.whiteColor : AppColors.blackColor,
                    ),
                  ),

                ],
              ),
            ),
          ),

          ///bottom row current location and search by location icon buttons
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  MapIcon(
                    onTap: () {
                      _goToRiyadh();
                    },
                    icon: SvgPicture.asset(
                    width: 20,
                    height: 20,
                    Images.currentLocationIcon,

                  ),
                  ),

                  MapIcon(
                    isSelected: _currentMapType == MapType.satellite,
                    onTap: () {

                      setState(() {
                        _currentMapType = _currentMapType == MapType.normal ? MapType.satellite : MapType.normal;
                      });

                    },
                    icon: SvgPicture.asset(
                    width: 20,
                    height: 20,
                    Images.searchByLocationIcon,
                    color: _currentMapType == MapType.normal ? AppColors.blackColor : AppColors.whiteColor,
                  ),
                  ),

                ],
              ),
            ),
          ),

          Header(content: SizedBox(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Utils.mainMenu.length,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                return MainListItem(mainMenu: Utils.mainMenu[index]);
              },
            ),
          ),
          ),

        ],
      ),
    );
  }

  Future<void> _goToRiyadh() async {

    await _getCurrentLocation();

    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kUserCurrentLocation!));

  }


  void _showDistanceBetweenTwoPointsBottomSheet() {

    final l10n = AppLocalizations.of(context)!;

    showModalBottomSheet(
      context: context,

      backgroundColor: AppColors.secondaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      builder: (context) {
        return Container(
          height: 350,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),

          child: Column(
            children: [

              Container(
                width: 100,
                height: 5,
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: AppColors.greyColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(l10n.distanceHeading, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),

                  InkWell(
                    onTap: () {

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ChooseFromMapScreen(),
                        ),
                      );

                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        SvgPicture.asset(
                          Images.chooseMapIcon,
                          width: 20,
                          height: 20,
                          color: AppColors.primaryColor,
                        ),

                        const SizedBox(width: 8),

                        Text(l10n.chooseFromMapBtnText, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.primaryColor, decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor,
                        ),),

                      ],
                    ),
                  ),


                ],
              ),

              const SizedBox(height: 40,),


              //start location
              Row(
                children: [
                  Expanded(child: AppTextField(controller: _startLocationController, keyboardType: TextInputType.text, hintText: l10n.yourLocationHint, validator: (value) {},)),
                  const SizedBox(width: 10),
                  SvgPicture.asset(
                    Images.currentLocationIcon,
                    width: 20,
                    height: 20,
                    color: AppColors.greyColor,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(child: AppTextField(controller: _endLocationController, keyboardType: TextInputType.text, hintText: '5 B Sector Near Alshablan Medical ', validator: (value) {},)),
                  const SizedBox(width: 10),
                  SvgPicture.asset(
                    Images.selectedLocationIcon,
                    width: 20,
                    height: 20,
                    color: AppColors.greyColor,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              SizedBox(width: double.maxFinite, height: 50, child: SimpleButton(text: l10n.findNowBtnText, callback: () {})),

            ],
          ),
        );
      },
    ).then((value) => setState(() {
      _isDistanceBottomSheetVisible = false;
    }));
  }

  void _showSearchByLocationBottomSheet() {

    final l10n = AppLocalizations.of(context)!;

    showModalBottomSheet(
      context: context,

      backgroundColor: AppColors.secondaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      builder: (context) {
        return Container(
          height: 350,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),

          child: Column(
            children: [

              Container(
                width: 100,
                height: 5,
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: AppColors.greyColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(l10n.searchByLocationHeading, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                ],
              ),

              const SizedBox(height: 20,),


              AppTextField(controller: _cityAndDistrictController, keyboardType: TextInputType.text, hintText: l10n.cityDistrictHint, validator: (value) {},),

              const SizedBox(height: 20),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  ///use current location button
                  InkWell(
                    onTap: () {

                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        SvgPicture.asset(
                          Images.currentLocationIcon,
                          width: 20,
                          height: 20,
                          color: AppColors.greyColor,
                        ),

                        const SizedBox(width: 4),

                        Text(l10n.userCurrentLocation, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: AppColors.blackColor, decoration: TextDecoration.underline,
                          decorationColor: AppColors.blackColor,
                        ),),

                      ],
                    ),
                  ),

                  ///choose from map button
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ChooseFromMapScreen(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        SvgPicture.asset(
                          Images.chooseMapIcon,
                          width: 20,
                          height: 20,
                          color: AppColors.primaryColor,
                        ),

                        const SizedBox(width: 4),

                        Text(l10n.chooseFromMapBtnText, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: AppColors.primaryColor, decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor,
                        ),),

                      ],
                    ),
                  ),


                ],
              ),

              const Spacer(),

              SizedBox(width: double.maxFinite, height: 50, child: SimpleButton(text: l10n.searchBtnText, callback: () {})),

              const SizedBox(height: 40),

            ],
          ),
        );
      },
    );
  }


  Future<void> _getCurrentLocation() async {
    LocationData currentLocation;
    try {
      currentLocation = await location.getLocation();

      setState(() {
        _kUserCurrentLocation = CameraPosition(
          target: LatLng(
            currentLocation.latitude!,
            currentLocation.longitude!,
          ),
          zoom: 18,
        );

        _markers.add(
          Marker(
            markerId: const MarkerId("current_location"),
            position: LatLng(currentLocation.latitude!, currentLocation.longitude!),
            infoWindow: InfoWindow(
              title: "Current Location",
              snippet: "Lat: ${currentLocation.latitude}, Long: ${currentLocation.longitude}",
            ),
          ),
        );

      });


    } catch (e) {
      currentLocation = LocationData.fromMap({
        'latitude': 0.0,
        'longitude': 0.0,
      });
    }
  }


  @override
  void dispose() {
    super.dispose();

    _startLocationController.dispose();
    _endLocationController.dispose();
  }

}


