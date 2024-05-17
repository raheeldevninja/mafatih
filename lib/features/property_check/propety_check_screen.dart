import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/app_text_field.dart';
import 'package:mafatih/core/ui/custom_app_bar.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/main_heading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/ui/property_type_list_view.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/ui/terms_and_privacy_links.dart';
import 'package:mafatih/core/ui/upload_file_image.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:mafatih/core/ui/building_area_drop_down.dart';
import 'package:mafatih/features/property_check/widgets/property_check_header.dart';


class PropertyCheckScreen extends StatefulWidget {
  const PropertyCheckScreen({super.key});

  @override
  State<PropertyCheckScreen> createState() => _PropertyCheckScreenState();
}

class _PropertyCheckScreenState extends State<PropertyCheckScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _propertyLocationController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _reasonsController = TextEditingController();

  String selectedCountryCode = '+966';
  bool isTermsAndPrivacyChecked = false;

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
      appBar: CustomAppBar(
        title: l10n.propertyCheckTitle,
        onTapBackButton: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          const Header(
            height: 20,
            content: SizedBox(),
          ),
          Expanded(
            child: Form(
              key: _formKey,
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

                        const PropertyCheckHeader(),

                        Widgets.labels(context, l10n.locationPropertyLabel),
                        const SizedBox(
                          height: 10,
                        ),

                        AppTextField(
                          controller: _propertyLocationController,
                          keyboardType: TextInputType.text,
                          hintText: l10n.locationPropertyHint,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return l10n.emptyFullNameValidation;
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),
                        const PropertyTypeListView(),
                        const SizedBox(height: 20),

                        Widgets.labels(context, l10n.uploadConstructionLabel),
                        const SizedBox(height: 10),
                        const UploadFileImage(),

                        const SizedBox(height: 20),
                        const BuildingAreaDropDown(),
                        const SizedBox(height: 20),

                        Widgets.labels(context, l10n.reasonsLabel),
                        const SizedBox(
                          height: 10,
                        ),

                        AppTextField(
                          controller: _reasonsController,
                          keyboardType: TextInputType.text,
                          maxLines: 4,
                          hintText: l10n.reasonsHint,
                          validator: (value) {
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),
                        MainHeading(heading: l10n.contactDetailsLabel),

                        const SizedBox(height: 20),

                        Widgets.labels(context, l10n.fullNameLabel),
                        const SizedBox(
                          height: 10,
                        ),

                        AppTextField(
                          controller: _fullNameController,
                          keyboardType: TextInputType.text,
                          hintText: l10n.fullNameHint,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return l10n.emptyFullNameValidation;
                            }
                            return null;
                          },
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        Widgets.labels(context, l10n.emailLabel),
                        const SizedBox(
                          height: 10,
                        ),

                        AppTextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: l10n.emailHint,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return l10n.emptyEmailValidation;
                            } else if (!RegExp(
                                    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                                .hasMatch(value)) {
                              return l10n.invalidEmailValidation;
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        Widgets.labels(context, l10n.phoneNoLabel),
                        const SizedBox(
                          height: 10,
                        ),

                        AppTextField(
                          controller: _phoneNumberController,
                          keyboardType: TextInputType.phone,
                          hintText: '',
                          isPhone: true,
                          countryPickerCallback: _showCountryCodeBottomSheet,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return l10n.emptyPhoneValidation;
                            }

                            return null;
                          },
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        Row(
                          children: [
                            Transform.scale(
                              scale: 1.8,
                              child: Checkbox(
                                value: isTermsAndPrivacyChecked,
                                side: const BorderSide(
                                  color: AppColors.greyColor,
                                ),
                                activeColor: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    isTermsAndPrivacyChecked = value!;
                                  });
                                },
                              ),
                            ),

                            //rich text for terms of use and privacy policy
                            const Expanded(
                              child: TermsAndPrivacyLinks(),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: SimpleButton(
                            text: l10n.sendBtnText,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {}
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCountryCodeBottomSheet() {
    final l10n = AppLocalizations.of(context)!;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 300,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(l10n.selectCountryCodeHeading),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: const Text('+966'),
                      onTap: () {
                        setState(() {
                          selectedCountryCode = '+966';
                        });

                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    _propertyLocationController.dispose();
    _phoneNumberController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _reasonsController.dispose();
  }
}
