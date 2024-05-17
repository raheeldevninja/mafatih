import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/app_drawer.dart';
import 'package:mafatih/core/ui/bottom_sheets.dart';
import 'package:mafatih/core/ui/dialgos.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/shimmers/map_shimmer.dart';
import 'package:mafatih/core/util/utils.dart';
import 'package:mafatih/features/home/pages/listing/models/marker_data.dart';
import 'package:mafatih/features/home/pages/listing/models/najran.dart';
import 'package:mafatih/features/home/pages/listing/models/saudi_boundary.dart';
import 'package:mafatih/features/home/pages/listing/widgets/main_list_item.dart';
import 'package:mafatih/features/home/pages/listing/widgets/map_icon.dart';
import 'package:location/location.dart';
import 'dart:ui' as ui;

import 'package:widget_to_marker/widget_to_marker.dart';

import 'models/riyadh.dart';

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
    zoom: 5,
  );

  CameraPosition? _kUserCurrentLocation;

  bool _isDistanceBottomSheetVisible = false;
  bool _isStatisticsDialogVisible = false;

  Set<Marker> _markers = {};
  Location location = Location();

  MapType _currentMapType = MapType.normal;

  List<MarkerData> _markerData = [];

  final Set<Polyline> _polyline = {};

  //List< Polygon > polygon = [];

  Set<Polygon> polygon = {};

  List<LatLng> saudiBoundaryPoints = [];

  List<LatLng> point = [];
  List<LatLng> point2 = [];



  List _features = [];

  @override
  void initState() {
    super.initState();


    _goToUserCurrentLocation();

    _initMarkersData();
    _addMarkers();



    /*addPoints();
    List<LatLng> allPoints = getPoints();

    List< Polygon > addPolygon = [
      Polygon(
        polygonId: PolygonId( 'Riyadh' ),
        points: point,
        consumeTapEvents: true,
        strokeColor: Colors.blue,
        strokeWidth: 2,
        fillColor: Colors.transparent,
      ),
      Polygon(
        polygonId: PolygonId( 'Najran' ),
        points: point2,
        consumeTapEvents: true,
        strokeColor: Colors.blue,
        strokeWidth: 2,
        fillColor: Colors.transparent,
      ),

    ];
    polygon.addAll( addPolygon );*/

    _initializeAllPoints();

  }

  _initMarkersData() {

    _markerData.add(
      MarkerData(title: '95 K', lat: 31.51142441468719, lng: 74.34592061534424),
    );

    _markerData.add(
      MarkerData(title: '80 K', lat: 31.510253627395944, lng: 74.35210042491472),
    );

    _markerData.add(
      MarkerData(title: '65 K', lat: 31.510443627395944, lng: 74.35212042491472, featuredIcon: Images.featureWhiteIcon),
    );

    _markerData.add(
      MarkerData(title: '60 K', lat: 31.510563627395944, lng: 74.35223042491472, featuredIcon: Images.featureWhiteIcon),
    );

    _markerData.add(
      MarkerData(title: '90 K', lat: 31.520563627395944, lng: 74.31223042491472, featuredIcon: Images.favWhiteIcon),
    );

  }

  _addMarkers() async {

    //_markers.clear();
    for(int i=0; i<_markerData.length; i++) {

      final marker = Marker(
        markerId: MarkerId(_markerData[i].title),
        position: LatLng(_markerData[i].lat, _markerData[i].lng),
        consumeTapEvents: true,
        icon: await CustomMarker(
          text: _markerData[i].title,
          featureIcon: _markerData[i].featuredIcon,
          favouriteIcon: _markerData[i].favouriteIcon,
          isViewed: _markerData[i].isViewed,
        ).toBitmapDescriptor(
            logicalSize: const Size(500, 200), imageSize: const Size(500, 200)),
        onTap: () {
          print('Marker tapped: ${_markerData[i].title}');

          setState(() {
            _markerData[i] = _markerData[i].copyWith(isViewed: true);
          });

          print('Marker tapped: ${_markerData[i].isViewed}');

        },
      );

      setState(() {
        _markers.add(marker);
      });
    }

    setState(() {
    });

  }

  void addPoints()
  {
    for( var i=0 ; i < Riyadh.riyadhPoints.length ; i++ )
    {
      var ltlng = LatLng( Riyadh.riyadhPoints[ i ][ 1 ], Riyadh.riyadhPoints[ i ][ 0 ] );
      point.add( ltlng );
    }

    //piont2

    for( var i=0 ; i < Najran.najranCity.length ; i++ )
    {
      var ltlng = LatLng( Najran.najranCity[ i ][ 1 ], Najran.najranCity[ i ][ 0 ] );
      point2.add( ltlng );
    }

  }

  addSaudiBoundary() {

    for( var i=0 ; i < SaudiBoundary.saudiBoundary.length ; i++ )
    {
      for( var j=0 ; j < SaudiBoundary.saudiBoundary[ i ].length ; j++ )
      {
        var ltlng = LatLng( SaudiBoundary.saudiBoundary[ i ][j][ 1 ], SaudiBoundary.saudiBoundary[ i ][j][ 0 ] );
        saudiBoundaryPoints.add( ltlng );
      }
    }

  }


  _initializeAllPoints() async {


    await readJson();

    List<LatLng> allPoints = getPoints();
    addSaudiBoundary();

    log('allPoints length: ${allPoints.length}');

    List< Polygon > addPolygon = [
      Polygon(
        polygonId: PolygonId( 'Saudia Arab' ),
        points: saudiBoundaryPoints,
        consumeTapEvents: true,
        strokeColor: Colors.green,
        strokeWidth: 2,
        fillColor: Colors.transparent,
      ),
      Polygon(
        polygonId: PolygonId( 'All' ),
        points: allPoints,
        consumeTapEvents: true,
        strokeColor: Colors.blue,
        strokeWidth: 2,
        fillColor: Colors.transparent,
      ),
    ];
    polygon.addAll( addPolygon );

  }


  Future<void> readJson() async {

    final String response = await rootBundle.loadString('assets/json/saudi_cities.json');

    final data = await json.decode(response);

    setState(() {
      _features = data["features"];
    });
  }

  List<LatLng> getPoints() {

    log('getPoints: ${_features[0]["geometry"]["type"]}');

    List<LatLng> points = [];

    for (var i = 0; i < _features.length; i++) {
      for (var j = 0; j < _features[i]["geometry"]["coordinates"].length; j++) {

        for(var k = 0; k < _features[i]["geometry"]["coordinates"][j].length; k++) {
          if(_features[i]["geometry"]["type"] == "Polygon") {

            print('value: ${_features[i]["geometry"]["coordinates"][j][k][1]}');

            double lat = double.parse(_features[i]["geometry"]["coordinates"][j][k][1].toString());
            double lng = double.parse(_features[i]["geometry"]["coordinates"][j][k][0].toString());

            points.add(LatLng(lat, lng));
          }
          else {
            for(var l = 0; l < _features[i]["geometry"]["coordinates"][j][k].length; l++) {
              double lat = double.parse(_features[i]["geometry"]["coordinates"][j][k][l][1].toString());
              double lng = double.parse(_features[i]["geometry"]["coordinates"][j][k][l][0].toString());

              points.add(LatLng(lat, lng));
            }

          }
        }
       /* if(_features[i]["geometry"]["type"] == "Polygon") {

          print('value: ${_features[i]["geometry"]["coordinates"][j][1]}');

          double lat = _features[i]["geometry"]["coordinates"][j][1][0];
          double lng = _features[i]["geometry"]["coordinates"][j][0][1];

          points.add(LatLng(lat, lng));
        }*/

      }
    }



    return points;
  }



  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final languageCode = AppLocalizations.of(context)!.localeName;
    final isEnglishLang = languageCode == 'en';

    //_addMarkers();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
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
              BottomSheets.showSearchByLocationBottomSheet(context);
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
          const SizedBox(width: 10)
        ],
      ),
      body: Stack(
        children: [
          ///main content
          _kUserCurrentLocation == null
              ? const MapShimmer()
              : GoogleMap(
                  mapType: _currentMapType,
                  initialCameraPosition: _kUserCurrentLocation!,
                  polylines: _polyline,
                  zoomControlsEnabled: false,
                  markers: _markers,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);

                  },
            polygons: polygon,

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
                    isSelected: _isStatisticsDialogVisible,
                    onTap: () {
                      setState(() {
                        _isStatisticsDialogVisible =
                            !_isStatisticsDialogVisible;
                      });

                      Dialogs.showStatisticsDialog(context, l10n).then((value) {
                        setState(() {
                          _isStatisticsDialogVisible =
                              !_isStatisticsDialogVisible;
                        });
                      });
                    },
                    icon: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Images.selectedLocationIcon,
                          color: _isStatisticsDialogVisible
                              ? AppColors.whiteColor
                              : AppColors.primaryColor,
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            'Riyadh',
                            style: context.textTheme.bodySmall?.copyWith(
                              color: _isStatisticsDialogVisible
                                  ? AppColors.whiteColor
                                  : AppColors.blackColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        const SizedBox(width: 8),
                        SvgPicture.asset(
                          Images.downArrowIcon,
                          color: _isStatisticsDialogVisible
                              ? AppColors.whiteColor
                              : AppColors.blackColor,
                        ),
                      ],
                    ),
                  ),
                  MapIcon(
                    isSelected: _isDistanceBottomSheetVisible,
                    onTap: () {
                      setState(() {
                        _isDistanceBottomSheetVisible =
                            !_isDistanceBottomSheetVisible;
                      });

                      print(
                          '_isDistanceBottomSheetVisible: $_isDistanceBottomSheetVisible');

                      BottomSheets.showDistanceBetweenTwoPointsBottomSheet(
                              context)
                          .then((value) => setState(() {
                                _isDistanceBottomSheetVisible = false;
                              }));
                    },
                    icon: SvgPicture.asset(
                      width: 20,
                      height: 20,
                      Images.distanceIcon,
                      color: _isDistanceBottomSheetVisible
                          ? AppColors.whiteColor
                          : AppColors.blackColor,
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
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MapIcon(
                        onTap: () {
                          _goToUserCurrentLocation();
                        },
                        icon: SvgPicture.asset(
                          width: 20,
                          height: 20,
                          Images.currentLocationIcon,
                        ),
                      ),
                    ],
                  ),
                  MapIcon(
                    isSelected: _currentMapType == MapType.satellite,
                    onTap: () {
                      setState(() {
                        _currentMapType = _currentMapType == MapType.normal
                            ? MapType.satellite
                            : MapType.normal;
                      });
                    },
                    icon: SvgPicture.asset(
                      width: 20,
                      height: 20,
                      Images.searchByLocationIcon,
                      color: _currentMapType == MapType.normal
                          ? AppColors.blackColor
                          : AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Header(
            content: SizedBox(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Utils.mainMenu.length,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      _mainMenuOnTap(index);
                    },
                    child: MainListItem(mainMenu: Utils.mainMenu[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _goToUserCurrentLocation() async {
    await _getCurrentLocation();

    final GoogleMapController controller = await _controller.future;
    //await controller.animateCamera(CameraUpdate.newCameraPosition(_kUserCurrentLocation!));
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kRiyadh));
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
            position:
                LatLng(currentLocation.latitude!, currentLocation.longitude!),
            infoWindow: InfoWindow(
              title: "Current Location",
              snippet:
                  "Lat: ${currentLocation.latitude}, Long: ${currentLocation.longitude}",
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

  _mainMenuOnTap(int index) {
    for (int i = 0; i < Utils.mainMenu.length; i++) {
      if (Utils.mainMenu[index].title == Utils.mainMenu[i].title) {
        Utils.mainMenu[i] = Utils.mainMenu[i].copyWith(isSelected: true);
      } else {
        Utils.mainMenu[i] = Utils.mainMenu[i].copyWith(isSelected: false);
      }
    }

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class CustomMarker extends StatefulWidget {

  const CustomMarker({
    required this.text,
    this.featureIcon,
    this.favouriteIcon,
    this.isViewed = false,
    super.key,
  });

  final String text;
  final String? featureIcon;
  final String? favouriteIcon;
  final bool isViewed;

  @override
  State<CustomMarker> createState() => _CustomMarkerState();
}

class _CustomMarkerState extends State<CustomMarker> {




  @override
  Widget build(BuildContext context) {

    var backgroundColor;

    if(widget.featureIcon != null) {
      backgroundColor = AppColors.primaryColor;
    } else {

      if(widget.isViewed) {
        backgroundColor = AppColors.viewedMarkerColor;
      }
      else {
        backgroundColor = AppColors.regularMarkerColor;
      }
    }


    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(60),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.featureIcon != null) ...[
            SvgPicture.asset(widget.featureIcon!, width: 50, height: 50),
            const SizedBox(width: 16),
          ],
          Text(
            widget.text,
            style: context.textTheme.bodyLarge?.copyWith(
              color: AppColors.secondaryColor,
              fontSize: 50,
            ),
          ),
          if (widget.favouriteIcon != null) ...[
            const SizedBox(width: 8),
            SvgPicture.asset(widget.favouriteIcon!, width: 50, height: 50),
          ],
        ],
      ),
    );
  }
}

/*

class CustomMarker extends StatelessWidget {
  CustomMarker({required this.text, this.icon, super.key});

  final GlobalKey globalKey = GlobalKey();

  final String text;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: globalKey,
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: context.textTheme.bodySmall?.copyWith(
                color: AppColors.selectedModelColor,
              ),
            ),
            if (icon != null) ...[
              const SizedBox(width: 8),
              SvgPicture.asset(icon!, width: 20, height: 20),
            ],
          ],
        ),
      ),
    );
  }

  Future<Uint8List> captureWidget() async {
    final RenderRepaintBoundary boundary =
    globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

    final ui.Image image = await boundary.toImage();

    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    final Uint8List pngBytes = byteData!.buffer.asUint8List();

    return pngBytes;
  }
}*/
