import 'package:flutter/material.dart';
import 'package:mafatih/features/home/filter/filter_bottom_sheet.dart';
import 'package:mafatih/features/home/filter/widgets/distance_bottom_sheet.dart';
import 'package:mafatih/features/home/filter/widgets/search_by_location_bottom_sheet.dart';


sealed class BottomSheets {

  const BottomSheets._();

  static Future<void> showFilterBottomSheet(BuildContext context) async {

    _showModalBottomSheet(
      context: context,
      child: const FiltersBottomSheet(),
    );
  }

  static Future<void> showSearchByLocationBottomSheet(BuildContext context) async {

    _showModalBottomSheet(
      context: context,
      heightFactor: 0.45,
      child: const SearchByLocationBottomSheet(),
    );
  }

  static Future<void> showDistanceBetweenTwoPointsBottomSheet(BuildContext context) async {

    return await _showModalBottomSheet(
      context: context,
      heightFactor: 0.45,
      child: const DistanceBottomSheet(),
    );
  }


  static Future<void> _showModalBottomSheet({
    required BuildContext context,
    required Widget child,
    double? heightFactor,
  }) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      clipBehavior: Clip.antiAlias,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: heightFactor ?? 0.8,
          child: child,
        );
      },
    );
  }


}