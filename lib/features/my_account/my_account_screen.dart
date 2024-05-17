import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/custom_app_bar.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/features/auth/view_model/auth_provider.dart';
import 'package:mafatih/features/my_account/complains/complains_screen.dart';
import 'package:mafatih/features/my_account/edit_profile/edit_profile_screen.dart';
import 'package:mafatih/features/my_account/favourite_properties/favourite_properties_screen.dart';
import 'package:mafatih/features/my_account/notifications/notifications_screen.dart';
import 'package:mafatih/features/my_account/view_records/view_records_screen.dart';
import 'package:mafatih/features/notes/notes_screen.dart';
import 'package:mafatih/features/payment/payment_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'property_requests/property_requests_screen.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final authProvider = Provider.of<AuthProvider>(context);
    final isUserLoggedIn = authProvider.isLoggedIn;

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: l10n.myAccountTitle,
        onTapBackButton: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(
              height: 240,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor.withOpacity(0.2),
                    ),
                    child: SvgPicture.asset(Images.myAccountIcon),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    authProvider.getUserData.fullName ?? 'Abed Kabalan',
                    style: context.textTheme.bodyLarge,
                  ),

                  TextButton(
                    onPressed: isUserLoggedIn
                        ? () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const EditProfileScreen(),
                              withNavBar: false,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          }
                        : null,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          l10n.editProfileBtnText,
                          style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            decorationColor: isUserLoggedIn
                                ? AppColors.primaryColor
                                : AppColors.greyColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        SvgPicture.asset(
                          Images.rightArrowIcon,
                          color: isUserLoggedIn
                              ? AppColors.primaryColor
                              : AppColors.greyColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  _buildListTile(
                    context,
                    text: l10n.complainsMyAccount,
                    icon: Images.complainsAccountIcon,
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const ComplainsScreen(),
                        withNavBar: true,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                  _buildListTile(
                    context,
                    text: l10n.propertyRequestMyAccount,
                    icon: Images.propertyRequestAccountIcon,
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const PropertyRequestsScreen(),
                        withNavBar: true,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                  _buildListTile(
                    context,
                    text: l10n.favoritePropertiesMyAccount,
                    icon: Images.favouritePropertiesAccountIcon,
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const FavouritePropertiesScreen(),
                        withNavBar: true,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                  _buildListTile(
                    context,
                    text: l10n.bookingsMyAccount,
                    icon: Images.bookingsAccountIcon,
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const PaymentScreen(),
                        withNavBar: false,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                  _buildListTile(
                    context,
                    text: l10n.myNotesMyAccount,
                    icon: Images.myNotesAccountIcon,
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const NotesScreen(),
                        withNavBar: false,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                  _buildListTile(
                    context,
                    text: l10n.viewRecordsMyAccount,
                    icon: Images.viewRecordsAccountIcon,
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const ViewRecordsScreen(),
                        withNavBar: false,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                  _buildListTile(
                    context,
                    text: l10n.notifications,
                    icon: Images.notificationsAccountIcon,
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const NotificationsScreen(),
                        withNavBar: false,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  _buildListTile(
    BuildContext context, {
    required String text,
    required String icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: SvgPicture.asset(
        width: 20,
        height: 20,
        icon,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 20,
      ),
      title: Text(
        text,
        style: context.textTheme.bodyMedium,
      ),
      onTap: onTap,
    );
  }
}
