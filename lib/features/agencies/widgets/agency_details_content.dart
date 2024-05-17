import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/features/agencies/widgets/advisor_info_page.dart';
import 'package:mafatih/features/agencies/widgets/agents_page.dart';
import 'package:mafatih/features/agencies/widgets/description_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AgencyDetailsContent extends StatefulWidget {
  const AgencyDetailsContent({super.key});

  @override
  State<AgencyDetailsContent> createState() => _AgencyDetailsContentState();
}

class _AgencyDetailsContentState extends State<AgencyDetailsContent>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  final _labelStyle = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    ); // Set the number of tabs
  }

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.primaryColor,
          labelColor: AppColors.primaryColor,
          unselectedLabelColor: AppColors.inactiveTabColor,
          unselectedLabelStyle: _labelStyle,
          labelStyle: _labelStyle,
          indicator: UnderlineTabIndicator(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 4.0,
              color: AppColors.primaryColor,
            ),
          ),
          dividerColor: Colors.transparent,
          tabs: [
            Tab(text: l10n.advertiserInfoTabLabel),
            Tab(text: l10n.descriptionsTabLabel),
            Tab(text: l10n.agentsTabLabel),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          AdvisorInfoPage(),
          DescriptionPage(),
          AgentsPage(),
        ],
      ),
    );
  }
}
