import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/ui/app_text_field.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:mafatih/features/agencies/model/neighborhood.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AgentPropertyRequestScreen extends StatefulWidget {
  const AgentPropertyRequestScreen({super.key});

  @override
  State<AgentPropertyRequestScreen> createState() =>
      _AgentPropertyRequestScreenState();
}

class _AgentPropertyRequestScreenState
    extends State<AgentPropertyRequestScreen> {
  String _selectedPropertyUsage = 'For Buy';
  String _selectedPropertyType = 'Apartment';
  String _selectedRegion = 'Region 1';
  String _selectedCity = 'City 1';

  final _neighbourhoodController = TextEditingController();
  final _propertyAreaFromController = TextEditingController();
  final _propertyAreaToController = TextEditingController();
  final _noOfRoomsFromController = TextEditingController();
  final _noOfRoomsToController = TextEditingController();
  final _priceFromController = TextEditingController();
  final _priceToController = TextEditingController();
  final _moreDetailsController = TextEditingController();

  List<Neighborhood> keywordsList = [];

  bool isTermsAndPrivacyChecked = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        surfaceTintColor: Colors.transparent,
        title: Text(
          l10n.propertyRequestTitle,
          style: context.textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(
            height: 16,
            content: SizedBox(),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [

                Text(
                  l10n.propertyRequestHeading,
                  style: context.textTheme.titleMedium,
                ),

                Row(
                  children: [
                    // Radio button for "Buy"
                    Radio<String>(
                      value: l10n.forBuyRadioLabel,
                      groupValue: _selectedPropertyUsage,
                      activeColor: AppColors.primaryColor,
                      onChanged: (value) {
                        setState(() {
                          _selectedPropertyUsage = value!;
                        });
                      },
                    ),
                    Text(l10n.forBuyRadioLabel),
                    // Radio button for "Rent"
                    Radio<String>(
                      value: l10n.forRentRadioLabel,
                      groupValue: _selectedPropertyUsage,
                      activeColor: AppColors.primaryColor,
                      onChanged: (value) {
                        setState(() {
                          _selectedPropertyUsage = value!;
                        });
                      },
                    ),
                    Text(l10n.forRentRadioLabel),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),

                Widgets.labels(context, l10n.propertyUsageLabel),
                const SizedBox(
                  height: 10,
                ),

                Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.borderColor,
                      width: 1,
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: _selectedPropertyUsage,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined,
                        size: 24),
                    isExpanded: true,
                    iconSize: 24,
                    elevation: 16,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    style: const TextStyle(color: AppColors.blackColor),
                    underline: const SizedBox(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedPropertyUsage = newValue!;
                      });
                    },
                    items: <String>['For Buy', 'For Rent']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Widgets.labels(context, l10n.propertyTypeLabel),
                const SizedBox(
                  height: 10,
                ),

                Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.borderColor,
                      width: 1,
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: _selectedPropertyType,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined,
                        size: 24),
                    isExpanded: true,
                    iconSize: 24,
                    elevation: 16,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    style: const TextStyle(color: AppColors.blackColor),
                    underline: const SizedBox(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedPropertyType = newValue!;
                      });
                    },
                    items: <String>['Apartment', 'Villa', 'Land', 'Commercial']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Widgets.labels(context, l10n.regionLabel),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.borderColor,
                                width: 1,
                              ),
                            ),
                            child: DropdownButton<String>(
                              value: _selectedRegion,
                              icon: const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: 24),
                              isExpanded: true,
                              iconSize: 24,
                              elevation: 16,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              style:
                                  const TextStyle(color: AppColors.blackColor),
                              underline: const SizedBox(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedRegion = newValue!;
                                });
                              },
                              items: <String>[
                                'Region 1',
                                'Region 2',
                                'Region 3',
                                'Region 4'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        children: [
                          Widgets.labels(context, l10n.cityLabel),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.borderColor,
                                width: 1,
                              ),
                            ),
                            child: DropdownButton<String>(
                              value: _selectedCity,
                              icon: const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: 24),
                              isExpanded: true,
                              iconSize: 24,
                              elevation: 16,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              style:
                                  const TextStyle(color: AppColors.blackColor),
                              underline: const SizedBox(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedCity = newValue!;
                                });
                              },
                              items: <String>[
                                'City 1',
                                'City 2',
                                'City 3',
                                'City 4'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                Widgets.labels(context, l10n.selectNeighbourhoodLabel),
                const SizedBox(
                  height: 10,
                ),

                ///keyword text field
                TextFormField(
                  controller: _neighbourhoodController,
                  style: const TextStyle(
                    color: AppColors.blackColor,
                  ),
                  onFieldSubmitted: (value) {
                    //add keyword to list
                    keywordsList.add(Neighborhood(
                        id: '${keywordsList.length + 1}',
                        value: _neighbourhoodController.text));
                    _neighbourhoodController.clear();

                    setState(() {});
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.secondaryColor,
                    hintText: l10n.selectNeighbourhoodHint,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    suffixIcon: IconButton(
                      onPressed: () {
                        //add keyword to list
                        keywordsList.add(Neighborhood(
                            id: '${keywordsList.length + 1}',
                            value: _neighbourhoodController.text));
                        _neighbourhoodController.clear();

                        setState(() {});
                      },
                      icon: const Icon(Icons.search),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
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
                ),

                const SizedBox(height: 20),

                ///horizontal keywords listview width cross
                keywordsList.isEmpty
                    ? const SizedBox()
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: keywordsList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  borderRadius: BorderRadius.circular(30),
                                  onTap: () {
                                    //remove
                                    keywordsList.removeAt(index);

                                    setState(() {});
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          keywordsList[index].value,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        const Icon(
                                          Icons.close,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),

                Widgets.labels(context, l10n.propertyAreaSqmLabel),
                const SizedBox(
                  height: 10,
                ),

                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        controller: _propertyAreaFromController,
                        keyboardType: TextInputType.text,
                        hintText: l10n.fromHint,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AppTextField(
                        controller: _propertyAreaToController,
                        keyboardType: TextInputType.text,
                        hintText: l10n.toHint,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Widgets.labels(context, l10n.numberOfRoomsLabel),
                const SizedBox(
                  height: 10,
                ),

                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        controller: _noOfRoomsFromController,
                        keyboardType: TextInputType.text,
                        hintText: l10n.fromHint,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AppTextField(
                        controller: _noOfRoomsToController,
                        keyboardType: TextInputType.text,
                        hintText: l10n.toHint,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Widgets.labels(context, l10n.priceSaudiRiyalLabel),
                const SizedBox(
                  height: 10,
                ),

                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        controller: _priceFromController,
                        keyboardType: TextInputType.text,
                        hintText: l10n.fromHint,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AppTextField(
                        controller: _priceToController,
                        keyboardType: TextInputType.text,
                        hintText: l10n.toHint,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Widgets.labels(context, l10n.moreDetailsLabel),
                const SizedBox(
                  height: 10,
                ),

                AppTextField(
                  controller: _moreDetailsController,
                  maxLines: 4,
                  keyboardType: TextInputType.text,
                  hintText: l10n.moreDetailsHint,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                //i agree to terms of use and privacy policy
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
                          style: context.textTheme.bodyLarge,
                          children: [
                            TextSpan(
                              text: l10n.iAgreeToThe,
                              style: context.textTheme.bodyMedium,
                            ),
                            TextSpan(
                              text: l10n.termsOfUseLink,
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: AppColors.primaryColor,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primaryColor,
                              ),
                              // Define an onTap handler to launch a URL
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                            TextSpan(
                              text: l10n.and,
                              style: context.textTheme.bodyMedium,
                            ),
                            TextSpan(
                              text: l10n.privacyPolicyLink,
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: AppColors.primaryColor,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primaryColor,
                              ),
                              // Define an onTap handler to launch a URL
                              recognizer: TapGestureRecognizer()..onTap = () {},
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

                const SizedBox(height: 10),

                SizedBox(
                    height: 50,
                    child: SimpleButton(
                        text: l10n.sendRequestToAllAgentsBtnText,
                        onPressed: () {})),

                const SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
