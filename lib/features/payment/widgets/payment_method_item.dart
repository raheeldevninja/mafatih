import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/features/payment/model/payment_method.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    required this.paymentMethod,
    required this.onTap,
    super.key});

  final PaymentMethod paymentMethod;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Container(
            width: 110,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: paymentMethod.isSelected
                  ? AppColors.primaryColor.withOpacity(0.1)
                  : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 2,
                color: paymentMethod.isSelected
                    ? AppColors.primaryColor.withOpacity(0.2)
                    : AppColors.lightGrey.withOpacity(0.2),
              ),
            ),
            child: SvgPicture.asset(
              paymentMethod.image,
              width: 40,
              height: 40,
            ),
          )),
    );
  }
}
