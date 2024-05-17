import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/full_screen_image_viewer.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class SelectedPropertyImages extends StatefulWidget {
  const SelectedPropertyImages({
    required this.propertyImages,
    super.key,
  });

  final List<File>? propertyImages;

  @override
  State<SelectedPropertyImages> createState() => _SelectedPropertyImagesState();
}

class _SelectedPropertyImagesState extends State<SelectedPropertyImages> {
  @override
  Widget build(BuildContext context) {
    return widget.propertyImages == null
        ? const SizedBox()
        : Column(
          children: [
            Wrap(
                children: [
                  for (var image in widget.propertyImages!)
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            //open full screen image viewer
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: FullScreenImageViewer(
                                  images: widget.propertyImages,
                                  initialIndex:
                                      widget.propertyImages!.indexOf(image)),
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
                                image: DecorationImage(
                                  image: FileImage(image),
                                  fit: BoxFit.cover,
                                ),
                              ),
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
                                  widget.propertyImages!.remove(image);
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
}
