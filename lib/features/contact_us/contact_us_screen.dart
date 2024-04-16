import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/app_text_field.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Contact Us',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
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
                padding: const EdgeInsets.all(16.0),
                shrinkWrap: true,
                primary: true,
                children: [

                  const Text(
                    'Get in touch with us',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 4,
                  ),

                  const Text(
                    'We will be happy to assist you.',
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),


                  Widgets.labels(l10n.fullNameLabel),
                  const SizedBox(
                    height: 10,
                  ),

                  AppTextField(
                    controller: _fullNameController,
                    keyboardType: TextInputType.text,
                    hintText: l10n.optionalHint,
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

                  Widgets.labels(l10n.phoneNoLabel),
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

                  Widgets.labels(l10n.emailLabel),
                  const SizedBox(
                    height: 10,
                  ),

                  AppTextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: l10n.optionalHint,
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

                  const SizedBox(
                    height: 20,
                  ),

                  Widgets.labels('Message'),
                  const SizedBox(
                    height: 10,
                  ),

                  AppTextField(
                    controller: _messageController,
                    keyboardType: TextInputType.text,
                    hintText: 'Enter your message',
                    maxLines: 4,
                    validator: (value) {
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
                      text: 'Submit',
                      callback: () {
                        if (_formKey.currentState!.validate()) {}
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
