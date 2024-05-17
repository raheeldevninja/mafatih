import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/custom_app_bar.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/main_heading.dart';
import 'package:mafatih/features/agencies/agency_details_screen.dart';
import 'package:mafatih/features/agencies/model/agency.dart';
import 'package:mafatih/features/agencies/view_model/agency_provider.dart';
import 'package:mafatih/features/agencies/widgets/agency_item.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AgenciesScreen extends StatefulWidget {
  const AgenciesScreen({super.key});

  @override
  State<AgenciesScreen> createState() => _AgenciesScreenState();
}

class _AgenciesScreenState extends State<AgenciesScreen> {
  List<Agency> agenciesList = [];

  @override
  void initState() {
    super.initState();

    //_initAgentsList();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final agencyProvider = Provider.of<AgencyProvider>(context, listen: false);
      await agencyProvider.getAgencies(context, 1, 0);
    });

  }

  _initAgentsList() {
    agenciesList.add(
      Agency(
        logo: Images.agentLogo,
        agentName: 'Eskan Salman Real Estate Company',
        description:
            'We aspire to be a distinguished company at the local level by providing real estate at the best prices and in multiple places.',
        saleCount: 1849,
        rentCount: 6,
      ),
    );

    agenciesList.add(
      Agency(
        logo: Images.agentLogo,
        agentName: 'Menassat Realty Co',
        description:
            'We aspire to be a distinguished company at the local level by providing real estate at the best prices and in multiple places.',
        saleCount: 5600,
        rentCount: 34,
      ),
    );

    agenciesList.add(
      Agency(
        logo: Images.agentLogo,
        agentName: 'Menassat Realty Co',
        description:
            'We aspire to be a distinguished company at the local level by providing real estate at the best prices and in multiple places.',
        saleCount: 1009,
        rentCount: 12,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;
    final agencyProvider = Provider.of<AgencyProvider>(context);
    final agencies = agencyProvider.agenciesResponse?.agenciesAndPagination?.agenciesList;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: l10n.agenciesTitle,
        onTapBackButton: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(
            height: 20,
            content: SizedBox(),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16.0),
              children: [
                MainHeading(heading: l10n.agenciesHeading),
                const SizedBox(height: 10),
                Text(
                  l10n.agenciesSubHeading,
                  style: context.textTheme.bodyLarge
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  primary: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: agencies!.length,
                  itemBuilder: (context, index) {

                    return AgencyItem(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen:
                              AgencyDetailsScreen(agent: agencies![index]),
                          withNavBar: false,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                      agent: agencies[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
