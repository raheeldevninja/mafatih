import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/main_heading.dart';
import 'package:mafatih/features/agencies/agent_details_screen.dart';
import 'package:mafatih/features/agencies/model/agent.dart';
import 'package:mafatih/features/agencies/widgets/agent_item.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AgentsPage extends StatefulWidget {
  const AgentsPage({super.key});

  @override
  State<AgentsPage> createState() => _AgentsPageState();
}

class _AgentsPageState extends State<AgentsPage> {
  List<Agent> agentsList = [];


  @override
  void initState() {
    super.initState();

    _initAgentsList();
  }

  _initAgentsList() {
    agentsList.add(
      Agent(
        logo: Images.agentLogo,
        agentName: 'Shoug Saad',
        propertiesCount: 18,
        whatsAppNumber: '966 55 555 5555',
        mobileNumber: '966 55 555 5555',
        email: 'abc@gmail.com',
      ),
    );

    agentsList.add(
      Agent(
        logo: Images.agentLogo,
        agentName: 'Shoug Saad',
        propertiesCount: 18,
        whatsAppNumber: '966 55 555 5555',
        mobileNumber: '966 55 555 5555',
        email: 'abc@gmail.com',
      ),
    );
  }



  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return ColoredBox(
      color: AppColors.backgroundColor,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainHeading(heading: l10n.agentsListingLabel),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              primary: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: agentsList.length,
              itemBuilder: (context, index) {
                return AgentItem(
                  agent: agentsList[index],
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: AgentDetailsScreen(agent: agentsList[index]),
                      withNavBar: false,
                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    );

                  },
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
