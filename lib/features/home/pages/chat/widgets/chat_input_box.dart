import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatInputBox extends StatelessWidget {
  const ChatInputBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Container(
      height: 50,
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 40),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(60),
        border: Border.all(
          width: 1.5,
          color: AppColors.lightGrey.withOpacity(0.1),
        ),
      ),
      child: Row(
        children: [

          InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                Images.attachmentIcon,
                width: 24,
                height: 24,
                color: AppColors.primaryColor,
              ),
            ),
          ),

          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                //color: AppColors.lightGrey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                  fillColor: Colors.transparent,
                  hintText: l10n.chatHint,
                  hintStyle: const TextStyle(
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              Images.sendIcon,
              width: 24,
              height: 24,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}