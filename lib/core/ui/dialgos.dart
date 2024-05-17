import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/statistics_item.dart';
import 'package:mafatih/features/home/pages/services/widgets/services_item.dart';
import 'package:mafatih/features/property_check/propety_check_screen.dart';
import 'package:mafatih/features/valuate_property/valuate_property_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

sealed class Dialogs {
  const Dialogs._();

  static Future<bool> showTestDialog(BuildContext context) {
    return _showConfirmDialog(
      context,
      title: 'Unlock task',
      message: 'This task is locked. In order to be selected, '
          'it needs to be unlocked first. Do you want to proceed?',
      confirmText: 'Unlock',
    );
  }

  static Future showServicesDialog(BuildContext context, AppLocalizations l10n) async {
    return await showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(32.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  const SizedBox(height: 40),
                  Text(
                    l10n.servicesItemLabel,
                    style: context.textTheme.titleMedium,
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        ServicesItem(
                          onTap: () {

                            Navigator.pop(context);

                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const PropertyCheckScreen(),
                              withNavBar: false,
                              pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                            );

                          },
                          title: l10n.propertyCheckItemLabel,
                          icon: Images.propertyCheckServicesIcon,
                        ),

                        const SizedBox(height: 16),

                        ServicesItem(
                          onTap: () {
                            Navigator.pop(context);

                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const ValuatePropertyScreen(),
                              withNavBar: false,
                              pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                            );
                          },
                          title: l10n.valuatePropertyItemLabel,
                          icon: Images.valuatePropertyServicesIcon,
                        ),

                        const SizedBox(height: 16),

                        ServicesItem(
                          onTap: () {

                            Navigator.pop(context);

                          },
                          title: l10n.homeFinancingItemLabel,
                          icon: Images.homeFinancingServicesIcon,
                        ),

                        const SizedBox(height: 16),

                        ServicesItem(
                          onTap: () {},
                          title: l10n.homeInsuranceItemLabel,
                          icon: Images.homeInsuranceServicesIcon,
                        ),

                      ],
                    ),
                  ),



                ],
              ),
            ),


            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 30,
                height: 30,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.greyColor.withOpacity(0.4)),
                ),
                child: Center(
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.close, size: 20),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  static Future showStatisticsDialog(BuildContext context, AppLocalizations l10n) async {
    return await showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(32.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  const SizedBox(height: 48),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Average price per meter',
                          style: context.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        StatisticsItem(
                          title: 'Average price per meter',
                          value: '1,500',
                        ),

                        SizedBox(height: 16),

                        StatisticsItem(
                          title: 'Residential Villa',
                          value: '1,500',
                        ),

                        SizedBox(height: 16),

                        StatisticsItem(
                          title: 'Residential Apartment',
                          value: '4,500',
                        ),

                        SizedBox(height: 16),

                        StatisticsItem(
                          title: 'Residential Land',
                          value: '3,000',
                        ),

                        SizedBox(height: 16),

                        StatisticsItem(
                          title: 'Commercial Land',
                          value: '3,000',
                        ),


                      ],
                    ),
                  ),



                ],
              ),
            ),


            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 30,
                height: 30,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.greyColor.withOpacity(0.4)),
                ),
                child: Center(
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.close, size: 20),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }


  static Future<bool> _showConfirmDialog(
    BuildContext context, {
    required String title,
    required String message,
    required String confirmText,
    bool isDelete = false,
  }) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.secondaryColor,
            ),
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor:
                  isDelete ? AppColors.redColor : AppColors.secondaryColor,
            ),
            onPressed: () => Navigator.pop(context),
            child: Text(
              confirmText,
            ),
          ),
        ],
      ),
    );
  }
}
