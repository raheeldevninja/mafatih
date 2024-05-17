import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class FullScreenImageViewer extends StatefulWidget {
  const FullScreenImageViewer({
    required this.images,
    required this.initialIndex,
    super.key,
  });

  final List<File>? images;
  final int initialIndex;

  @override
  State<FullScreenImageViewer> createState() => _FullScreenImageViewerState();
}

class _FullScreenImageViewerState extends State<FullScreenImageViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        elevation: 0,
      ),
      body: PhotoViewGallery.builder(
        backgroundDecoration: BoxDecoration(color: AppColors.blackColor.withOpacity(0.8)),
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: FileImage(widget.images![index]),
            initialScale: PhotoViewComputedScale.contained * 0.8,
            heroAttributes:
                PhotoViewHeroAttributes(tag: widget.images![index]),
          );
        },
        itemCount: widget.images!.length,
        loadingBuilder: (context, event) => const Center(
          child: SizedBox(
            width: 20.0,
            height: 20.0,
            child: CupertinoActivityIndicator(),
          ),
        ),
        pageController: PageController(initialPage: widget.initialIndex),
        onPageChanged: (index) {
          setState(() {});
        },
      ),
    );
  }
}
