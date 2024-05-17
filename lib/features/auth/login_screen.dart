import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/ui/app_text_field.dart';
import 'package:mafatih/core/ui/auth_choice.dart';
import 'package:mafatih/core/ui/custom_app_bar.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/shimmers/form_page_shimmer.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/util/shared_pref.dart';
import 'package:mafatih/features/auth/forgot_password_screen.dart';
import 'package:mafatih/features/auth/register_screen.dart';
import 'package:mafatih/features/auth/view_model/auth_provider.dart';
import 'package:mafatih/features/home/home_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _phoneNumberController = TextEditingController(text: '541191226');
  final _passwordController = TextEditingController(text: 'Ab@123123');

  bool obscureText = true;
  String selectedCountryCode = '+966';

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;
    final canGoBack = Navigator.canPop(context);

    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: l10n.login,
        canGoBack: canGoBack,
        onTapBackButton: () {
          if (canGoBack) {
            Navigator.pop(context);
          }
        },
        actions: [
          //skip button
          TextButton(
            onPressed: () async {

              await SharedPref.setLoginSkipped(true);

              if(context.mounted) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              }

            },
            child: Text(
              l10n.skipBtnText,
            ),
          ),
        ],
      ),
      body: authProvider.isLoading ? const FormPageShimmer() :
      ListView(
        children: [
          Header(
            content: Text(
              l10n.loginSubTitle,
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Widgets.labels(context, l10n.phoneNoLabel),
                  const SizedBox(height: 10),

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

                  Widgets.labels(context, l10n.passwordLabel),
                  const SizedBox(
                    height: 10,
                  ),

                  AppTextField(
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    hintText: l10n.passwordHint,
                    isPassword: true,
                    obscureText: obscureText,
                    visibilityCallback: () {
                      setState(() {
                        obscureText = !obscureText;
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
                    height: 10,
                  ),

                  //forgot password
                  Align(
                    alignment: l10n.localeName == 'en'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(l10n.forgotPassword),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: authProvider.isLoading ? const SizedBox() : Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //login button
            SizedBox(
              width: double.infinity,
              height: 60,
              child: SimpleButton(
                text: l10n.loginBtnText,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {

                    await authProvider.login(
                      context,
                      _phoneNumberController.text,
                      _passwordController.text,
                    );

                  }
                },
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            AuthChoice(
              label: l10n.dontHaveAccount,
              actionButtonLabel: l10n.signUpBtnText,
              onActionButtonPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                );
              },
            ),

            const SizedBox(
              height: 10,
            ),
          ],
        ),
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
    _passwordController.dispose();
  }
}

