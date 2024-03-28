import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Utils {

  //bottom navigation
  static PersistentTabController controller =
      PersistentTabController(initialIndex: 0);

  static final pageController = PageController();
  static int currentPage = 0;


  static void showCustomSnackBar(BuildContext context, String message, ContentType contentType) {

    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Labees',
        message: message,
        color: AppColors.primaryColor,
        contentType: contentType,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);


  }


  //month num to month name 3 chars
  static String monthNumToName(int monthNum) {
    switch (monthNum) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      default:
        return 'Dec';
    }
  }
}
