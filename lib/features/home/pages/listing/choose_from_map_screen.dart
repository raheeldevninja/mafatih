import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ChooseFromMapScreen extends StatefulWidget {
  const ChooseFromMapScreen({super.key});

  @override
  State<ChooseFromMapScreen> createState() => _ChooseFromMapScreenState();
}

class _ChooseFromMapScreenState extends State<ChooseFromMapScreen> {


  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  CameraPosition? _kGooglePlex;


  Location location = Location();
  Set<Marker> _markers = {};



  @override
  void initState() {
    super.initState();
    print('hello');

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _getCurrentLocation();
    });

  }

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: _kGooglePlex == null ? const SizedBox() : Stack(
        children: [

          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex!,
            markers: _markers,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),


          Positioned(
            bottom: 20,
            right: 0,
            left: 0,
            child:
          Container(
            height: 50,
              margin: const EdgeInsets.all(20),
              child: SimpleButton(text: l10n.searchBtnText, callback: () {

                Navigator.pop(context);

              })),

          ),

        ],
      ),
    );
  }

  void _getCurrentLocation() async {
    LocationData currentLocation;
    try {
      currentLocation = await location.getLocation();

      setState(() {
        _kGooglePlex = CameraPosition(
          target: LatLng(
            currentLocation.latitude!,
            currentLocation.longitude!,
          ),
          zoom: 18,
        );

        _markers.add(
          Marker(
            markerId: MarkerId("current_location"),
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

}
