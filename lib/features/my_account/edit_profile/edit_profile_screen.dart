import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/app_text_field.dart';
import 'package:mafatih/core/ui/custom_app_bar.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/shimmers/form_page_shimmer.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/features/auth/model/profile_data.dart';
import 'package:mafatih/features/auth/view_model/auth_provider.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _phoneNumberController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  String selectedCountryCode = '+966';

  @override
  void initState() {
    super.initState();

    _initUserDetails();
  }

  _initUserDetails() async {

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final user = authProvider.getUserData;

    log('userData in edit profile: ${jsonEncode(user.toJson())}');

    _phoneNumberController.text = user.phone ?? '';
    _fullNameController.text = user.fullName ?? '';
    _emailController.text = user.email ?? '';

  }

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;
    final height = MediaQuery.of(context).size.height;

    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: l10n.editProfileTitle,
        onTapBackButton: () {
          Navigator.pop(context);
        },
      ),
      body: authProvider.isLoading ? const FormPageShimmer() :Column(
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
                  Widgets.labels(context, l10n.phoneNoLabel),
                  const SizedBox(
                    height: 10,
                  ),

                  AppTextField(
                    isReadOnly: true,
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    hintText: '',
                    isPhone: true,
                    countryPickerCallback: _showCountryCodeBottomSheet,
                    validator: (value) {

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
                    hintText: l10n.emailHint,
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
                      if (value != null  && value.isNotEmpty && value.length < 6) {
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
                     if (value != null && value.isNotEmpty && value.length < 6) {
                        return l10n.passwordLengthValidation;
                      } else if (value != _passwordController.text) {
                        return l10n.passwordDoNotMatch;
                      }

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
                      text: l10n.updateProfileBtnText,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {

                          String fullName = _fullNameController.text.trim();
                          String email = _emailController.text.trim();
                          String password = _passwordController.text.trim();
                          String confirmPassword = _confirmPasswordController.text.trim();

                          ProfileData profileData = ProfileData(
                            fullName: fullName,
                            email: email,
                            password: password.isEmpty ? null : password,
                            confirmPassword: confirmPassword.isEmpty ? null : confirmPassword,
                          );

                          authProvider.updateProfile(
                            context,
                            profileData,
                          );

                        }
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

    _phoneNumberController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }
}
