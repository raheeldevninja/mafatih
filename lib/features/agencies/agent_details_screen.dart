import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/features/agencies/model/agency.dart';
import 'package:mafatih/features/agencies/widgets/agent_details_content.dart';


class AgentDetailsScreen extends StatefulWidget {
  const AgentDetailsScreen({
    required this.agent,
    super.key});

  final Agency agent;

  @override
  State<AgentDetailsScreen> createState() => _AgentDetailsScreenState();
}

class _AgentDetailsScreenState extends State<AgentDetailsScreen>  {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.secondaryColor,
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
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: SvgPicture.asset(
              width: 20,
              height: 20,
              Images.searchIcon,
            ),
          ),


        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(
            height: 100,
            content: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Image.asset(
                      widget.agent.logo,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      widget.agent.agentName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SvgPicture.asset(Images.starIcon),
                  const SizedBox(width: 8),
                  SvgPicture.asset(Images.verifiedIcon),
                ],
              ),
            ),
          ),

          const Expanded(child: AgentDetailsContent()),

        ],
      ),
    );
  }
}
