import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/util/utils.dart';
import 'package:mafatih/features/home/pages/listing/widgets/main_list_item.dart';
import 'package:mafatih/features/home/pages/listing/widgets/map_icon.dart';


class ListingPage extends StatefulWidget {
  const ListingPage({super.key});

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
        leading: IconButton(
          onPressed: () {

          },
          icon: SvgPicture.asset(
            Images.menuIcon,
            width: 24,
            height: 24,
          ),
        ),
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
      body: Stack(
        children: [

          Header(content: SizedBox(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Utils.mainMenu.length,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                return MainListItem(mainMenu: Utils.mainMenu[index]);
              },
            ),
          ),
          ),


          ///main content
          const Column(
            children: [

            ],
          ),

          ///top row selected location and distance icon buttons
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  MapIcon(
                    width: 100,
                    height: 40,
                    onTap: () {},
                    icon: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        SvgPicture.asset(
                          Images.selectedLocationIcon,
                        ),

                        const SizedBox(width: 8),

                        Expanded(child: Text('Riyadh' * 3, overflow: TextOverflow.ellipsis, maxLines: 1,),),

                      ],
                    ),
                  ),

                  MapIcon(
                    onTap: () {},
                    icon: SvgPicture.asset(
                      width: 20,
                      height: 20,
                      Images.distanceIcon,

                    ),
                  ),

                ],
              ),
            ),
          ),

          ///bottom row current location and search by location icon buttons
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  MapIcon(
                    onTap: () {},
                    icon: SvgPicture.asset(
                    width: 20,
                    height: 20,
                    Images.currentLocationIcon,

                  ),
                  ),

                  MapIcon(
                    onTap: () {},
                    icon: SvgPicture.asset(
                    width: 20,
                    height: 20,
                    Images.searchByLocationIcon,

                  ),
                  ),

                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}


