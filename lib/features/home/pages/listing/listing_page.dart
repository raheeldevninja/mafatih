import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/util/utils.dart';


class ListingPage extends StatefulWidget {
  const ListingPage({super.key});

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;
    final languageCode = AppLocalizations.of(context)!.localeName;
    final isEnglishLang = languageCode == 'en';

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        centerTitle: true,
        title: SvgPicture.asset(
          width: 50,
          height: 50,
          isEnglishLang ? Images.mafatihLogoEn : Images.mafatihLogoAr,
        ),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: SvgPicture.asset(
              width: 20,
              height: 20,
              Images.searchIcon,
            ),
          ),

          IconButton(
            onPressed: () {

            },
            icon: SvgPicture.asset(
              width: 20,
              height: 20,
              Images.filterIcon,
            ),
          ),

          const SizedBox(width: 10,)

        ],
      ),
      body: Column(
        children: [

          Header(content: SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Utils.mainMenu.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {

                    setState(() {
                      Utils.mainMenu.forEach((element) {
                        element.isSelected = false;
                      });
                      Utils.mainMenu[index].isSelected = true;
                    });

                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [


                        Row(
                          children: [

                            //icon
                            SvgPicture.asset(
                              width: 20,
                              height: 20,
                              Utils.mainMenu[index].icon,
                            ),

                            const SizedBox(width: 4),

                            Text(
                              Utils.mainMenu[index].title,
                              style: const TextStyle(
                                color: AppColors.primaryTextColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        //selected indicator
                        Container(
                          height: 2,
                          width: 90,
                          color: Utils.mainMenu[index].isSelected ? AppColors.primaryColor : Colors.transparent,
                        ),


                      ],
                    ),
                  ),
                );
              },
            ),
          ),),


        ],
      ),
    );
  }
}
