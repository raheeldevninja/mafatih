import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuildingAreaDropDown extends StatefulWidget {
  const BuildingAreaDropDown({super.key});

  @override
  State<BuildingAreaDropDown> createState() => _BuildingAreaDropDownState();
}

class _BuildingAreaDropDownState extends State<BuildingAreaDropDown> {

  String _selectedBuildingArea = 'Select Building Area';

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Widgets.labels(context, l10n.buildingAreaLabel),
        const SizedBox(height: 10),

        //drop down for building area
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.greyColor.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            underline: const SizedBox(),
            value: _selectedBuildingArea,
            style: const TextStyle(
              color: AppColors.blackColor,
              fontSize: 14,
            ),
            items: <String>[
              'Select Building Area',
              'Sqm',
              '200 sqm',
              '300 sqm',
              '400 sqm',
              '500 sqm'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                _selectedBuildingArea = value!;
              });
            },
          ),
        ),

      ],
    );
  }
}
