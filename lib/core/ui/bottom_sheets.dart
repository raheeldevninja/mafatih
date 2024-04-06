import 'package:flutter/material.dart';
import 'package:mafatih/features/home/filter/filter_bottom_sheet.dart';


sealed class BottomSheets {

  const BottomSheets._();

  static Future<void> showFilterBottomSheet(BuildContext context) async {

    _showModalBottomSheet(
      context: context,
      child: const FiltersBottomSheet(),
    );
  }




  static void _showModalBottomSheet({
    required BuildContext context,
    required Widget child,
    double? heightFactor,
  }) {
    showModalBottomSheet<void>(
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