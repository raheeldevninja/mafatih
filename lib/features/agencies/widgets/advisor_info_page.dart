import 'package:flutter/material.dart';
import 'package:mafatih/core/ui/main_heading.dart';
import 'package:mafatih/features/my_account/property_requests/widgets/property_request_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdvisorInfoPage extends StatelessWidget {
  const AdvisorInfoPage({super.key});

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          MainHeading(heading: l10n.advisorInfoLabel),

          PropertyRequestData(
            title: l10n.agentsLabel,
            value: '10',
            backgroundColor: Colors.transparent,
          ),

          PropertyRequestData(
            title: l10n.propertiesLabel,
            value: '1886',
            backgroundColor: Colors.transparent,
          ),

          PropertyRequestData(
            title: l10n.propertyTypesLabel,
            value: 'Floor, Apartment, Villa',
            backgroundColor: Colors.transparent,
          ),

          PropertyRequestData(
            title: l10n.companyCityLabel,
            value: 'Riyaadh',
            backgroundColor: Colors.transparent,
          ),

          PropertyRequestData(
            title: l10n.propertiesForLabel,
            value: 'For Sale, Rent',
            backgroundColor: Colors.transparent,
          ),

          PropertyRequestData(
            title: l10n.advisorLicenseNumberLabel,
            value: '1234567890',
            backgroundColor: Colors.transparent,
          ),

        ],
      ),
    );
  }
}
