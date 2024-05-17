import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/features/home/pages/chat/model/chat_message.dart';

class UserMessage extends StatelessWidget {
  const UserMessage({
    required this.chat,
    super.key});

  final ChatMessageModel chat;

  @override
  Widget build(BuildContext context) {

    DateFormat formatter = DateFormat('h:mm a');
    String formattedTime = formatter.format(chat.time);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: chat.isSender ? AppColors.lightGrey.withOpacity(0.1) : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            chat.message,
            style: context.textTheme.bodySmall,
          ),
          const SizedBox(height: 4),
          Text(
            formattedTime,
            style: context.textTheme.bodySmall?.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
