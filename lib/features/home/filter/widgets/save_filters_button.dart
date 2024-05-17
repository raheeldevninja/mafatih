import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/features/home/filter/saved_filters_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SaveFiltersButton extends StatelessWidget {
  const SaveFiltersButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return TextButton(
      onPressed: () {
        /*PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const SavedFiltersScreen(),
          withNavBar: true,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );*/

        Navigator.pop(context);

      },
      child: Text(
        l10n.saveFiltersBtnText,
        style: context.textTheme.bodyMedium?.copyWith(
          color: AppColors.primaryColor,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryColor,
        ),
      ),
    );
  }
}
