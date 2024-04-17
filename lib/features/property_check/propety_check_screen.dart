import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/app_text_field.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/main_heading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:mafatih/features/property_check/model/property_type_model.dart';


class PropertyCheckScreen extends StatefulWidget {
  const PropertyCheckScreen({super.key});

  @override
  State<PropertyCheckScreen> createState() => _PropertyCheckScreenState();
}

class _PropertyCheckScreenState extends State<PropertyCheckScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _propertyLocationController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _reasonsController = TextEditingController();

  String selectedCountryCode = '+966';
  bool isTermsAndPrivacyChecked = false;

  List<PropertyTypeModel> propertyTypesList = [];

  @override
  void initState() {
    super.initState();

    _initPropertyTypesList();
  }

  _initPropertyTypesList() {

    propertyTypesList.add(
      PropertyTypeModel(icon: Images.villaIcon, title: 'Apartment', isSelected: true),
    );

    propertyTypesList.add(
      PropertyTypeModel(icon: Images.villaIcon, title: 'Villa'),
    );

    propertyTypesList.add(
      PropertyTypeModel(icon: Images.villaIcon, title: 'Land'),
    );

  }

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
        title: const Text(
          'Property Check',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
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
              child:
                  const Icon(Icons.arrow_back, color: AppColors.secondaryColor),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const Header(
            height: 20,
            content: SizedBox(),
          ),
          Expanded(
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                primary: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(Images.ayeenImage),
                            const SizedBox(width: 16),
                            const Expanded(
                              child: MainHeading(
                                  heading:
                                      'Get a technical report about your property'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const MainHeading(
                            heading:
                                'About your property'),

                        const SizedBox(height: 20),

                        Widgets.labels('Location of Your Property'),
                        const SizedBox(
                          height: 10,
                        ),

                        AppTextField(
                          controller: _propertyLocationController,
                          keyboardType: TextInputType.text,
                          hintText: 'Location of Your Property',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return l10n.emptyFullNameValidation;
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        Widgets.labels('Property Type'),
                        const SizedBox(
                          height: 10,
                        ),

                        SizedBox(
                          height: 130,
                          child: ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            itemCount: propertyTypesList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {

                                  for(int i=0; i<propertyTypesList.length; i++) {
                                    if(i == index) {
                                      propertyTypesList[i] = propertyTypesList[i].copyWith(isSelected: true);
                                    } else {
                                      propertyTypesList[i] = propertyTypesList[i].copyWith(isSelected: false);
                                    }

                                  }

                                  setState(() {});
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: propertyTypesList[index].isSelected
                                            ? AppColors.primaryColor
                                            : AppColors.lightGrey.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: SvgPicture.asset(
                                        propertyTypesList[index].icon,
                                        color: propertyTypesList[index].isSelected
                                            ? Colors.white
                                            : Colors.black,

                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    Text(
                                      propertyTypesList[index].title,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Montserrat',
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 20),

                        Widgets.labels('Upload construction license'),
                        const SizedBox(
                          height: 10,
                        ),

                        //rounded corner border upload button with dashed lines

                        DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(16),
                          padding: EdgeInsets.zero,
                          color: AppColors.greyColor,
                          child: Container(
                            width: width,
                            height: 60,
                            decoration: BoxDecoration(
                              color: AppColors.greyColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                SvgPicture.asset(Images.uploadIcon),

                                const SizedBox(width: 8),
                                const Text(
                                  'Upload',
                                  style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        //allowed
                        const Text(
                          'Allowed: .pdf, .jpg, .jpeg',
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 12,
                          ),
                        ),


                        const SizedBox(height: 20),

                        Widgets.labels('Building Area'),
                        const SizedBox(
                          height: 10,
                        ),

                        //drop down for building area
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: AppColors.greyColor.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            underline: const SizedBox(),
                            value: 'Select Building Area',
                            items: <String>['Select Building Area', 'Sqm', '200 sqm', '300 sqm', '400 sqm', '500 sqm']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {});
                            },
                          ),
                        ),


                        const SizedBox(height: 20),

                        Widgets.labels('Reasons'),
                        const SizedBox(
                          height: 10,
                        ),

                        AppTextField(
                          controller: _reasonsController,
                          keyboardType: TextInputType.text,
                          maxLines: 4,
                          hintText: 'Why do you need to check your property?',
                          validator: (value) {
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),
                        const MainHeading(
                            heading:
                            'Contact Details'),


                        const SizedBox(height: 20),

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
                            } else if (!RegExp(
                                r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                                .hasMatch(value)) {
                              return l10n.invalidEmailValidation;
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        Widgets.labels(l10n.phoneNoLabel),
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

                            //rich text for terms of use and privacy policy

                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'I agree to the ',

                                    ),
                                    TextSpan(
                                      text: 'Terms of Use',
                                      style: TextStyle(
                                        color: AppColors.primaryColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                      // Define an onTap handler to launch a URL
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {

                                        },
                                    ),
                                    const TextSpan(
                                      text: ' and ',
                                    ),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: const TextStyle(
                                        color: AppColors.primaryColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                      // Define an onTap handler to launch a URL
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {

                                        },
                                    ),
                                    TextSpan(
                                      text: '.',
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),

                        const SizedBox(height: 20),

                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: SimpleButton(
                            text: 'Send',
                            callback: () {
                              if (_formKey.currentState!.validate()) {

                              }
                            },
                          ),
                        ),

                      ],
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

    _propertyLocationController.dispose();
    _phoneNumberController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _reasonsController.dispose();
  }

}
