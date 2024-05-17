import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/app_text_field.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/features/home/pages/listing/choose_from_map_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchByLocationBottomSheet extends StatefulWidget {
  const SearchByLocationBottomSheet({super.key});

  @override
  State<SearchByLocationBottomSheet> createState() => _SearchByLocationBottomSheetState();
}

class _SearchByLocationBottomSheetState extends State<SearchByLocationBottomSheet> {

  //search by location
  final _cityAndDistrictController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Container(
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                l10n.searchByLocationHeading,
                style: context.textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextField(
            controller: _cityAndDistrictController,
            keyboardType: TextInputType.text,
            hintText: l10n.cityDistrictHint,
            validator: (value) {},
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///use current location button
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      Images.currentLocationIcon,
                      width: 20,
                      height: 20,
                      color: AppColors.greyColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      l10n.userCurrentLocation,
                      style: context.textTheme.bodySmall?.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ),

              ///choose from map button
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
                    const SizedBox(width: 4),
                    Text(
                      l10n.chooseFromMapBtnText,
                      style: context.textTheme.bodySmall?.copyWith(
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
          const Spacer(),
          SizedBox(
            width: double.maxFinite,
            height: 50,
            child: SimpleButton(
              text: l10n.searchBtnText,
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
