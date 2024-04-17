import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/ui/icon_text_button.dart';
import 'package:mafatih/core/ui/rounded_button.dart';
import 'package:mafatih/features/agencies/agencies_screen.dart';
import 'package:mafatih/features/contact_us/contact_us_screen.dart';
import 'package:mafatih/features/my_account/my_account_screen.dart';
import 'package:mafatih/features/settings/settings_screen.dart';
import 'package:mafatih/features/static_pages/faq_page.dart';
import 'package:mafatih/features/static_pages/payment_policy_page.dart';
import 'package:mafatih/features/static_pages/privacy_policy_page.dart';
import 'package:mafatih/features/static_pages/terms_of_use_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final languageCode = l10n.localeName;
    final isEnglishLang = languageCode == 'en';

    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.1),
                  ),
                  child: SvgPicture.asset(
                    width: 150,
                    isEnglishLang ? Images.mafatihLogoEn : Images.mafatihLogoAr,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  bottom: -20,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 56,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: RoundedButton(
                      backgroundColor: AppColors.secondaryButtonColor,
                      callback: () {
                        Navigator.pop(context);
                      },
                      text: 'Subscriber Panel',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
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
              'Advertise with us',
              Images.addIconNav,
              () {
                Navigator.pop(context);
              },
            ),
            _buildNavDrawerItem(
              l10n.settingsNav,
              Images.settingsIconNav,
              () {
                Navigator.pop(context);

                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const SettingsScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
            ),
            _buildNavDrawerItem(
              'Contact us',
              Images.contactUsIconNav,
              () {
                Navigator.pop(context);

                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const ContactUsScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 56,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: IconTextButton(
                text: 'Logout',
                icon: Images.logoutIconNav,
                callback: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {

                      Navigator.pop(context);

                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const TermsOfUsePage(),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );

                    },
                    child: const Text(
                      'Terms of Use',
                      style: TextStyle(color: AppColors.blackColor),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {

                      Navigator.pop(context);

                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const PrivacyPolicyPage(),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );

                    },
                    child: const Text(
                      'Privacy Policy',
                      style: TextStyle(color: AppColors.blackColor),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);

                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const PaymentPolicyPage(),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );
                    },
                    child: const Text(
                      'Payment Policy',
                      style: TextStyle(color: AppColors.blackColor),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const FAQPage(),
                        withNavBar: false,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    child: const Text(
                      'FAQs',
                      style: TextStyle(color: AppColors.blackColor),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
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
