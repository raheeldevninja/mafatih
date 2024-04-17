import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/features/static_pages/model/faq_model.dart';


class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  List<FAQModel> faqs = [];

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.secondaryColor,
        title: const Text('Privacy Policy'),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.backBtnColor,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child:
              const Icon(Icons.arrow_back, color: AppColors.secondaryColor),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(
              height: 20,
              content: SizedBox(),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus ut felis fermentum aliquet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus ut felis fermentum aliquet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus ut felis fermentum aliquet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus ut felis fermentum aliquet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus ut felis fermentum aliquet.'),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}



