import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/features/theme_screen/model/theme_model.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  List<ThemeModel> themesList = [];

  @override
  void initState() {
    super.initState();
    _getThemes();
  }

  _getThemes() {
    themesList.add(ThemeModel(
      themeName: 'Light',
      themeIcon: Images.lightThemeIcon,
    ));
    themesList.add(ThemeModel(
      themeName: 'Dark',
      themeIcon: Images.darkThemeIcon,
    ));
    themesList.add(ThemeModel(
      themeName: 'Automatic',
      themeIcon: Images.automaticThemeIcon,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Theme',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.backBtnColor,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child:
                  const Icon(Icons.arrow_back, color: AppColors.secondaryColor),
            ),
          ),
        ),
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
                              for (int i = 0; i < themesList.length; i++) {
                                if (i == index) {
                                  themesList[i] =
                                      themesList[i].copyWith(isSelected: true);
                                } else {
                                  themesList[i] =
                                      themesList[i].copyWith(isSelected: false);
                                }
                              }

                              setState(() {

                              });
                            },
                            leading: Container(
                              width: 40,
                              height: 40,
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              child: SvgPicture.asset(
                                themesList[index].themeIcon,
                                color: themesList[index].isSelected ? AppColors.primaryColor : AppColors.blackColor,
                              ),
                            ),
                            trailing: themesList[index].isSelected
                                ? const Icon(
                                    Icons.check,
                                    color: AppColors.primaryColor,
                                  )
                                : null,
                            title: Text(
                              themesList[index].themeName,
                              style: TextStyle(
                                color: themesList[index].isSelected ? AppColors.primaryColor : AppColors.blackColor,
                              ),
                            ),
                          );
                        },
                        itemCount: themesList.length,
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
