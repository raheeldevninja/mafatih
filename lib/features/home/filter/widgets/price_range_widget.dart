import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PriceRangeWidget extends StatefulWidget {
  const PriceRangeWidget({super.key});

  @override
  State<PriceRangeWidget> createState() => _PriceRangeWidgetState();
}

class _PriceRangeWidgetState extends State<PriceRangeWidget> {

  SfRangeValues _priceRangeValues = const SfRangeValues(1000.0, 100000.0);

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          l10n.priceRangeLabel,
          style: context.textTheme.bodyLarge,
        ),

        const SizedBox(height: 8),

        SfRangeSlider(
          min: 1000.0,
          max: 100000.0,
          values: _priceRangeValues,
          interval: 1000,
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
              _priceRangeValues = values;
            });
          },
        ),

        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                '${double.parse(_priceRangeValues.start.round().toString()).toStringAsFixed(2)} SAR',
                style: context.textTheme.bodySmall
                    ?.copyWith(fontWeight: FontWeight.w600)),
            Text(
                '${double.parse(_priceRangeValues.end.round().toString()).toStringAsFixed(2)} SAR',
                style: context.textTheme.bodySmall
                    ?.copyWith(fontWeight: FontWeight.w600)),
          ],
        ),

      ],
    );
  }
}
