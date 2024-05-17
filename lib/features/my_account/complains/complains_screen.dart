import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/custom_app_bar.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/ui/shimmers/list_shimmer.dart';
import 'package:mafatih/features/my_account/complains/model/complain.dart';
import 'package:mafatih/features/my_account/complains/view_model/complains_provider.dart';
import 'package:mafatih/features/my_account/complains/widgets/complain_item.dart';
import 'package:provider/provider.dart';

class ComplainsScreen extends StatefulWidget {
  const ComplainsScreen({super.key});

  @override
  State<ComplainsScreen> createState() => _ComplainsScreenState();
}

class _ComplainsScreenState extends State<ComplainsScreen> {
  //List<Complain> complains = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final complainsProvider = Provider.of<ComplainsProvider>(context, listen: false);
      await complainsProvider.getComplains(context);
    });

    //_initComplainsList();
  }

  /*_initComplainsList() {
    complains.add(
      Complain(
        complainNo: '134535',
        status: 'Pending',
        subject: 'Complain Subject',
        priority: 'High',
        message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      ),
    );

    complains.add(
      Complain(
        complainNo: '134535',
        status: 'Pending',
        subject: 'Complain Subject',
        priority: 'High',
        message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      ),
    );

    complains.add(
      Complain(
        complainNo: '134535',
        status: 'Pending',
        subject: 'Complain Subject',
        priority: 'High',
        message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      ),
    );

    complains.add(
      Complain(
        complainNo: '134535',
        status: 'Pending',
        subject: 'Complain Subject',
        priority: 'High',
        message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final complainsProvider = Provider.of<ComplainsProvider>(context);

    final complains = complainsProvider.complainsResponse?.complaints ?? [];

    print('complains: ${complains.length}');

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: l10n.complainsTitle,
        onTapBackButton: () {
          Navigator.pop(context);
        },
      ),
      body: complainsProvider.isLoading ? const ListShimmer() :
      RefreshIndicator(
        onRefresh: () async {
          await complainsProvider.getComplains(context);
        },
        child: Column(
          children: [
            const Header(
              height: 20,
              content: SizedBox(),
            ),
            complains.isEmpty ? Center(child: Text(l10n.noComplainsLabel)) : AnimationLimiter(
              child: Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16),
                  itemCount: complains.length,
                  itemBuilder: (context, index) {

                    return AnimationConfiguration.staggeredList(
                      position: index,
                      delay: const Duration(milliseconds: 100),
                      child: SlideAnimation(
                        duration: const Duration(milliseconds: 2500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: const Duration(milliseconds: 2500),
                          child: ComplainItem(complain: complains[index]),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
