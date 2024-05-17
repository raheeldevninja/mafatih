import 'package:flutter/material.dart';
import 'package:mafatih/features/home/projects/widgets/fact_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FactsSection extends StatelessWidget {
  const FactsSection({super.key});

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: FactItem(
                title: l10n.referenceLabel,
                value: '3454435',
              ),
            ),

            Expanded(
              child: FactItem(
                title: l10n.bedRoomsLabel,
                value: '3',
              ),
            ),
            Expanded(
              child: FactItem(
                title: l10n.areaLabel,
                value: '264 Sq. M',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: FactItem(
                title: l10n.listingUsageLabel,
                value: 'Residential',
              ),
            ),
            Expanded(
              child: FactItem(
                title: l10n.unitNumberLabel,
                value: '21',
              ),
            ),

            Expanded(
              child: FactItem(
                title: l10n.advertisingTypeLabel,
                value: 'For Sale',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: FactItem(
                title: l10n.propertyAgeLabel,
                value: 'New',
              ),
            ),
            Expanded(
              child: FactItem(
                title: l10n.realEstateFacadeLabel,
                value: 'Eastern',
              ),
            ),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: FactItem(
                title: l10n.roomsLabel,
                value: '3',
              ),
            ),
            Expanded(
              child: FactItem(
                title: l10n.propertyTypeLabel,
                value: 'Floor',
              ),
            ),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
            ),
          ],
        ),

      ],
    );
  }
}
