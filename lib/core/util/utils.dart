import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/main_menu.dart';
import 'package:mafatih/features/home/pages/chat/model/chat_message.dart';
import 'package:mafatih/l10n/locale_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:html/dom.dart' as htmlDom;

class Utils {



  static List<MainMenu> mainMenu = [
    MainMenu(
      title: 'For Sale',
      icon: Images.forSaleIcon,
      isSelected: true
    ),
    MainMenu(
      title: 'For Rent',
      icon: Images.forRentIcon,
    ),
    MainMenu(
      title: 'Projects',
      icon: Images.projectsIcon,
    ),
    MainMenu(
      title: 'Daily Rent',
      icon: Images.dailyIcon,
    ),
  ];

  static List<ChatMessageModel> messages = [
    ChatMessageModel(
      message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      isSender: true,
      image: Images.userImageSvg,
      time: DateTime.now(),
    ),

    ChatMessageModel(
      message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
      isSender: true,
      image: Images.userImageSvg,
      time: DateTime.now(),
    ),

    ChatMessageModel(
      message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      isSender: false,
      image: Images.userImageSvg,
      time: DateTime.now(),
    ),
    ChatMessageModel(
      message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      isSender: true,
      image: Images.userImageSvg,
      time: DateTime.now(),
    ),
    ChatMessageModel(
      message: 'I am fine',
      isSender: false,
      image: Images.userImageSvg,
      time: DateTime.now(),
    ),
    ChatMessageModel(
      message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      isSender: false,
      image: Images.userImageSvg,
      time: DateTime.now(),
    ),
  ];


  //bottom navigation
  static PersistentTabController controller =
      PersistentTabController(initialIndex: 2);

  static final pageController = PageController();
  static int currentPage = 0;

  static void showCustomSnackBar(
      BuildContext context, String message, ContentType contentType) {
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Mafatih',
        message: message,
        color: AppColors.primaryColor,
        contentType: contentType,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static Future<Uint8List?> getBytesFromAsset(
      BuildContext context, String path) async {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: pixelRatio.round() * 30);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }

  static void showSimpleDialog(BuildContext context, String title,
      String message, VoidCallback onOkPressed) {
    final l10n = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: onOkPressed,
              child: Text(l10n.okBtnText),
            ),
          ],
        );
      },
    );
  }


  static Future<void> chooseLanguage(BuildContext context, String code) async {
    final localeProvider = context.read<LocaleProvider>();

    localeProvider.changeLocale(Locale(code));
    await localeProvider.saveChooseLanguageShown();
  }

  static String parseHtml(htmlDom.Document document) {
    // Extract text content from the parsed HTML
    String textContent = '';

    if (document.body != null) {
      textContent = document.body!.text;
    }

    return textContent;
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
