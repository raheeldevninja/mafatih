import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/util/utils.dart';

class EnglishArabicButtons extends StatelessWidget {
  const EnglishArabicButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCode = AppLocalizations.of(context)!.localeName;
    final isEnglishLang = languageCode == 'en';

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                Utils.chooseLanguage(context, 'en');
              },
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                side: BorderSide(
                  color: isEnglishLang
                      ? AppColors.primaryColor
                      : Colors.transparent,
                  width: 1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                backgroundColor: isEnglishLang
                    ? AppColors.primaryColor.withOpacity(0.2)
                    : AppColors.inactiveButtonColor.withOpacity(0.2),
                elevation: 0,
              ),
              child: Text(
                'English',
                style: TextStyle(
                  color: isEnglishLang
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
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
              onPressed: () {
                Utils.chooseLanguage(context, 'ar');
              },
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                side: BorderSide(
                    color: isEnglishLang
                        ? Colors.transparent
                        : AppColors.primaryColor,
                    width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                backgroundColor: isEnglishLang
                    ? AppColors.inactiveButtonColor.withOpacity(0.2)
                    : AppColors.primaryColor.withOpacity(0.2),
                elevation: 0,
              ),
              child: Text(
                'العربیہ',
                style: TextStyle(
                  color: isEnglishLang
                      ? AppColors.greyColor
                      : AppColors.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
