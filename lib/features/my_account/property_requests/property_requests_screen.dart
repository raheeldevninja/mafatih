import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/ui/custom_app_bar.dart';
import 'package:mafatih/core/ui/dismissible_tile.dart';
import 'package:mafatih/core/ui/empty_widget.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/ui/shimmers/list_shimmer.dart';
import 'package:mafatih/features/my_account/property_requests/view_model/property_requests_provider.dart';
import 'package:mafatih/features/my_account/property_requests/widgets/contact_counts.dart';
import 'package:mafatih/features/my_account/property_requests/widgets/property_request_data.dart';
import 'package:mafatih/features/my_account/property_requests/widgets/request_no_status.dart';
import 'package:provider/provider.dart';

class PropertyRequestsScreen extends StatefulWidget {
  const PropertyRequestsScreen({super.key});

  @override
  State<PropertyRequestsScreen> createState() => _PropertyRequestsScreenState();
}

class _PropertyRequestsScreenState extends State<PropertyRequestsScreen> {
  //List<PropertyRequest> propertyRequests = [];

  @override
  void initState() {
    super.initState();

    //_initPropertyRequestsList();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final propertyRequestsProvider =
          Provider.of<PropertyRequestsProvider>(context, listen: false);
      await propertyRequestsProvider.getPropertyRequests(context);
    });
  }

  /*_initPropertyRequestsList() {
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
  }*/

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final propertyRequestsProvider = context.watch<PropertyRequestsProvider>();

    final propertyRequests =
        propertyRequestsProvider.propertyRequestsResponse?.properties ?? [];


    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: l10n.propertyRequestsTitle,
        onTapBackButton: () {
          Navigator.pop(context);
        },
      ),
      body: propertyRequestsProvider.isLoading
          ? const ListShimmer(shimmerHeight: 60)
          : RefreshIndicator(
              onRefresh: () async {
                await propertyRequestsProvider.getPropertyRequests(context);
              },
              child: Column(
                children: [
                  const Header(
                    height: 20,
                    content: SizedBox(),
                  ),
                  Expanded(
                    child: propertyRequests.isEmpty
                        ? EmptyWidget(message: l10n.noPropertyRequestsLabel)
                        : ListView.builder(
                            shrinkWrap: true,
                            primary: true,
                            padding: const EdgeInsets.all(16),
                            itemCount: propertyRequests.length,
                            itemBuilder: (context, index) {

                              return DismissibleTile(
                                key: Key(propertyRequests[index].id.toString()),
                                onDeleteDismissed: () async {
                                  log('property request id deleting: ${propertyRequests[index].id!}');
                                  await propertyRequestsProvider.deletePropertyRequest(
                                      context, propertyRequests[index].id!);

                                  if (context.mounted) {
                                    await propertyRequestsProvider.getPropertyRequests(context);
                                  }
                                },
                                onDeleteConfirmDismiss: () {
                                  return Future.value(true);
                                },
                                child: Container(
                                  key: Key(propertyRequests[index].id.toString()),
                                  margin: const EdgeInsets.only(bottom: 8),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: ExpansionTile(
                                    tilePadding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                    shape: const RoundedRectangleBorder(
                                      side: BorderSide.none,
                                    ),
                                    title: RequestNoStatus(
                                        propertyRequest: propertyRequests[index]),
                                    children: [
                                      PropertyRequestData(
                                        title: l10n.propertyUsageLabel,
                                        value:
                                        '${propertyRequests[index].usage!.usageName}',
                                      ),
                                      PropertyRequestData(
                                        title: l10n.propertyTypeLabel,
                                        value:
                                        '${propertyRequests[index].typestext}',
                                      ),
                                      PropertyRequestData(
                                        title: l10n.regionLabel,
                                        value:
                                        '${propertyRequests[index].region}',
                                      ),
                                      PropertyRequestData(
                                        title: l10n.propertyAreaLabel,
                                        value:
                                        '${propertyRequests[index].areaFrom} to ${propertyRequests[index].areaTo}',
                                      ),
                                      PropertyRequestData(
                                        title: l10n.numberOfRoomsLabel,
                                        value:
                                        '${propertyRequests[index].numRoomsFrom} to ${propertyRequests[index].numRoomsTo}',
                                      ),
                                      PropertyRequestData(
                                        title: l10n.priceLabel,
                                        value:
                                        '${propertyRequests[index].priceFrom} to ${propertyRequests[index].priceTo}',
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.whiteColor,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4.0),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    l10n.moreDetailsLabel,
                                                    style:
                                                    context.textTheme.bodySmall,
                                                  ),
                                                ],
                                              ),

                                              const SizedBox(height: 8),

                                              Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      propertyRequests[index]
                                                          .details!,
                                                      style: context
                                                          .textTheme.bodySmall,
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              const SizedBox(height: 16),

                                              //rounded corner container
                                              ContactCounts(propertyRequest: propertyRequests[index]),

                                              const SizedBox(height: 16),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );

                              /*return Dismissible(
                                key: Key(propertyRequests[index].id.toString()),
                                dismissThresholds: const {
                                  DismissDirection.endToStart: 0.75,
                                },
                                direction: DismissDirection.endToStart,
                                background: Container(
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                    color: AppColors.redColor.withOpacity(0.2),

                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(Images.deleteIcon,
                                          width: 24, height: 24, color: AppColors.redColor),
                                    ],
                                  ),
                                ),
                                onDismissed: (direction) async {

                                  log('property request id deleting: ${propertyRequests[index].id!}');
                                  await propertyRequestsProvider.deletePropertyRequest(
                                      context, propertyRequests[index].id!);

                                  if (context.mounted) {
                                    await propertyRequestsProvider.getPropertyRequests(context);
                                  }

                                },
                                child: ColoredBox(
                                  key: Key(propertyRequests[index].id.toString()),
                                  color: AppColors.primaryColor.withOpacity(0.1),
                                  child: ExpansionTile(
                                    tilePadding:
                                        const EdgeInsets.symmetric(horizontal: 8),
                                    shape: const RoundedRectangleBorder(
                                      side: BorderSide.none,
                                    ),
                                    title: RequestNoStatus(
                                        propertyRequest: propertyRequests[index]),
                                    children: [
                                      PropertyRequestData(
                                        title: l10n.propertyUsageLabel,
                                        value:
                                            '${propertyRequests[index].usage!.usageName}',
                                      ),
                                      PropertyRequestData(
                                        title: l10n.propertyTypeLabel,
                                        value:
                                            '${propertyRequests[index].typestext}',
                                      ),
                                      PropertyRequestData(
                                        title: l10n.regionLabel,
                                        value:
                                            '${propertyRequests[index].region}',
                                      ),
                                      PropertyRequestData(
                                        title: l10n.propertyAreaLabel,
                                        value:
                                            '${propertyRequests[index].areaFrom} to ${propertyRequests[index].areaTo}',
                                      ),
                                      PropertyRequestData(
                                        title: l10n.numberOfRoomsLabel,
                                        value:
                                            '${propertyRequests[index].numRoomsFrom} to ${propertyRequests[index].numRoomsTo}',
                                      ),
                                      PropertyRequestData(
                                        title: l10n.priceLabel,
                                        value:
                                            '${propertyRequests[index].priceFrom} to ${propertyRequests[index].priceTo}',
                                      ),
                                      ColoredBox(
                                        color: AppColors.whiteColor,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  l10n.moreDetailsLabel,
                                                  style:
                                                      context.textTheme.bodySmall,
                                                ),
                                              ],
                                            ),

                                            const SizedBox(height: 8),

                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    propertyRequests[index]
                                                        .details!,
                                                    style: context
                                                        .textTheme.bodySmall,
                                                  ),
                                                ),
                                              ],
                                            ),

                                            const SizedBox(height: 16),

                                            //rounded corner container
                                            ContactCounts(
                                                propertyRequest:
                                                    propertyRequests[index]),

                                            const SizedBox(height: 16),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );*/
                            },
                          ),
                  ),
                ],
              ),
            ),
    );
  }
}

