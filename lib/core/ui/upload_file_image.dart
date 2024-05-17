import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';

class UploadFileImage extends StatefulWidget {
  const UploadFileImage({super.key});

  @override
  State<UploadFileImage> createState() => _UploadFileImageState();
}

class _UploadFileImageState extends State<UploadFileImage> {
  File? _selectedFile;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return _selectedFile == null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['pdf', 'jpg', 'jpeg'],
                  );

                  if (result != null) {
                    _selectedFile = File(result.files.single.path!);
                  } else {
                    // User canceled the picker
                  }

                  setState(() {});
                },
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
                          'Upload',
                          style: context.textTheme.bodyLarge
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              //allowed
              const Text(
                'Allowed: .pdf, .jpg, .jpeg',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 12,
                ),
              ),
            ],
          )
        : Row(
            children: [
              const Icon(Icons.file_copy_outlined),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  _selectedFile!.path.split('/').last,
                ),
              ),
              const SizedBox(width: 20),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.greyColor.withOpacity(0.2),
                  ),
                ),
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () {
                    _selectedFile = null;
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 20,
                  ),
                ),
              ),
            ],
          );
  }
}
