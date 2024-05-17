import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property_type_model.dart';
import 'package:mafatih/core/ui/app_text_field.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/ui/type_item.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class PropertyDetailPage extends StatefulWidget {
  const PropertyDetailPage({super.key});

  @override
  State<PropertyDetailPage> createState() => _PropertyDetailPageState();
}

class _PropertyDetailPageState extends State<PropertyDetailPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _propertyTitleController = TextEditingController();
  final _addressController = TextEditingController();

  List<PropertyTypeModel> propertyTypesList = [];

  String _selectedRentOrSell = 'Sell';
  String _selectedPropertyType = 'Residential';

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

    return Column(
      children: [
        Header(
          height: 20,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Container(
                width: 24,
                height: 10,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),

              const SizedBox(width: 8.0),

              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 1,
                  ),
                ),
              ),
            ],
          ),
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

                      Text(l10n.addPropertyHeading, style: context.textTheme.titleLarge,),

                      const SizedBox(height: 20),

                      Widgets.labels(context, l10n.iWantToLabel),
                      const SizedBox(
                        height: 10,
                      ),

                      Row(
                        children: [
                          // Radio button for "Buy"
                          Radio<String>(
                            value: l10n.sellRadioLabel,
                            groupValue: _selectedRentOrSell,
                            activeColor: AppColors.primaryColor,
                            onChanged: (value) {
                              setState(() {
                                _selectedRentOrSell = value!;
                              });
                            },
                          ),
                          Text(l10n.sellRadioLabel),
                          // Radio button for "Rent"
                          Radio<String>(
                            value: l10n.rentRadioLabel,
                            groupValue: _selectedRentOrSell,
                            activeColor: AppColors.primaryColor,
                            onChanged: (value) {
                              setState(() {
                                _selectedRentOrSell = value!;
                              });
                            },
                          ),
                          Text(l10n.rentRadioLabel),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Widgets.labels(context, l10n.propertyTypeLabel),
                      const SizedBox(
                        height: 10,
                      ),

                      Row(
                        children: [
                          // Radio button for "Buy"
                          Radio<String>(
                            value: l10n.residentialRadioLabel,
                            groupValue: _selectedPropertyType,
                            activeColor: AppColors.primaryColor,
                            onChanged: (value) {
                              setState(() {
                                _selectedPropertyType = value!;
                              });
                            },
                          ),
                          Text(l10n.residentialRadioLabel),
                          // Radio button for "Rent"
                          Radio<String>(
                            value: l10n.commercialRadioLabel,
                            groupValue: _selectedPropertyType,
                            activeColor: AppColors.primaryColor,
                            onChanged: (value) {
                              setState(() {
                                _selectedPropertyType = value!;
                              });
                            },
                          ),
                          Text(l10n.commercialRadioLabel),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Widgets.labels(context, l10n.subPropertyType),
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
                            return TypeItem(
                              propertyType: propertyTypesList[index],
                              onTap: () {
                                for (int i = 0;
                                i < propertyTypesList.length;
                                i++) {
                                  if (i == index) {
                                    propertyTypesList[i] =
                                        propertyTypesList[i]
                                            .copyWith(isSelected: true);
                                  } else {
                                    propertyTypesList[i] =
                                        propertyTypesList[i]
                                            .copyWith(isSelected: false);
                                  }
                                }

                                setState(() {});
                              },
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 20),

                      Widgets.labels(context, l10n.propertyLabel),
                      const SizedBox(
                        height: 10,
                      ),

                      AppTextField(
                        controller: _propertyTitleController,
                        keyboardType: TextInputType.text,
                        hintText: l10n.propertyHint,
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

                      Widgets.labels(context, l10n.addressLabel),
                      const SizedBox(
                        height: 10,
                      ),

                      AppTextField(
                        controller: _addressController,
                        keyboardType: TextInputType.text,
                        hintText: l10n.addressHint,
                        validator: (value) {

                          return null;
                        },
                      ),


                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: SimpleButton(
                          text: l10n.nextBtnText,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {

                            }
                          },
                        ),
                      ),

                      const SizedBox(height: 20),


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
    );
  }
}

