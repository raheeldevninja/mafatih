import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AreaRangeWidget extends StatefulWidget {
  const AreaRangeWidget({super.key});

  @override
  State<AreaRangeWidget> createState() => _AreaRangeWidgetState();
}

class _AreaRangeWidgetState extends State<AreaRangeWidget> {
  SfRangeValues _areaRangeValues = const SfRangeValues(90, 300);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.areaLabel,
          style: context.textTheme.bodyLarge,
        ),
        const SizedBox(height: 8),
        SfRangeSlider(
          min: 90,
          max: 300,
          values: _areaRangeValues,
          interval: 10,
          showTicks: false,
          showLabels: false,
          enableTooltip: false,
          showDividers: false,
          startThumbIcon: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.circle,
              color: Colors.white,
              size: 16,
            ),
          ),
          endThumbIcon: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.circle,
              color: Colors.white,
              size: 16,
            ),
          ),
          inactiveColor: AppColors.greyColor.withOpacity(0.2),
          minorTicksPerInterval: 100,
          onChanged: (SfRangeValues values) {
            setState(() {
              _areaRangeValues = values;
            });
          },
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${_areaRangeValues.start.round()} m2',
                style: context.textTheme.bodySmall
                    ?.copyWith(fontWeight: FontWeight.w600)),
            Text('${_areaRangeValues.end.round()} m2',
                style: context.textTheme.bodySmall
                    ?.copyWith(fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    );
  }
}
