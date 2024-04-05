import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/features/home/property_details/widgets/contact_option.dart';


class ContactOptions extends StatelessWidget {
  const ContactOptions({
    super.key,
  });

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
              onPressed: () {},
            ),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: ContactOption(
              backgroundColor: AppColors.whatsappBtnColor,
              icon: Images.whatsappIcon,
              onPressed: () {},
            ),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: ContactOption(
              backgroundColor: AppColors.messageBtnColor,
              icon: Images.messageIcon,
              onPressed: () {},
            ),
          ),

        ],
      ),

    );
  }
}