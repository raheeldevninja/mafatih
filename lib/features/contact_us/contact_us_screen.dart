import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/static_pages/view_model/static_pages_provider.dart';
import 'package:mafatih/core/ui/app_text_field.dart';
import 'package:mafatih/core/ui/custom_app_bar.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/shimmers/form_page_shimmer.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/features/contact_us/model/contact_us_data.dart';
import 'package:provider/provider.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _messageController = TextEditingController();

  String selectedCountryCode = '+966';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final height = MediaQuery.of(context).size.height;

    final staticPagesProvider = context.watch<StaticPagesProvider>();

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: l10n.contactUs,
        onTapBackButton: () {
          Navigator.pop(context);
        },
      ),
      body: staticPagesProvider.getLoading ? const FormPageShimmer() : Column(
        children: [
          const Header(
            height: 20,
            content: SizedBox(),
          ),
          Expanded(
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                shrinkWrap: true,
                primary: true,
                children: [
                  Text(
                    l10n.contactUsHeading,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 4),

                  Text(
                    l10n.contactUsSubHeading,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

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

                  Widgets.labels(context, l10n.emailLabel),
                  const SizedBox(
                    height: 10,
                  ),

                  AppTextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: l10n.emailHint,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        if (!RegExp(
                                r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                            .hasMatch(value)) {
                          return l10n.invalidEmailValidation;
                        }
                      }
                      else if(value!.isEmpty) {
                        return l10n.emptyEmailValidation;
                      }

                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Widgets.labels(context, l10n.messageLabel),
                  const SizedBox(
                    height: 10,
                  ),

                  AppTextField(
                    controller: _messageController,
                    keyboardType: TextInputType.text,
                    hintText: l10n.writeYourMessageHint,
                    maxLines: 4,
                    validator: (value) {

                      if (value!.isEmpty) {
                        return l10n.emptyMessageValidation;
                      }

                      return null;
                    },
                  ),

                  SizedBox(
                    height: height * 0.05,
                  ),

                  //register button
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: SimpleButton(
                      text: l10n.submitBtnText,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {

                          ContactUsData contactUsData = ContactUsData(
                            fullName: _fullNameController.text.trim(),
                            email: _emailController.text.trim(),
                            phone: _phoneNumberController.text.trim(),
                            message: _messageController.text.trim(),
                          );

                          await staticPagesProvider.contactUs(context, contactUsData);

                        }
                      },
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

    _fullNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _messageController.dispose();
  }
}
