import 'package:flutter/material.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property_model.dart';
import 'package:mafatih/features/home/property_details/widgets/property_attribute.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PropertyAttributes extends StatelessWidget {
  const PropertyAttributes({
    super.key,
    required this.property,
  });

  final PropertyModel property;

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Row(
      children: [
        ///area
        Expanded(
          child: PropertyAttribute(
            property: property,
            icon: Images.areaIcon,
            title: l10n.areaLabel,
            value: property.area,
          ),
        ),

        const SizedBox(width: 8),

        ///beds
        Expanded(
          child: PropertyAttribute(
            property: property,
            icon: Images.bedIcon,
            title: l10n.bedLabel,
            value: property.beds,
          ),
        ),

        const SizedBox(width: 8),

        ///bath
        Expanded(
          child: PropertyAttribute(
            property: property,
            icon: Images.bathIcon,
            title: l10n.bathLabel,
            value: '1',
          ),
        ),

        const SizedBox(width: 8),

        ///age
        Expanded(
          child: PropertyAttribute(
            property: property,
            icon: Images.ageIcon,
            title: l10n.ageLabel,
            value: '17+',
          ),
        ),
      ],
    );
  }
}