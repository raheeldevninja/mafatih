import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/main_heading.dart';
import 'package:mafatih/features/agencies/agent_details_screen.dart';
import 'package:mafatih/features/agencies/model/agency.dart';
import 'package:mafatih/features/agencies/widgets/agency_item.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class AgentsScreen extends StatefulWidget {
  const AgentsScreen({super.key});

  @override
  State<AgentsScreen> createState() => _AgentsScreenState();
}

class _AgentsScreenState extends State<AgentsScreen> {
  List<Agency> agenciesList = [];

  @override
  void initState() {
    super.initState();

    _initAgentsList();
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
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.secondaryColor,
        title: const Text('Agencies'),
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
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child:
                  const Icon(Icons.arrow_back, color: AppColors.secondaryColor),
            ),
          ),
        ),
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
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MainHeading(
                    heading: 'Real Estate Agencies in Saudia Arabia'),
                const SizedBox(height: 10),
                const Text(
                  '10 agencies available in Saudia Arabia',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  primary: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: agenciesList.length,
                  itemBuilder: (context, index) {
                    return AgencyItem(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen:
                              AgentDetailsScreen(agent: agenciesList[index]),
                          withNavBar: false,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                      agent: agenciesList[index],
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
