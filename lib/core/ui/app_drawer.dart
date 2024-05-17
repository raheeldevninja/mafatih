import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/ui/rounded_button.dart';
import 'package:mafatih/core/util/shared_pref.dart';
import 'package:mafatih/core/util/utils.dart';
import 'package:mafatih/features/agencies/agencies_screen.dart';
import 'package:mafatih/features/auth/login_screen.dart';
import 'package:mafatih/features/auth/view_model/auth_provider.dart';
import 'package:mafatih/features/contact_us/contact_us_screen.dart';
import 'package:mafatih/features/my_account/my_account_screen.dart';
import 'package:mafatih/features/settings/settings_screen.dart';
import 'package:mafatih/features/static_pages/faq_page.dart';
import 'package:mafatih/features/static_pages/payment_policy_page.dart';
import 'package:mafatih/features/static_pages/privacy_policy_page.dart';
import 'package:mafatih/features/static_pages/terms_of_use_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final languageCode = l10n.localeName;
    final isEnglishLang = languageCode == 'en';

    final authProvider = context.watch<AuthProvider>();

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
                  child:

                      //login / logout button
                      Container(
                    height: 56,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: RoundedButton(
                      onPressed: () async {
                        Navigator.pop(context);

                        if (authProvider.getIsLoggedIn) {

                          await SharedPref.clear();

                          authProvider.getTokenFromSharedPref();
                          authProvider.getUserDataFromSharedPref();
                          authProvider.getLoginStatusFromSharedPref();

                        } else {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const LoginScreen(),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        }
                      },
                      text: authProvider.getIsLoggedIn
                          ? l10n.logoutBtnText
                          : l10n.loginBtnText,
                      icon: Images.logoutIconNav,
                    ),
                  ),

                ),
              ],
            ),
            const SizedBox(height: 40),
            _buildNavDrawerItem(
              context,
              text: l10n.myAccountNav,
              icon: Images.accountIconNav,
              onTap: () {
                Navigator.pop(context);

                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const MyAccountScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );

              },
            ),
            _buildNavDrawerItem(
              context,
              text: l10n.agenciesNav,
              icon: Images.agentsIconNav,
              onTap: () {
                Navigator.pop(context);

                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const AgenciesScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
            ),
            _buildNavDrawerItem(
              context,
              text: l10n.settingsNav,
              icon: Images.settingsIconNav,
              onTap: () {
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
              context,
              text: l10n.contactUsNav,
              icon: Images.contactUsIconNav,
              onTap: () {
                Navigator.pop(context);

                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const ContactUsScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.slideUp,
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),

            //subscriber panel button
            Container(
              height: 56,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: RoundedButton(
                backgroundColor: AppColors.secondaryButtonColor,
                onPressed: () {
                  Navigator.pop(context);
                },
                text: l10n.subscriberPanelBtnText,
              ),
            ),


            const SizedBox(
              height: 8,
            ),

            //advertise with us button
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SizedBox(
                      width: 20,
                      height: 20,
                      child: SvgPicture.asset(
                        Images.addIconNav,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Text(
                      l10n.advertiseWithUsBtnText,
                      style: context.textTheme.labelMedium,
                    ),


                  ],
                ),
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
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    child: Text(
                      l10n.termsOfUseNav,
                      style: context.textTheme.bodySmall,
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
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    child: Text(
                      l10n.privacy_policy,
                      style: context.textTheme.bodySmall,
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
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    child: Text(
                      l10n.paymentPolicyNav,
                      style: context.textTheme.bodySmall,
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
                    child: Text(
                      l10n.faq,
                      style: context.textTheme.bodySmall,
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
    BuildContext context, {
    required String text,
    required String icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        width: 38,
        height: 38,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: SvgPicture.asset(
          icon,
        ),
      ),
      title: Text(
        text,
        style: context.textTheme.labelMedium,
      ),
      onTap: onTap,
    );
  }
}
