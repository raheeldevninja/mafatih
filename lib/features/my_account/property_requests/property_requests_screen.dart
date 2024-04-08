import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/features/my_account/property_requests/model/property_request.dart';
import 'package:mafatih/features/my_account/property_requests/widgets/contact_count.dart';
import 'package:mafatih/features/my_account/property_requests/widgets/property_request_data.dart';


class PropertyRequestsScreen extends StatefulWidget {
  const PropertyRequestsScreen({super.key});

  @override
  State<PropertyRequestsScreen> createState() => _PropertyRequestsScreenState();
}

class _PropertyRequestsScreenState extends State<PropertyRequestsScreen> {
  List<PropertyRequest> propertyRequests = [];

  @override
  void initState() {
    super.initState();

    _initPropertyRequestsList();
  }

  _initPropertyRequestsList() {
    propertyRequests.add(
      PropertyRequest(
        requestNo: 066165,
        status: 'Pending',
        propertyUsage: 'Residnece',
        propertyType: 'Flat, apartment',
        region: 'Riyadh Region',
        propertyArea: '125 to 250',
        numberOfRooms: '10 to 15',
        price: '125k to 190k',
        moreDetails: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        engagedAgents: 2,
        calls: 4,
        emails: 8,
        whatsapp: 7,
      ),
    );

    propertyRequests.add(
      PropertyRequest(
        requestNo: 066165,
        status: 'Pending',
        propertyUsage: 'Residnece',
        propertyType: 'Flat, apartment',
        region: 'Riyadh Region',
        propertyArea: '125 to 250',
        numberOfRooms: '10 to 15',
        price: '125k to 190k',
        moreDetails: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        engagedAgents: 2,
        calls: 4,
        emails: 8,
        whatsapp: 7,
      ),
    );

    propertyRequests.add(
      PropertyRequest(
        requestNo: 066165,
        status: 'Pending',
        propertyUsage: 'Residnece',
        propertyType: 'Flat, apartment',
        region: 'Riyadh Region',
        propertyArea: '125 to 250',
        numberOfRooms: '10 to 15',
        price: '125k to 190k',
        moreDetails: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        engagedAgents: 2,
        calls: 4,
        emails: 8,
        whatsapp: 7,
      ),
    );
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
        title: const Text('Property Requests'),
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
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: propertyRequests.length,
              itemBuilder: (context, index) {
                return ColoredBox(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(horizontal: 8),
                    shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                    ),

                    title: Row(
                      children: [
                        const Text(
                          'Complain No: ',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            propertyRequests[index].requestNo.toString(),
                            style: const TextStyle(
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        const Text(
                          'Status: ',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),

                        //rounded corner container
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            propertyRequests[index].status,
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    children: [
                      PropertyRequestData(
                        title: 'Property Usage: ',
                        value: propertyRequests[index].propertyUsage,
                      ),

                      PropertyRequestData(
                        title: 'Property Type: ',
                        value: propertyRequests[index].propertyType,
                      ),

                      PropertyRequestData(
                        title: 'Region: ',
                        value: propertyRequests[index].region,
                      ),

                      PropertyRequestData(
                        title: 'Property Area: ',
                        value: propertyRequests[index].propertyArea,
                      ),

                      PropertyRequestData(
                        title: 'Number of Rooms: ',
                        value: propertyRequests[index].numberOfRooms,
                      ),

                      PropertyRequestData(
                        title: 'Price: ',
                        value: propertyRequests[index].price,
                      ),

                      ColoredBox(
                        color: AppColors.whiteColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'More Details',
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 8),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  propertyRequests[index].moreDetails,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            //rounded corner container
                            Row(
                              children: [
                                ContactCount(
                                  value: propertyRequests[index].calls.toString(),
                                  title: 'Engaged Agents',
                                ),
                                const SizedBox(width: 8),
                                ContactCount(
                                  value: propertyRequests[index].engagedAgents.toString(),
                                  title: 'Calls',
                                ),
                                const SizedBox(width: 8),

                                ContactCount(
                                  value: propertyRequests[index].emails.toString(),
                                  title: 'Emails',
                                ),
                                const SizedBox(width: 8),

                                ContactCount(
                                  value: propertyRequests[index].whatsapp.toString(),
                                  title: 'Whatsapp',
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}



