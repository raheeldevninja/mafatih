import 'package:flutter/material.dart';
import 'package:mafatih/core/ui/user_image.dart';
import 'package:mafatih/core/ui/user_message.dart';
import 'package:mafatih/core/util/utils.dart';
import 'package:mafatih/features/home/pages/chat/model/chat_message.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    required this.chat,
    this.isSender = true,
    super.key,
  });

  final bool isSender;
  final ChatMessageModel chat;

  @override
  Widget build(BuildContext context) {
    bool showSenderImage = false;
    ChatMessageModel previousMessage;
    int index = Utils.messages.indexOf(chat);

    if (index == 0) {
      previousMessage = chat;
    } else {
      previousMessage = Utils.messages[index - 1];
    }

    //get the previous message
    bool isFirstMessage = Utils.messages.indexOf(chat) == 0;

    if (isFirstMessage) {
      showSenderImage = true;
    } else {
      showSenderImage = !previousMessage.isSender;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: isSender
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //only show image for the first message
                if (isSender && showSenderImage)
                  UserImage(image: chat.image)
                else
                  const SizedBox(width: 70),

                Expanded(
                  child: UserMessage(chat: chat),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: UserMessage(chat: chat),
                ),
                if (!isSender && previousMessage.isSender)
                  UserImage(image: chat.image)
                else
                  const SizedBox(width: 70),
              ],
            ),
    );
  }
}
