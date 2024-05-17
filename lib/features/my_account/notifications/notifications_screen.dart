import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/ui/custom_app_bar.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/features/my_account/notifications/model/notification_model.dart';
import 'package:mafatih/features/my_account/notifications/widgets/notification_item.dart';


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
        title:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: '4:23 pm, Today',
        date: 'Today',
      ),
      NotificationModel(
        title:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: '4:23 pm, Today',
        date: 'Today',
      ),
      NotificationModel(
        title:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: '4:23 pm, Today',
        date: 'Today',
      ),
      NotificationModel(
        title:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: '4:23 pm, Today',
        date: 'Today',
      ),
      NotificationModel(
        title:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: '4:23 pm, Today',
        date: 'Today',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: l10n.notifications,
        onTapBackButton: () {
          Navigator.pop(context);
        },
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
                    child: Text(
                      l10n.showAllBtnText,
                      style: context.textTheme.bodyMedium?.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.blackColor,
                      ),
                    ),
                  ),

                  //mark all as read button
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      l10n.markAllReadBtnText,
                      style: context.textTheme.bodyMedium?.copyWith(
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
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 1000),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: NotificationItem(
                      onTap: () {
                        setState(() {
                          notifications[index] = notifications[index].copyWith(
                            isRead: true,
                          );
                        });
                      },
                      notification: notifications[index],
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
