import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/widgets.dart';

class MediaPicker extends StatefulWidget {
  const MediaPicker({
    required this.label,
    required this.action,
    required this.onTap,
    super.key});

  final String label;
  final String action;

  final VoidCallback onTap;


  @override
  State<MediaPicker> createState() => _MediaPickerState();
}

class _MediaPickerState extends State<MediaPicker> {

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Widgets.labels(context, widget.label),
        const SizedBox(
          height: 10,
        ),

        //rounded corner border upload button with dashed lines
        InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: widget.onTap,
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(16),
            padding: EdgeInsets.zero,
            color: AppColors.greyColor,
            child: Container(
              width: width,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.greyColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(Images.uploadIcon),
                  const SizedBox(width: 8),
                  Text(
                    widget.action,
                    style: context.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}
