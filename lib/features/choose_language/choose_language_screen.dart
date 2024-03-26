import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/l10n/locale_provider.dart';
import 'package:provider/provider.dart';


class ChooseLanguageScreen extends StatelessWidget {

  const ChooseLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final l10n = AppLocalizations.of(context)!;


    final languageCode = AppLocalizations.of(context)!.localeName;
    final isEnglishLang = languageCode == 'en';


    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Center(
        child: Stack(
          children: [

            Positioned.fill(
              child: SvgPicture.asset(
                Images.splashBg,
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter,
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      width: width * 0.25,
                      height: width * 0.25,
                      Images.mafatihLogoEn,
                    ),

                    SizedBox(height: height * 0.1),

                    Text(
                      l10n.choose_language,
                      style: const TextStyle(
                        color: AppColors.primaryTextColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    ///english arabic buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () async {
                                _chooseLanguage(context, 'en');
                              },
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                side: BorderSide(color: isEnglishLang ? AppColors.primaryColor : Colors.transparent, width: 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                backgroundColor: isEnglishLang ? AppColors.primaryColor.withOpacity(0.2) : AppColors.inactiveButtonColor.withOpacity(0.2),
                                elevation: 0,
                              ),
                              child: Text(
                                'English',
                                style: TextStyle(
                                  color: isEnglishLang ? AppColors.primaryColor : AppColors.greyColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 20),

                        Expanded(
                          child: SizedBox(
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () async {
                                await _chooseLanguage(context, 'ar');
                              },
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                side: BorderSide(color: isEnglishLang ? Colors.transparent : AppColors.primaryColor, width: 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                backgroundColor: isEnglishLang ? AppColors.inactiveButtonColor.withOpacity(0.2) : AppColors.primaryColor.withOpacity(0.2),
                                elevation: 0,
                              ),
                              child: Text(
                                'العربیہ',
                                style: TextStyle(
                                  color: isEnglishLang ? AppColors.greyColor : AppColors.primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),


                    const SizedBox(height: 20),


                    ///get started button
                    SizedBox(
                      width: double.maxFinite,
                      height: 56,
                      child: SimpleButton(
                        text: l10n.getStarted,
                        callback: () async {
                        },
                      ),
                    ),

                    SizedBox(height: height * 0.1),

                  ],
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }

  ///choose language function
  Future<void> _chooseLanguage(BuildContext context, String code) async {
    final localeProvider = context.read<LocaleProvider>();

    localeProvider.changeLocale(Locale(code));
    await localeProvider.saveChooseLanguageShown();

  }

}
