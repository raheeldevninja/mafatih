import 'package:flutter/material.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property.dart';
import 'package:mafatih/features/home/property_details/widgets/property_attribute.dart';


class PropertyAttributes extends StatelessWidget {
  const PropertyAttributes({
    super.key,
    required this.property,
  });

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///area
        Expanded(
          child: PropertyAttribute(
            property: property,
            icon: Images.areaIcon,
            title: 'Area',
            value: property.area,
          ),
        ),

        const SizedBox(width: 8),

        ///beds
        Expanded(
          child: PropertyAttribute(
            property: property,
            icon: Images.bedIcon,
            title: 'Bed',
            value: property.beds,
          ),
        ),

        const SizedBox(width: 8),

        ///bath
        Expanded(
          child: PropertyAttribute(
            property: property,
            icon: Images.bathIcon,
            title: 'Bath',
            value: '1',
          ),
        ),

        const SizedBox(width: 8),

        ///age
        Expanded(
          child: PropertyAttribute(
            property: property,
            icon: Images.ageIcon,
            title: 'Age',
            value: '17+',
          ),
        ),
      ],
    );
  }
}