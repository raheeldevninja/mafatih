import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/models/property_type.dart';
import 'package:mafatih/features/home/filter/widgets/text_tile.dart';

class PropertyTypesWidget extends StatefulWidget {
  const PropertyTypesWidget({super.key});

  @override
  State<PropertyTypesWidget> createState() => _PropertyTypesWidgetState();
}

class _PropertyTypesWidgetState extends State<PropertyTypesWidget> {
  List<PropertyType> propertyTypeList = [];

  @override
  void initState() {
    super.initState();

    propertyTypeList = [
      PropertyType(id: '1', name: 'Apartment'),
      PropertyType(id: '2', name: 'Villa'),
      PropertyType(id: '3', name: 'Flood'),
      PropertyType(id: '4', name: 'Room'),
      PropertyType(id: '5', name: 'Office'),
      PropertyType(id: '6', name: 'Chalet'),
      PropertyType(id: '7', name: 'Farm'),
      PropertyType(id: '8', name: 'Building'),
      PropertyType(id: '10', name: 'Shop'),
      PropertyType(id: '11', name: 'Warehouse'),
      PropertyType(id: '12', name: 'Land'),
    ];
  }

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          l10n.propertyTypeLabel,
          style: context.textTheme.bodyLarge,
        ),

        const SizedBox(height: 8),

        ///property types list
        SizedBox(
          height: 30,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: propertyTypeList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return TextTile(
                text: propertyTypeList[index].name,
                isSelected: propertyTypeList[index].isSelected,
                onTap: () {
                  setState(() {
                    propertyTypeList[index] = propertyTypeList[index]
                        .copyWith(
                        isSelected:
                        !propertyTypeList[index].isSelected);
                  });
                },
              );
            },
          ),
        ),

      ],
    );
  }
}
