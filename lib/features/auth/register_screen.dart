import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/AppTextField.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
        surfaceTintColor: Colors.transparent,
        title: Text(l10n.register, style: const TextStyle(fontWeight: FontWeight.w500)),
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
      body: Column(
        children: [

          ///header
          Container(
            height: 50,
            decoration: const BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(l10n.registerAccountSubHeading),
              ],
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

                  Widgets.labels(l10n.phoneNoLabel),
                  const SizedBox(
                    height: 10,
                  ),

                  TextFormField(
                    controller: _phoneNumberController,
                    maxLines: 1,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.secondaryColor,
                      contentPadding: const EdgeInsets.all(12.0),
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          const SizedBox(width: 16),

                          InkWell(
                            onTap: () {
                              _showCountryCodeBottomSheet();
                            },
                            child: const Text('+966', style: TextStyle(color: Colors.grey)),),

                          Container(
                            height: 20,
                            width: 1,
                            color: Colors.grey,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                          ),

                        ],
                      ),
                      hintText: '',
                      hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.3), width: 1.0),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.lightGrey, width: 1.0),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
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

                  Widgets.labels(l10n.fullNameLabel),
                  const SizedBox(
                    height: 10,
                  ),

                  AppTextField(
                      controller: _fullNameController,
                      keyboardType: TextInputType.text,
                      hintText: l10n.optionalHint,
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

                  Widgets.labels(l10n.emailLabel),
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
                      }
                      else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                          .hasMatch(value)) {
                        return l10n.invalidEmailValidation;
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

                  TextFormField(
                    controller: _passwordController,
                    obscureText: obscurePassword,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.secondaryColor,
                      contentPadding: const EdgeInsets.all(12.0),
                      hintText: l10n.passwordHint,
                      hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                        icon: Icon(
                          obscurePassword ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.3), width: 1.0),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.lightGrey, width: 1.0),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    validator: (value) {

                      if (value == null || value.isEmpty) {
                        return l10n.emptyPasswordValidation;
                      }
                      else if (value.length < 6) {
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

                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: obscureConfirmPassword,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.secondaryColor,
                      contentPadding: const EdgeInsets.all(12.0),
                      hintText: l10n.confirmPasswordHint,
                      hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureConfirmPassword = !obscureConfirmPassword;
                          });
                        },
                        icon: Icon(
                          obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.3), width: 1.0),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.lightGrey, width: 1.0),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    validator: (value) {

                      if (value == null || value.isEmpty) {
                        return l10n.emptyPasswordValidation;
                      }
                      else if (value.length < 6) {
                        return l10n.passwordLengthValidation;
                      }
                      else if (value != _passwordController.text) {
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
                      text: l10n.register,
                      callback: () {

                        if (_formKey.currentState!.validate()) {

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
                      Text(l10n.alreadyHaveAccount),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(l10n.login, style: const TextStyle(color: AppColors.primaryColor, decoration: TextDecoration.underline),  )
                      ),
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
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

}
