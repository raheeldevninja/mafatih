import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/video_player_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:video_player/video_player.dart';

class SelectedPropertyVideos extends StatefulWidget {
  const SelectedPropertyVideos({
    required this.propertyVideos,
    super.key,
  });

  final List<File>? propertyVideos;

  @override
  State<SelectedPropertyVideos> createState() => _SelectedPropertyVideosState();
}

class _SelectedPropertyVideosState extends State<SelectedPropertyVideos> {
  @override
  Widget build(BuildContext context) {
    return widget.propertyVideos == null
        ? const SizedBox()
        : Column(
          children: [
            Wrap(
                children: [
                  for (var video in widget.propertyVideos!)
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            //open full screen image viewer
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: VideoPlayerScreen(
                                videoFile: video,
                              ),
                              withNavBar: false,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: _buildInlineVideoPlayer(
                                  widget.propertyVideos!.indexOf(video)),
                            ),
                          ),
                        ),

                        //delete button
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              color: AppColors.whiteColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                color: AppColors.whiteColor,
                                onPressed: () {
                                  widget.propertyVideos!.remove(video);
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: AppColors.blackColor,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            const SizedBox(height: 20),
          ],
        );
  }

  Widget _buildInlineVideoPlayer(int index) {
    final VideoPlayerController controller =
        VideoPlayerController.file(File(widget.propertyVideos![index].path));
    const double volume = 1.0;
    controller.setVolume(volume);
    controller.initialize();

    return Center(
      child: AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(controller),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    if (widget.propertyVideos != null) {
      for (var video in widget.propertyVideos!) {
        video.delete();
      }
    }
  }
}
