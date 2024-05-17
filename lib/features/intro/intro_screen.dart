import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/ui/main_logo.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/features/auth/login_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
          children: [

            const MainLogo(),

            SizedBox(height: height * 0.01),

            SvgPicture.asset(
              width: width,
              height: width,
              Images.introBg,
            ),

            SizedBox(height: height * 0.01),

            ///intro title
            Text(
              l10n.intro_title,
              style: context.textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: height * 0.01),

            ///intro description
            Text(
              l10n.intro_description,
              style: context.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),

          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.maxFinite,
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: SimpleButton(
          text: l10n.getStarted,
          onPressed: () async {
            ///navigate to login screen
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
