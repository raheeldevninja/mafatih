import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/features/choose_language/choose_language_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _navigateToChooseLangScreen();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final languageCode = AppLocalizations.of(context)!.localeName;
    final isEnglishLang = languageCode == 'en';

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Center(
        child: Stack(
          children: [
            Center(
              child: SvgPicture.asset(
                width: width * 0.25,
                height: width * 0.25,
                isEnglishLang ? Images.mafatihLogoEn : Images.mafatihLogoAr,
              ),
            ),
            Positioned.fill(
              child: SvgPicture.asset(
                Images.splashBg,
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _navigateToChooseLangScreen() {
    Future.delayed(const Duration(seconds: 3), () async {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ChooseLanguageScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
