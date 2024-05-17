import 'package:flutter/material.dart';
import 'package:mafatih/core/app/apis.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/static_pages/view_model/static_pages_provider.dart';
import 'package:mafatih/core/ui/custom_app_bar.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/ui/shimmers/form_page_shimmer.dart';
import 'package:mafatih/core/util/utils.dart';
import 'package:provider/provider.dart';
import 'package:html/parser.dart' as htmlParser;

class PaymentPolicyPage extends StatefulWidget {
  const PaymentPolicyPage({super.key});

  @override
  State<PaymentPolicyPage> createState() => _PaymentPolicyPageState();
}

class _PaymentPolicyPageState extends State<PaymentPolicyPage> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final staticPagesProvider =
      Provider.of<StaticPagesProvider>(context, listen: false);
      await staticPagesProvider.getStaticPageContent(context, APIs.paymentPolicy);
    });

  }

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;
    final staticPagesProvider = context.watch<StaticPagesProvider>();

    String htmlString =
        staticPagesProvider.staticPageResponse?.data?.content ?? '';

    // Parse HTML
    final document = htmlParser.parse(htmlString);
    String parsedText = Utils.parseHtml(document);


    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: staticPagesProvider.getLoading
            ? ''
            : staticPagesProvider.staticPageResponse?.data?.title ?? '',
        onTapBackButton: () {
          Navigator.pop(context);
        },
      ),
      body: staticPagesProvider.getLoading
          ? const FormPageShimmer()
          : Column(
        children: [
          const Header(
            height: 20,
            content: SizedBox(),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(parsedText),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



