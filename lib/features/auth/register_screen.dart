import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/ui/app_text_field.dart';
import 'package:mafatih/core/ui/auth_choice.dart';
import 'package:mafatih/core/ui/custom_app_bar.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/shimmers/form_page_shimmer.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/ui/terms_and_privacy_links.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/features/auth/model/register_data.dart';
import 'package:mafatih/features/auth/view_model/auth_provider.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _phoneNumberController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  String selectedCountryCode = '+966';

  bool isTermsAndPrivacyChecked = false;

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: l10n.register,
        onTapBackButton: () {
          Navigator.pop(context);
        },
      ),
      body: authProvider.isLoading ? const FormPageShimmer() : Column(
        children: [
          Header(
            content: Text(
              l10n.registerAccountSubHeading,
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                shrinkWrap: true,
                primary: true,
                children: [

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
                        obscureConfirmPassword = !obscureConfirmPassword;
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

                  const SizedBox(height: 20),

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
                      const Expanded(
                        child: TermsAndPrivacyLinks(),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  //register button
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: SimpleButton(
                      text: l10n.register,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {

                          RegisterData registrationData = RegisterData(
                            fullName: _fullNameController.text.trim(),
                            email: _emailController.text,
                            phone: _phoneNumberController.text.trim(),
                            password: _passwordController.text.trim(),
                            confirmPassword: _confirmPasswordController.text.trim(),
                            isTermsAccepted: isTermsAndPrivacyChecked,
                          );

                          await authProvider.register(
                            context,
                            registrationData,
                          );

                        }
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  AuthChoice(
                    label: l10n.alreadyHaveAccount,
                    actionButtonLabel: l10n.login,
                    onActionButtonPressed: () {
                      Navigator.pop(context);
                    },
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

    _phoneNumberController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }
}


