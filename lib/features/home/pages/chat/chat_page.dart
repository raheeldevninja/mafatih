import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/util/utils.dart';
import 'package:mafatih/features/home/pages/chat/widgets/chat_input_box.dart';
import 'package:mafatih/features/home/pages/chat/widgets/chat_message.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
        backgroundColor: AppColors.secondaryBgColor,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: AppColors.secondaryColor,
          surfaceTintColor: Colors.transparent,
          title: Text(
            l10n.chatTitle,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            //chat messages sender and receiver
            Expanded(
              child: ListView.builder(
                itemCount: Utils.messages.length,
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemBuilder: (context, index) {

                  return AnimationConfiguration.staggeredList(
                    delay: const Duration(milliseconds: 100),
                    position: index,
                    
                    child: SlideAnimation(
                      duration: const Duration(milliseconds: 2500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: FadeInAnimation(
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: const Duration(milliseconds: 2500),
                        child: ChatMessage(
                            chat: Utils.messages[index],
                            isSender: Utils.messages[index].isSender,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: const ChatInputBox());
  }
}
