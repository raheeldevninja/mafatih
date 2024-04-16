import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/features/agencies/agencies_screen.dart';
import 'package:mafatih/features/my_account/my_account_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final languageCode = l10n.localeName;
    final isEnglishLang = languageCode == 'en';

    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              border: Border(
                bottom: Divider.createBorderSide(context,
                    color: Colors.white, width: 0),
              ),
            ),
            padding: const EdgeInsets.all(40),
            //margin: EdgeInsets.all(30),
            child: SvgPicture.asset(
              isEnglishLang ? Images.mafatihLogoEn : Images.mafatihLogoAr,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 48,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Images.addIconNav,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    l10n.advertiseWithUsBtnText,
                    style: const TextStyle(color: AppColors.whiteColor),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          _buildNavDrawerItem(
            l10n.home,
            Images.homeIconNav,
            () {
              Navigator.pop(context);
            },
          ),
          _buildNavDrawerItem(
            l10n.propertyListingNav,
            Images.propertyListingIconNav,
            () async {
              Navigator.pop(context);
            },
          ),
          _buildNavDrawerItem(
            l10n.projectsNav,
            Images.propertyListingIconNav,
            () {
              Navigator.pop(context);
              //Utils.controller.jumpToTab(2);
            },
          ),
          _buildNavDrawerItem(
            l10n.agenciesNav,
            Images.agentsIconNav,
            () {
              Navigator.pop(context);

              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: const AgentsScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );

            },
          ),
          _buildNavDrawerItem(
            l10n.myAccountNav,
            Images.accountIconNav,
            () {
              Navigator.pop(context);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyAccountScreen(),
                ),
              );

            },
          ),
          _buildNavDrawerItem(
            l10n.propertyCheckNav,
            Images.propertyCheckIconNav,
            () {
              Navigator.pop(context);
            },
          ),
          _buildNavDrawerItem(
            l10n.valuatePropertyNav,
            Images.valuatePropertyIconNav,
            () {},
          ),
          _buildNavDrawerItem(
            l10n.propertyRequestNav,
            Images.propertyRequestIconNav,
            () {
              Navigator.pop(context);
            },
          ),
          _buildNavDrawerItem(
            l10n.settingsNav,
            Images.settingsIconNav,
            () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 160,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 60),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    side: const BorderSide(
                      width: 1.0,
                      color: AppColors.primaryColor,
                    ),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        Images.logoutIconNav,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        true ? l10n.logout : l10n.login,
                        style: const TextStyle(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  ListTile _buildNavDrawerItem(
    String text,
    String icon,
    VoidCallback callback,
  ) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: SvgPicture.asset(
          icon,
        ),
      ),
      title: Text(text),
      onTap: callback,
    );
  }
}
