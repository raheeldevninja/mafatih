import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  bool obscureText = true;
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
        title: Text(l10n.login, style: const TextStyle(fontWeight: FontWeight.w500)),
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
                Text(l10n.loginSubTitle),
              ],
            ),
          ),

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

                  Widgets.labels(l10n.passwordLabel),
                  const SizedBox(
                    height: 10,
                  ),

                  TextFormField(
                    controller: _passwordController,
                    obscureText: obscureText,
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
                            obscureText = !obscureText;
                          });
                        },
                        icon: Icon(
                          obscureText ? Icons.visibility : Icons.visibility_off,
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
                    height: 10,
                  ),

                  //forgot password
                  Align(
                    alignment: l10n.language == 'en' ? Alignment.centerRight : Alignment.centerLeft,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.primaryColor,
                      ),
                      onPressed: () {},
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
                          onPressed: () {},
                          child: Text(l10n.signUpBtnText, style: const TextStyle(color: AppColors.primaryColor, decoration: TextDecoration.underline),  )
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
    _passwordController.dispose();
  }

}
