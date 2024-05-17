import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/models/property_usage.dart';
import 'package:mafatih/features/home/filter/widgets/text_tile.dart';

class PropertyUsageWidget extends StatefulWidget {
  const PropertyUsageWidget({super.key});

  @override
  State<PropertyUsageWidget> createState() => _PropertyUsageWidgetState();
}

class _PropertyUsageWidgetState extends State<PropertyUsageWidget> {
  List<PropertyUsage> propertyUsageList = [];

  @override
  void initState() {
    super.initState();

    propertyUsageList = [
      PropertyUsage(id: '1', name: 'Residential'),
      PropertyUsage(id: '2', name: 'Commercial'),
      PropertyUsage(id: '3', name: 'Industrial'),
      PropertyUsage(id: '4', name: 'Agricultural'),
    ];
  }

  @override
  Widget build(BuildContext context) {



    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          l10n.propertyUsageLabel,
          style: context.textTheme.bodyLarge,
        ),

        const SizedBox(height: 8),

        ///property usage list
        SizedBox(
          height: 30,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: propertyUsageList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return TextTile(
                text: propertyUsageList[index].name,
                isSelected: propertyUsageList[index].isSelected,
                onTap: () {
                  //single select
                  for (int i = 0; i < propertyUsageList.length; i++) {
                    if (i != index) {
                      propertyUsageList[i] =
                          propertyUsageList[i].copyWith(isSelected: false);
                    } else {
                      propertyUsageList[i] =
                          propertyUsageList[i].copyWith(isSelected: true);
                    }
                  }

                  setState(() {});
                },
              );
            },
          ),
        ),

      ],
    );
  }
}
