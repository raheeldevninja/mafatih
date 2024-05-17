import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/ui/app_drawer.dart';
import 'package:mafatih/core/ui/bottom_sheets.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/features/home/pages/explore/widgets/daily_rentals_section.dart';
import 'package:mafatih/features/home/pages/explore/widgets/explore_page_banner.dart';
import 'package:mafatih/features/home/pages/explore/widgets/projects_section.dart';
import 'package:mafatih/features/home/pages/explore/widgets/properties_section.dart';
import 'package:mafatih/features/search/search_screen.dart';
import 'package:page_transition/page_transition.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
      key: _scaffoldKey,
      backgroundColor: AppColors.secondaryBgColor,
      drawer: const AppDrawer(),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.secondaryColor,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
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
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.bottomToTop,
                      child: const SearchScreen()));
            },
            icon: SvgPicture.asset(
              width: 20,
              height: 20,
              Images.searchIcon,
            ),
          ),
          IconButton(
            onPressed: () {
              BottomSheets.showFilterBottomSheet(context);
            },
            icon: SvgPicture.asset(
              width: 20,
              height: 20,
              Images.filterIcon,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Header(
              height: 20,
              content: SizedBox(),
            ),
            PropertiesSection(),
            DailyRentalsSection(),
            SizedBox(height: 20),
            ExplorePageBanner(),
            SizedBox(height: 8),
            ProjectsSection(),
          ],
        ),
      ),
    );
  }
}
