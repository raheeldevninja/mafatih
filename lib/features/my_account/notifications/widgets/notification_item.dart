import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/features/my_account/notifications/model/notification_model.dart';

class NotificationItem extends StatefulWidget {
  const NotificationItem({
    required this.notification,
    required this.onTap,
    super.key});

  final NotificationModel notification;
  final VoidCallback onTap;

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: widget.notification.isRead ? AppColors.whiteColor : AppColors.primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.notification.title,
                style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600
                ),
              ),

              const SizedBox(height: 10),

              Text(
                widget.notification.description,
                style: context.textTheme.bodySmall,
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${widget.notification.time}, ${widget.notification.date}',
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
