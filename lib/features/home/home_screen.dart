import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/dialgos.dart';
import 'package:mafatih/core/util/utils.dart';
import 'package:mafatih/features/home/pages/add/add_page.dart';
import 'package:mafatih/features/home/pages/chat/chat_page.dart';
import 'package:mafatih/features/home/pages/explore/explore_page.dart';
import 'package:mafatih/features/home/pages/listing/listing_page.dart';
import 'package:mafatih/features/home/pages/services/services_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int lastPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      onItemSelected: (int pageNo) {

        if(pageNo == 4) {

          Dialogs.showServicesDialog(context);
          Utils.controller.jumpToTab(lastPage);

          return;
        }

        setState(() {
          lastPage = pageNo;
        });

      },

      controller: Utils.controller,
      navBarHeight: 70,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: false,

      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: null,

      /*ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),*/
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15,

    );
  }

  List<Widget> _buildScreens() {
    return [
      const ExplorePage(),
      const AddPage(),
      const ListingPage(),
      const ChatPage(),
      const ServicesPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    final l10n = AppLocalizations.of(context)!;

    return [
      _buildBottomNavBarItem(icon: Images.exploreIcon, title: l10n.exploreNav),
      _buildBottomNavBarItem(icon: Images.addIcon, title: l10n.addNav),
      _buildBottomNavBarItem(
          icon: Images.listingIcon, title: l10n.listingNav, isListing: true),
      _buildBottomNavBarItem(icon: Images.chatIcon, title: l10n.chatNav),
      _buildBottomNavBarItem(
          icon: Images.servicesIcon, title: l10n.servicesNav),
    ];
  }

  PersistentBottomNavBarItem _buildBottomNavBarItem(
      {required String icon, required String title, bool isListing = false}) {
    return PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        icon,
        color: isListing ? AppColors.secondaryColor : AppColors.activeIcon,
      ),
      inactiveIcon: SvgPicture.asset(
        icon,
        color: isListing ? AppColors.secondaryColor : AppColors.inactiveIcon,
      ),
      title: title,
      activeColorPrimary:
          isListing ? AppColors.primaryColor : AppColors.activeIcon,
      inactiveColorPrimary: AppColors.inactiveIcon,
    );
  }
}
