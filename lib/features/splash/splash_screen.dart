import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/apis.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/main_logo.dart';
import 'package:mafatih/core/util/shared_pref.dart';
import 'package:mafatih/features/auth/login_screen.dart';
import 'package:mafatih/features/auth/view_model/auth_provider.dart';
import 'package:mafatih/features/choose_language/choose_language_screen.dart';
import 'package:mafatih/features/home/home_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool animate = false;

  @override
  void initState() {
    super.initState();

    _initUserData();
    _startAnimation();
  }

  _initUserData() async {

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.getUserDataFromSharedPref();
    await authProvider.getTokenFromSharedPref();
    await authProvider.getLoginStatusFromSharedPref();


    //log('_initUserData token: ${APIs.token}');

  }

  Future _startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    await Future.delayed(const Duration(milliseconds: 3000));
    _navigateToChooseLangScreen();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Center(
        child: Stack(
          children: [

            AnimatedPositioned(
              duration: const Duration(milliseconds: 2000),
              left: 0,
              right: 0,
              top: animate ? 0 : -100,
              bottom: 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: animate ? 1 : 0,
                child: const Center(
                  child: MainLogo(),
                ),
              ),
            ),

            AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: animate ? 0 : -100,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: animate ? 1 : 0,
                child: SvgPicture.asset(
                  Images.splashBg,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  _navigateToChooseLangScreen() async {

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final hasChooseLanguageScreenShown = await SharedPref.isChooseLanguageScreenShown();
    final hasUserLoggedIn = authProvider.getIsLoggedIn;
    final isLoggedInSkipped = await SharedPref.isLoginSkipped();
    final token = authProvider.getToken;


    //log('hasUserLoggedIn splash: $hasUserLoggedIn');
    authProvider.saveLoginStatusToSharedPref(hasUserLoggedIn);

    if (hasChooseLanguageScreenShown) {
      if (hasUserLoggedIn || isLoggedInSkipped) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    } else {
      Future.delayed(
        const Duration(seconds: 3),
        () async {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const ChooseLanguageScreen(),
            ),
          );
        },
      );
    }
  }

}
