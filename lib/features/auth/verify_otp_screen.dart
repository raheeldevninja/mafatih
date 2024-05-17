import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/ui/app_text_field.dart';
import 'package:mafatih/core/ui/custom_app_bar.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/shimmers/form_page_shimmer.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/features/auth/view_model/auth_provider.dart';
import 'package:provider/provider.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({
    required this.phoneNumber,
    super.key});

  final String phoneNumber;

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
        backgroundColor: AppColors.secondaryBgColor,
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          title: l10n.otpVerificationHeading,
          onTapBackButton: () {
            Navigator.pop(context);
          },
        ),
        body:authProvider.isLoading ? const FormPageShimmer(shimmersCount: 2) :  ListView(
          children: [
            Header(
              content: Text(
                l10n.verifyOTPSubTitle,
                style: context.textTheme.bodyMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Widgets.labels(context, l10n.otpCodeLabel),
                    const SizedBox(
                      height: 10,
                    ),

                    AppTextField(
                      controller: _otpController,
                      keyboardType: TextInputType.number,
                      hintText: l10n.otpCodeHint,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return l10n.emptyOTPValidation;
                        }

                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    ///resend otp button
                    Align(
                      alignment: l10n.localeName == 'en'
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.primaryColor,
                        ),
                        onPressed: () {},
                        child: Text(l10n.resendOTPBtnText),
                      ),
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
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  authProvider.verifyOTP(context, widget.phoneNumber, _otpController.text.trim());
                }
              },
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();

    _otpController.dispose();
  }
}
