import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/models/main_menu.dart';
import 'package:mafatih/core/util/utils.dart';


class MainListItem extends StatefulWidget {

  const MainListItem({
    required this.mainMenu,
    super.key});

  final MainMenu mainMenu;

  @override
  State<MainListItem> createState() => _MainListItemState();
}

class _MainListItemState extends State<MainListItem> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        setState(() {
          Utils.mainMenu.forEach((element) {
            element.isSelected = false;
          });
          widget.mainMenu.isSelected = true;
        });

      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Row(
              children: [

                ///icon
                SvgPicture.asset(
                  width: 20,
                  height: 20,
                  widget.mainMenu.icon,
                  color: widget.mainMenu.isSelected ? AppColors.primaryColor : AppColors.primaryTextColor,
                ),

                const SizedBox(width: 4),

                Text(
                  widget.mainMenu.title,
                  style: TextStyle(
                    color: widget.mainMenu.isSelected ? AppColors.blackColor : AppColors.greyColor,
                    fontSize: 13,
                    fontWeight: widget.mainMenu.isSelected ? FontWeight.w500 : FontWeight.normal,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            ///selected indicator
            Container(
              height: 2,
              width: 90,
              color: widget.mainMenu.isSelected ? AppColors.primaryColor : Colors.transparent,
            ),

          ],
        ),
      ),
    );
  }
}
