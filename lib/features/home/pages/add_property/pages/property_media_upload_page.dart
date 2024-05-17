import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/features/home/pages/add_property/widgets/media_picker.dart';
import 'package:mafatih/features/home/pages/add_property/widgets/selected_property_images.dart';
import 'package:mafatih/features/home/pages/add_property/widgets/selected_property_videos.dart';
import 'package:mafatih/features/payment/payment_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class PropertyMediaUploadPage extends StatefulWidget {
  const PropertyMediaUploadPage({super.key});

  @override
  State<PropertyMediaUploadPage> createState() =>
      _PropertyMediaUploadPageState();
}

class _PropertyMediaUploadPageState extends State<PropertyMediaUploadPage> {
  List<File>? _propertyImages;
  List<File>? _propertyVideos;

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        Header(
          height: 20,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 1,
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Container(
                width: 24,
                height: 10,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            primary: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    MediaPicker(
                      label: l10n.uploadPropertyImagesLabel,
                      action: l10n.uploadImagesBtnText,
                      onTap: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          allowMultiple: true,
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'jpeg', 'png'],
                          allowCompression: true,
                        );

                        if (result != null) {
                          _propertyImages =
                              result.paths.map((path) => File(path!)).toList();
                        } else {
                          // User canceled the picker
                        }

                        setState(() {});
                      },

                    ),

                    const SizedBox(height: 16),

                    //picked images
                    SelectedPropertyImages(propertyImages: _propertyImages),

                    MediaPicker(
                      label: l10n.uploadVideosLabel,
                      action: l10n.uploadVideosBtnText,
                      onTap: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          allowMultiple: true,
                          type: FileType.video,
                          allowCompression: true,
                        );

                        if (result != null) {
                          _propertyVideos =
                              result.paths.map((path) => File(path!)).toList();
                        } else {
                          // User canceled the picker
                        }

                        setState(() {});
                      },

                    ),

                    const SizedBox(height: 20),

                    //picked videos
                    SelectedPropertyVideos(propertyVideos: _propertyVideos),

                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: SimpleButton(
                        text: l10n.submitBtnText,
                        onPressed: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const PaymentScreen(),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
