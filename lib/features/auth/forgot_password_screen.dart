import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/app_text_field.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/util/utils.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:mafatih/features/auth/verify_otp_screen.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _phoneNumberController = TextEditingController();

  String selectedCountryCode = '+966';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    print('language: ${l10n.localeName}');

    return Scaffold(
        backgroundColor: AppColors.secondaryBgColor,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: AppColors.secondaryColor,
          surfaceTintColor: Colors.transparent,
          title: Text(l10n.forgotPasswordHeading,
              style: const TextStyle(fontWeight: FontWeight.w500)),
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
                child: const Icon(Icons.arrow_back,
                    color: AppColors.secondaryColor),
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            Header(content: Text(l10n.verifyNumberLabel)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Widgets.labels(l10n.phoneNoLabel),
                    const SizedBox(
                      height: 10,
                    ),

                    //rounded corner with border text form field
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
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: SimpleButton(
              text: l10n.verifyBtnText,
              callback: () {
                if (_formKey.currentState!.validate()) {
                  Utils.showCustomSnackBar(
                      context, 'OTP sent', ContentType.success);

                  ///navigate to verify otp screen
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const VerifyOTPScreen(),
                    ),
                  );
                }
              },
            ),
          ),
        ));
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

    _phoneNumberController.dispose();
  }
}
