import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/custom_app_bar.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/util/utils.dart';
import 'package:mafatih/features/language_screen/model/language_model.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<LanguageModel> languagesList = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getLanguages();
    });

  }

  _getLanguages() {
    languagesList.add(LanguageModel(
      languageName: 'English',
      isSelected: true,
    ));

    languagesList.add(LanguageModel(
      languageName: 'العربیہ',
    ));

    final languageCode = AppLocalizations.of(context)!.localeName;

    if (languageCode == 'en') {
      for (int i = 0; i < languagesList.length; i++) {
        if (i == 0) {
          languagesList[i] = languagesList[i].copyWith(isSelected: true);
        } else {
          languagesList[i] = languagesList[i].copyWith(isSelected: false);
        }
      }
    } else {
      for (int i = 0; i < languagesList.length; i++) {
        if (i == 1) {
          languagesList[i] = languagesList[i].copyWith(isSelected: true);
        } else {
          languagesList[i] = languagesList[i].copyWith(isSelected: false);
        }
      }
    }

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: l10n.language,
        onTapBackButton: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          const Header(
            height: 20,
            content: SizedBox(),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              primary: true,
              children: [
                const SizedBox(height: 20),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              for (int i = 0; i < languagesList.length; i++) {
                                if (i == index) {
                                  languagesList[i] = languagesList[i]
                                      .copyWith(isSelected: true);
                                } else {
                                  languagesList[i] = languagesList[i]
                                      .copyWith(isSelected: false);
                                }
                              }

                              if (languagesList[index].languageName ==
                                  'English') {
                                Utils.chooseLanguage(context, 'en');
                              } else {
                                Utils.chooseLanguage(context, 'ar');
                              }

                              setState(() {});
                            },
                            trailing: languagesList[index].isSelected
                                ? const Icon(
                                    Icons.check,
                                    color: AppColors.primaryColor,
                                  )
                                : null,
                            title: Text(
                              languagesList[index].languageName,
                              style: TextStyle(
                                color: languagesList[index].isSelected
                                    ? AppColors.primaryColor
                                    : AppColors.blackColor,
                              ),
                            ),
                          );
                        },
                        itemCount: languagesList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
