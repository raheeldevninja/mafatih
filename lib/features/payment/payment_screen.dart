import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/app_text_field.dart';
import 'package:mafatih/core/ui/custom_app_bar.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:mafatih/features/payment/model/payment_method.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/features/payment/widgets/payment_method_item.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<PaymentMethod> paymentMethods = [];

  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _cardHolderNameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _initPaymentMethodsList();
  }

  _initPaymentMethodsList() {
    paymentMethods.add(
      PaymentMethod(
        name: 'Credit Card',
        image: Images.creditCardImage,
        isSelected: true,
      ),
    );
    paymentMethods.add(
      PaymentMethod(
        name: 'Bank',
        image: Images.bankImage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: l10n.paymentTitle,
        onTapBackButton: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(
            height: 20,
            content: SizedBox(),
          ),
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16.0),
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                  l10n.paymentHeading,
                  style: context.textTheme.titleMedium,
              ),

              const SizedBox(height: 20),

              //horizontal payment methods listview
              SizedBox(
                height: 70,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: paymentMethods.length,
                  itemBuilder: (context, index) {
                    return PaymentMethodItem(
                      paymentMethod: paymentMethods[index],
                      onTap: () {
                        for (int i = 0; i < paymentMethods.length; i++) {
                          if (i == index) {
                            paymentMethods[i] = paymentMethods[i]
                                .copyWith(isSelected: true);
                          } else {
                            paymentMethods[i] = paymentMethods[i]
                                .copyWith(isSelected: false);
                          }
                        }

                        setState(() {});
                      },
                    );
                  },
                ),
              ),
            ],
          ),

          //card details
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Widgets.labels(context, l10n.cardNumberLabel),
                const SizedBox(
                  height: 10,
                ),
                AppTextField(
                  controller: _cardNumberController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return l10n.emptyCardNumberValidation;
                    }
                    return null;
                  },
                  hintText: l10n.cardNumberHint,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Widgets.labels(context, l10n.expirationDateLabel),
                          const SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            controller: _expiryDateController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return l10n.emptyExpirationDateValidation;
                              }
                              return null;
                            },
                            hintText: l10n.expirationDateHint,
                          ),

                        ],
                      )
                    ),
                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Widgets.labels(context, l10n.cvvLabel),
                          const SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            controller: _cvvController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return l10n.emptyCVVValidation;
                              }
                              return null;
                            },
                            hintText: l10n.cvvHint,
                          ),

                        ],
                      )
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Widgets.labels(context, l10n.cardHolderNameLabel),
                const SizedBox(
                  height: 10,
                ),
                AppTextField(
                  controller: _cardHolderNameController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return l10n.emptyCardHolderNameValidation;
                    }
                    return null;
                  },
                  hintText: l10n.cardHolderNameHint,
                ),


                const SizedBox(height: 16),
                SizedBox(
                  width: double.maxFinite,
                  height: 56,
                  child: SimpleButton(
                    text: l10n.submitBtnText,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _cardHolderNameController.dispose();
    _cardNumberController.dispose();
    _cvvController.dispose();
    _expiryDateController.dispose();

  }
}
