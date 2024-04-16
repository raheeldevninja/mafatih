import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/main_heading.dart';
import 'package:mafatih/features/agencies/agent_property_request_screen.dart';
import 'package:mafatih/features/agencies/model/agent.dart';
import 'package:mafatih/features/agencies/widgets/agent_item.dart';
import 'package:mafatih/features/search/widgets/property_attribute.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

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
    return ColoredBox(
      color: AppColors.backgroundColor,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MainHeading(heading: 'Agents Listing'),
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
                      screen: const AgentPropertyRequestScreen(),
                      withNavBar: false,
                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    );

                  },
                );
              },
            ),
            const SizedBox(height: 16),
            const MainHeading(heading: 'Ads'),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.55,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              Images.propertyImagePng,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                'Appartment for rent',
                                style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Expanded(
                                    child: const PropertyAttribute(
                                      icon: Images.areaIcon,
                                      value: '90m2',
                                    ),
                                  ),

                                  const SizedBox(width: 4),

                                  Expanded(
                                    child: PropertyAttribute(
                                      icon: Images.bedIcon,
                                      value: '1',
                                    ),
                                  ),


                                  const SizedBox(width: 4),

                                  Expanded(
                                    child: PropertyAttribute(
                                      icon: Images.tvLoungeIcon,
                                      value: '2',
                                    ),
                                  ),

                                  const SizedBox(width: 4),

                                  Expanded(
                                    child: PropertyAttribute(
                                      icon: Images.bathIcon,
                                      value: '1',
                                    ),
                                  ),


                                ],
                              ),
                              const SizedBox(height: 8),
                              //price
                              Text(
                                '1000 SAR',
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    Images.selectedLocationIcon,
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'ZA Heights',
                                    style: const TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),

                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
