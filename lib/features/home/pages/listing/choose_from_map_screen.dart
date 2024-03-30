import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ChooseFromMapScreen extends StatefulWidget {
  const ChooseFromMapScreen({super.key});

  @override
  State<ChooseFromMapScreen> createState() => _ChooseFromMapScreenState();
}

class _ChooseFromMapScreenState extends State<ChooseFromMapScreen> {

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.7136, 46.6753),
    zoom: 18,
  );

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Stack(
        children: [

          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
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
}
