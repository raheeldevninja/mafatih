import 'package:flutter/material.dart';
import 'package:mafatih/core/ui/main_heading.dart';
import 'package:mafatih/features/my_account/property_requests/widgets/property_request_data.dart';


class AdvisorInfoPage extends StatelessWidget {
  const AdvisorInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          MainHeading(heading: 'Advisor Info'),

          PropertyRequestData(
            title: 'Agents:',
            value: '10',
            backgroundColor: Colors.transparent,
          ),

          PropertyRequestData(
            title: 'Properties:',
            value: '1886',
            backgroundColor: Colors.transparent,
          ),

          PropertyRequestData(
            title: 'Property Types:',
            value: 'Floor, Apartment, Villa',
            backgroundColor: Colors.transparent,
          ),

          PropertyRequestData(
            title: 'Company City:',
            value: 'Riyaadh',
            backgroundColor: Colors.transparent,
          ),

          PropertyRequestData(
            title: 'Properties for:',
            value: 'For Sale, Rent',
            backgroundColor: Colors.transparent,
          ),

          PropertyRequestData(
            title: 'Advisor License Number:',
            value: '1234567890',
            backgroundColor: Colors.transparent,
          ),

        ],
      ),
    );
  }
}
