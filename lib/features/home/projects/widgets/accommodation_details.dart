import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/features/home/pages/explore/widgets/project_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccommodationDetails extends StatelessWidget {
  const AccommodationDetails({super.key});

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Row(
      children: [
        Expanded(
          child: ProjectData(
            title: l10n.noOfUnitsLabel,
            value: '20',
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 1,
          height: 40,
          color: AppColors.greyColor.withOpacity(0.4),
        ),
        Expanded(
          child: ProjectData(
            title: l10n.unitsTypeLabel,
            value: 'Residential',
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 1,
          height: 40,
          color: AppColors.greyColor.withOpacity(0.4),
        ),
        Expanded(
          child: ProjectData(
            title: l10n.areaLabel,
            value: '90m2 to 180m2',
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 1,
          height: 40,
          color: AppColors.greyColor.withOpacity(0.4),
        ),
        Expanded(
          child: ProjectData(
            title: l10n.roomsLabel,
            value: '2 to 5',
          ),
        ),
      ],
    );
  }
}
