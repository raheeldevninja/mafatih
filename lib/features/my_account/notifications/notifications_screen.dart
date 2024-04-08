import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/features/my_account/notifications/model/notification_model.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {

  List<NotificationModel> notifications = [];

  @override
  void initState() {

    super.initState();

    initNotifications();
  }

  initNotifications() {
    notifications = [
      NotificationModel(
        title: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: '4:23 pm, Today',
        date: 'Today',
      ),
      NotificationModel(
        title: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: '4:23 pm, Today',
        date: 'Today',
      ),
      NotificationModel(
        title: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: '4:23 pm, Today',
        date: 'Today',
      ),
      NotificationModel(
        title: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: '4:23 pm, Today',
        date: 'Today',
      ),
      NotificationModel(
        title: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: '4:23 pm, Today',
        date: 'Today',
      ),
    ];
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
        title: const Text('Notifications'),
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

            //show all and mark as all read buttons in row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //show all button
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Show All',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.blackColor,
                      ),
                    ),
                  ),

                  //mark all as read button
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Mark All as Read',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.blackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //notification list
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      setState(() {
                        notifications[index] = notifications[index].copyWith(isRead: true);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: notifications[index].isRead ? AppColors.whiteColor : AppColors.primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notifications[index].title,
                            style: const TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            notifications[index].description,
                            style: const TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${notifications[index].time}, ${notifications[index].date}',
                                style: const TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
