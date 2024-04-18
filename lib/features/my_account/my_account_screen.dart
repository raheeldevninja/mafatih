import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/ui/main_heading.dart';
import 'package:mafatih/features/my_account/complains/complains_screen.dart';
import 'package:mafatih/features/my_account/edit_profile/edit_profile_screen.dart';
import 'package:mafatih/features/my_account/favourite_properties/favourite_properties_screen.dart';
import 'package:mafatih/features/my_account/notifications/notifications_screen.dart';
import 'package:mafatih/features/notes/notes_screen.dart';
import 'package:mafatih/features/property_check/propety_check_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

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

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.secondaryColor,
        title: const Text('My Account'),
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
                    child: SvgPicture.asset(
                      Images.myAccountIcon
                    )
                  ),
                  const SizedBox(height: 10),
                  const MainHeading(heading: 'Abed Kabalan'),
                  TextButton(
                    onPressed: () {

                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const EditProfileScreen(),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );

                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        SvgPicture.asset(Images.rightArrowIcon)
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
                  ListTile(
                    leading: SvgPicture.asset(
                      Images.complainsAccountIcon,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size:20),
                    title: const Text('Complains'),
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ComplainsScreen(),
                        ),
                      );

                    },
                  ),

                  ListTile(
                    leading: SvgPicture.asset(
                      Images.propertyRequestAccountIcon,
                    ),
                    title: const Text('Property Request'),
                    trailing: const Icon(Icons.arrow_forward_ios, size:20),
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PropertyRequestsScreen(),
                        ),
                      );

                    },
                  ),

                  ListTile(
                    leading: SvgPicture.asset(
                      Images.favouritePropertiesAccountIcon,
                    ),
                    title: const Text('Favorite Properties'),
                    trailing: const Icon(Icons.arrow_forward_ios, size:20),
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FavouritePropertiesScreen(),
                        ),
                      );

                    },
                  ),

                  ListTile(
                    leading: SvgPicture.asset(
                      Images.bookingsAccountIcon,
                    ),
                    title: const Text('Bookings'),
                    trailing: const Icon(Icons.arrow_forward_ios, size:20),
                    onTap: () {

                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const PropertyCheckScreen(),
                        withNavBar: false,
                        pageTransitionAnimation:
                        PageTransitionAnimation.cupertino,
                      );

                    },
                  ),

                  ListTile(
                    leading: SvgPicture.asset(
                      Images.myNotesAccountIcon,
                    ),
                    title: const Text('My notes'),
                    trailing: const Icon(Icons.arrow_forward_ios, size:20),
                    onTap: () {

                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const NotesScreen(),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );

                    },
                  ),

                  ListTile(
                    leading: SvgPicture.asset(
                      Images.viewRecordsAccountIcon,
                    ),
                    title: const Text('View Records'),
                    trailing: const Icon(Icons.arrow_forward_ios, size:20),
                    onTap: () {},
                  ),

                  ListTile(
                    leading: SvgPicture.asset(
                      Images.notificationsAccountIcon,
                    ),
                    title: const Text('Notifications'),
                    trailing: const Icon(Icons.arrow_forward_ios, size:20),
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationsScreen(),
                        ),
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
}
