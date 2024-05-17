import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/app_text_field.dart';
import 'package:mafatih/core/ui/custom_app_bar.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/shimmers/form_page_shimmer.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/features/auth/view_model/auth_provider.dart';
import 'package:provider/provider.dart';


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
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
        backgroundColor: AppColors.secondaryBgColor,
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          title: l10n.forgotPasswordHeading,
          onTapBackButton: () {
            Navigator.pop(context);
          },
        ),
        body: authProvider.isLoading ? const FormPageShimmer(shimmersCount: 3) : ListView(
          children: [
            Header(content: Text(l10n.verifyNumberLabel)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Widgets.labels(context, l10n.phoneNoLabel),
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
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  /*Utils.showCustomSnackBar(
                      context, 'OTP sent', ContentType.success);*/

                  await authProvider.verifyPhone(context, _phoneNumberController.text.trim());


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
