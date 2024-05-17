import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/features/choose_language/widgets/choose_language_background.dart';
import 'package:mafatih/features/choose_language/widgets/choose_language_main_content.dart';

class ChooseLanguageScreen extends StatelessWidget {
  const ChooseLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Center(
        child: Stack(
          children: [

            ChooseLanguageBackground(),
            ChooseLanguageMainContent(),

          ],
        ),
      ),
    );
  }

}
