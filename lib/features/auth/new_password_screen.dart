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

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({required this.phone, required this.otp, super.key});

  final String phone;
  final String otp;

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
        backgroundColor: AppColors.secondaryBgColor,
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          title: l10n.newPasswordTitle,
          onTapBackButton: () {
            Navigator.pop(context);
          },
        ),
        body: authProvider.isLoading
            ? const FormPageShimmer(shimmersCount: 2)
            : ListView(
                children: [
                  Header(
                    content: Text(
                      l10n.newPasswordSubTitle,
                      style: context.textTheme.bodyMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Widgets.labels(context, l10n.passwordLabel),
                          const SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            controller: _passwordController,
                            keyboardType: TextInputType.text,
                            hintText: l10n.passwordHint,
                            isPassword: true,
                            obscureText: obscurePassword,
                            visibilityCallback: () {
                              setState(() {
                                obscurePassword = !obscurePassword;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return l10n.emptyPasswordValidation;
                              } else if (value.length < 6) {
                                return l10n.passwordLengthValidation;
                              }

                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Widgets.labels(context, l10n.confirmPassword),
                          const SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            controller: _confirmPasswordController,
                            keyboardType: TextInputType.text,
                            hintText: l10n.passwordHint,
                            isPassword: true,
                            obscureText: obscureConfirmPassword,
                            visibilityCallback: () {
                              setState(() {
                                obscureConfirmPassword =
                                    !obscureConfirmPassword;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return l10n.emptyPasswordValidation;
                              } else if (value.length < 6) {
                                return l10n.passwordLengthValidation;
                              } else if (value != _passwordController.text) {
                                return l10n.passwordDoNotMatch;
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
              text: l10n.resetBtnText,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  /*Utils.showSimpleDialog(context, l10n.resetPasswordTitle,
                      l10n.resetPasswordMessage, () {
                  });*/

                  authProvider.resetPassword(
                    context,
                    widget.phone,
                    widget.otp,
                    _passwordController.text.trim(),
                    _confirmPasswordController.text.trim(),
                  );
                }
              },
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();

    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }
}
