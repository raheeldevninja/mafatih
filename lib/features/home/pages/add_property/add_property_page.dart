import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/features/home/pages/add_property/pages/property_details_page.dart';
import 'package:mafatih/features/home/pages/add_property/pages/property_media_upload_page.dart';

class AddPropertyPage extends StatefulWidget {
  const AddPropertyPage({super.key});

  @override
  State<AddPropertyPage> createState() => _AddPropertyPageState();
}

class _AddPropertyPageState extends State<AddPropertyPage> {

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        surfaceTintColor: Colors.transparent,
        title: Text(
          l10n.addPropertyTitle,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (page) {},
        children: const [

          PropertyDetailPage(),
          PropertyMediaUploadPage(),

        ],
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();

  }

}

