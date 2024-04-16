import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/features/home/pages/services/widgets/services_item.dart';

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

  static Future showServicesDialog(BuildContext context) async {
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
                  const Text(
                    'Services',
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        ServicesItem(
                          onTap: () {},
                          title: 'Property Check',
                          icon: Images.propertyCheckServicesIcon,
                        ),

                        const SizedBox(height: 16),

                        ServicesItem(
                          onTap: () {},
                          title: 'Valuate Property',
                          icon: Images.valuatePropertyServicesIcon,
                        ),

                        const SizedBox(height: 16),

                        ServicesItem(
                          onTap: () {},
                          title: 'Home Financing',
                          icon: Images.homeFinancingServicesIcon,
                        ),

                        const SizedBox(height: 16),

                        ServicesItem(
                          onTap: () {},
                          title: 'Home Insurance',
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
