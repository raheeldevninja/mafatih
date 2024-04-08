import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/ui/main_heading.dart';
import 'package:mafatih/features/my_account/complains/complains_screen.dart';
import 'package:mafatih/features/my_account/favourite_properties/favourite_properties_screen.dart';
import 'package:mafatih/features/my_account/notifications/notifications_screen.dart';

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
              height: 200,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor.withOpacity(0.2),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 70,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const MainHeading(heading: 'Abed Kabalan'),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.error),
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
                  const Divider(
                    indent: 16,
                    endIndent: 16,
                    thickness: 0.5,
                    height: 0,
                  ),
                  ListTile(
                    leading: const Icon(Icons.edit_note),
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
                  const Divider(
                    height: 0,
                    indent: 16,
                    endIndent: 16,
                    thickness: 0.5,
                  ),
                  ListTile(
                    leading: const Icon(Icons.favorite),
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
                  const Divider(
                    height: 0,
                    indent: 16,
                    endIndent: 16,
                    thickness: 0.5,
                  ),
                  ListTile(
                    leading: const Icon(Icons.calendar_month),
                    title: const Text('Bookings'),
                    trailing: const Icon(Icons.arrow_forward_ios, size:20),
                    onTap: () {},
                  ),
                  const Divider(
                    height: 0,
                    indent: 16,
                    endIndent: 16,
                    thickness: 0.5,
                  ),
                  ListTile(
                    leading: const Icon(Icons.notes),
                    title: const Text('My notes'),
                    trailing: const Icon(Icons.arrow_forward_ios, size:20),
                    onTap: () {},
                  ),
                  const Divider(
                    height: 0,
                    indent: 16,
                    endIndent: 16,
                    thickness: 0.5,
                  ),
                  ListTile(
                    leading: const Icon(Icons.speaker_notes_rounded),
                    title: const Text('View Records'),
                    trailing: const Icon(Icons.arrow_forward_ios, size:20),
                    onTap: () {},
                  ),
                  const Divider(
                    height: 0,
                    indent: 16,
                    endIndent: 16,
                    thickness: 0.5,
                  ),
                  ListTile(
                    leading: const Icon(Icons.notifications),
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
                  const Divider(
                    height: 0,
                    indent: 16,
                    endIndent: 16,
                    thickness: 0.5,
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    trailing: const Icon(Icons.arrow_forward_ios, size:20),
                    onTap: () {},
                  ),
                  const Divider(
                    height: 0,
                    indent: 16,
                    endIndent: 16,
                    thickness: 0.5,
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
