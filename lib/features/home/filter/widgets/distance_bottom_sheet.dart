import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/app_text_field.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/features/home/pages/listing/choose_from_map_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DistanceBottomSheet extends StatefulWidget {
  const DistanceBottomSheet({super.key});

  @override
  State<DistanceBottomSheet> createState() => _DistanceBottomSheetState();
}

class _DistanceBottomSheetState extends State<DistanceBottomSheet> {
  final _startLocationController = TextEditingController();

  //estimated time and distance switch
  bool estimatedTimeDistanceSwitch = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Container(
        height: 340,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 5,
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: AppColors.greyColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.distanceHeading,
                  style: context.textTheme.titleMedium,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ChooseFromMapScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        Images.chooseMapIcon,
                        width: 20,
                        height: 20,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        l10n.chooseFromMapBtnText,
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 40,
            ),

            //start location
            Row(
              children: [
                Expanded(
                    child: AppTextField(
                  controller: _startLocationController,
                  keyboardType: TextInputType.text,
                  hintText: l10n.yourLocationHint,
                  validator: (value) {},
                )),
                const SizedBox(width: 10),
                SvgPicture.asset(
                  Images.currentLocationIcon,
                  width: 20,
                  height: 20,
                  color: AppColors.blackColor,
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.distanceLabel,
                          style: context.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600)),
                      Text('(${l10n.kilometerLabel})',
                          style: context.textTheme.bodySmall),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    setState(() {
                      estimatedTimeDistanceSwitch =
                          !estimatedTimeDistanceSwitch;
                    });
                  },
                  child: Container(
                    width: 66,
                    height: 36,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: AppColors.greyColor.withOpacity(0.4),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: estimatedTimeDistanceSwitch
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(Images.switchButtonIcon),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.estimatedTimeLabel,
                          style: context.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600)),
                      Text('(${l10n.minutesLabel})',
                          style: context.textTheme.bodySmall),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.maxFinite,
              height: 50,
              child: SimpleButton(
                text: l10n.calculateBtnText,
                onPressed: () {},
              ),
            ),
          ],
        ),
      );
    });
  }
}
