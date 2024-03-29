import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/AppTextField.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/features/auth/new_password_screen.dart';


class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key});

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _otpController = TextEditingController();

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
        title: Text(l10n.otpVerificationHeading, style: const TextStyle(fontWeight: FontWeight.w500)),
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
              child: const Icon(Icons.arrow_back, color: AppColors.secondaryColor),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [

          Header(content: Text(l10n.verifyOTPSubTitle)),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [

                  Widgets.labels(l10n.otpCodeLabel),
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
                    alignment: l10n.localeName == 'en' ? Alignment.centerRight : Alignment.centerLeft,
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
            callback: () {

              if (_formKey.currentState!.validate()) {

                ///Navigate to new password screen
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NewPasswordScreen(),
                  ),
                );

              }

            },
          ),
        ),
      )
    );
  }

  @override
  void dispose() {
    super.dispose();

    _otpController.dispose();
  }

}
