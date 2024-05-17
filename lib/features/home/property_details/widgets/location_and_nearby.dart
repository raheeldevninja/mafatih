import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mafatih/core/ui/main_heading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocationAndNearby extends StatefulWidget {
  const LocationAndNearby({super.key});

  @override
  State<LocationAndNearby> createState() => _LocationAndNearbyState();
}

class _LocationAndNearbyState extends State<LocationAndNearby> {

  static const CameraPosition _kRiyadh = CameraPosition(
    target: LatLng(24.7136, 46.6753),
    zoom: 18,
  );

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  MapType _currentMapType = MapType.normal;

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        MainHeading(heading: l10n.locationNearbyLabel),
        const SizedBox(height: 16),

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
    );
  }
}
