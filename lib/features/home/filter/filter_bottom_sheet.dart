import 'package:flutter/material.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/features/home/filter/widgets/area_range_widget.dart';
import 'package:mafatih/features/home/filter/widgets/bed_rooms_widget.dart';
import 'package:mafatih/features/home/filter/widgets/keywords_widget.dart';
import 'package:mafatih/features/home/filter/widgets/location_selector_widget.dart';
import 'package:mafatih/features/home/filter/widgets/price_range_widget.dart';
import 'package:mafatih/features/home/filter/widgets/property_types_widget.dart';
import 'package:mafatih/features/home/filter/widgets/property_usage_widget.dart';
import 'package:mafatih/features/home/filter/widgets/results_count_widget.dart';
import 'package:mafatih/features/home/filter/widgets/save_filters_button.dart';
import 'package:mafatih/features/home/filter/widgets/use_current_location_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FiltersBottomSheet extends StatefulWidget {
  const FiltersBottomSheet({super.key});

  @override
  State<FiltersBottomSheet> createState() => _FiltersBottomSheetState();
}

class _FiltersBottomSheetState extends State<FiltersBottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 100,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Text(l10n.filtersHeading, style: context.textTheme.titleMedium),
              ],
            ),

            const SizedBox(height: 8),
            const LocationSelectorWidget(),
            const SizedBox(height: 16),
            const PropertyUsageWidget(),
            const SizedBox(height: 20),
            const PropertyTypesWidget(),
            const SizedBox(height: 20),
            const PriceRangeWidget(),
            const SizedBox(height: 20),
            const AreaRangeWidget(),
            const SizedBox(height: 20),
            const BedRoomsWidget(),
            const SizedBox(height: 20),
            const KeywordsWidget(),
            const SizedBox(height: 8),
            const ResultsCountWidget(value: '58'),
            UseCurrentLocationWidget(onPressed: () {}),
            const SizedBox(height: 20),
            const Center(child: SaveFiltersButton()),
            const SizedBox(height: 4),

            ///find now button
            SizedBox(
              width: width,
              height: 50,
              child: SimpleButton(
                text: l10n.findNowBtnText,
                onPressed: () {},
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}


