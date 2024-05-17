import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/ui/main_logo.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/util/shared_pref.dart';
import 'package:mafatih/features/choose_language/widgets/english_arabic_buttons.dart';
import 'package:mafatih/features/intro/intro_screen.dart';

class ChooseLanguageMainContent extends StatelessWidget {
  const ChooseLanguageMainContent({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            const MainLogo(),

            SizedBox(height: height * 0.1),

            Text(
              l10n.choose_language,
              style: context.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            ///english arabic buttons
            const EnglishArabicButtons(),

            const SizedBox(height: 20),

            ///get started button
            SizedBox(
              width: double.maxFinite,
              height: 56,
              child: SimpleButton(
                text: l10n.getStarted,
                onPressed: () async {

                  await SharedPref.saveChooseLanguageScreenShown(true);

                  if(context.mounted) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const IntroScreen(),
                      ),
                    );
                  }


                },
              ),
            ),

            SizedBox(height: height * 0.1),
          ],
        ),
      ),
    );
  }
}
