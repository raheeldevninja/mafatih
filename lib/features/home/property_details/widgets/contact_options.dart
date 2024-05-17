import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/features/home/projects/schedule_screen.dart';
import 'package:mafatih/features/home/property_details/widgets/contact_option.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


class ContactOptions extends StatelessWidget {
  const ContactOptions({
    required this.onPhonePressed,
    required this.onWhatsappPressed,
    this.onMessagePressed,
    this.isProjectDetails = false,
    super.key,
  });

  final bool isProjectDetails;

  final VoidCallback onPhonePressed;
  final VoidCallback onWhatsappPressed;
  final VoidCallback? onMessagePressed;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [

          Expanded(
            child: ContactOption(
              backgroundColor: AppColors.phoneBtnColor,
              icon: Images.phoneIcon,
              onPressed: onPhonePressed,
            ),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: ContactOption(
              backgroundColor: AppColors.whatsappBtnColor,
              icon: Images.whatsappIcon,
              onPressed: onWhatsappPressed,
            ),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: isProjectDetails ?
            ContactOption(
              backgroundColor: AppColors.messageBtnColor,
              icon: Images.calendarIcon,
              onPressed: () {


                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const ScheduleScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );

              },
            ) :

            ContactOption(
              backgroundColor: AppColors.messageBtnColor,
              icon: Images.messageIcon,
              onPressed: onMessagePressed ?? () {},
            ),
          ),

        ],
      ),

    );
  }
}