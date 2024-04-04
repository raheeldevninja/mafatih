import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/features/auth/login_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final l10n = AppLocalizations.of(context)!;
    final languageCode = AppLocalizations.of(context)!.localeName;
    final isEnglishLang = languageCode == 'en';

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
          children: [
            SvgPicture.asset(
              width: width * 0.25,
              height: width * 0.25,
              isEnglishLang ? Images.mafatihLogoEn : Images.mafatihLogoAr,
            ),

            SizedBox(height: height * 0.04),

            SvgPicture.asset(
              width: width * 0.7,
              height: width * 0.7,
              Images.introBg,
            ),

            SizedBox(height: height * 0.04),

            ///intro title
            Text(
              l10n.intro_title,
              style: const TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: height * 0.02),

            ///intro description
            Text(
              l10n.intro_description,
              style: const TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: height * 0.02),

            ///get started button
            SizedBox(
              width: double.maxFinite,
              height: 56,
              child: SimpleButton(
                text: l10n.getStarted,
                callback: () async {
                  ///navigate to login screen
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
