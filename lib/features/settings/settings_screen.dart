import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/custom_app_bar.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/features/feedback/feedback_screen.dart';
import 'package:mafatih/features/language_screen/language_screen.dart';
import 'package:mafatih/features/settings/widgets/setting_item.dart';
import 'package:mafatih/features/static_pages/about_us_page.dart';
import 'package:mafatih/features/theme_screen/theme_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: l10n.settings,
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

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(l10n.preferencesLabel,
                  style: context.textTheme.titleMedium,
                  ),
                ),

                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SettingItem(
                        label: l10n.themeLabelSettings,
                        icon: Images.themeSettingsIcon,
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const ThemeScreen(),
                            withNavBar: false,
                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          );
                        },
                      ),

                      SettingItem(
                        label: l10n.languageLabelSettings,
                        icon: Images.languageSettingsIcon,
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const LanguageScreen(),
                            withNavBar: false,
                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          );
                        },
                      ),

                      SettingItem(
                        label: l10n.feedbackLabelSettings,
                        icon: Images.feedbackSettingsIcon,
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const FeedbackScreen(),
                            withNavBar: false,
                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          );
                        },
                      ),

                      SettingItem(
                        label: l10n.aboutLabelSettings,
                        icon: Images.aboutSettingsIcon,
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const AboutUsPage(),
                            withNavBar: false,
                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          );
                        },
                      ),

                      SettingItem(
                        label: l10n.shareTheAppLabelSettings,
                        icon: Images.shareSettingsIcon,
                        onTap: () {},
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

