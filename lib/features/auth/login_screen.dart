import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/AppTextField.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/features/auth/forgot_password_screen.dart';
import 'package:mafatih/features/auth/register_screen.dart';
import 'package:mafatih/features/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _phoneNumberController = TextEditingController(text: '12345678');
  final _passwordController = TextEditingController(text: '12345678');

  bool obscureText = true;
  String selectedCountryCode = '+966';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final canGoBack = Navigator.canPop(context);

    print('language: ${l10n.localeName}');

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        title: Text(l10n.login,
            style: const TextStyle(fontWeight: FontWeight.w500)),
        centerTitle: true,
        leading: canGoBack
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
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
              )
            : null,
      ),
      body: ListView(
        children: [
          Header(content: Text(l10n.loginSubTitle)),
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

                  const SizedBox(
                    height: 20,
                  ),

                  Widgets.labels(l10n.passwordLabel),
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
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.primaryColor,
                      ),
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

                  SizedBox(
                    height: height * 0.25,
                  ),

                  //login button
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: SimpleButton(
                      text: l10n.loginBtnText,
                      callback: () {
                        if (_formKey.currentState!.validate()) {
                          ///Navigate to home screen
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        }
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(l10n.dontHaveAccount),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ),
                            );
                          },
                          child: Text(
                            l10n.signUpBtnText,
                            style: const TextStyle(
                                color: AppColors.primaryColor,
                                decoration: TextDecoration.underline),
                          )),
                    ],
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
    _passwordController.dispose();
  }
}
