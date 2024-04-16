import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/app_text_field.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/util/utils.dart';
import 'package:mafatih/features/auth/login_screen.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

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

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: AppColors.secondaryBgColor,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: AppColors.secondaryColor,
          title: Text(l10n.newPasswordTitle,
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
            Header(content: Text(l10n.newPasswordSubTitle)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Widgets.labels(l10n.passwordLabel),
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
                    Widgets.labels(l10n.confirmPassword),
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
              callback: () {
                if (_formKey.currentState!.validate()) {
                  Utils.showSimpleDialog(context, l10n.resetPasswordTitle,
                      l10n.resetPasswordMessage, () {
                    //navigate to login screen and pop all screens
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                        (route) => false);
                  });
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
