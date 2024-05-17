import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/models/property_type_model.dart';

class TypeItem extends StatelessWidget {
  const TypeItem({
    super.key,
    required this.propertyType,
    required this.onTap,
  });

  final PropertyTypeModel propertyType;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: propertyType.isSelected
                    ? AppColors.primaryColor
                    : AppColors.lightGrey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: SvgPicture.asset(
                propertyType.icon,
                color: propertyType.isSelected
                    ? Colors.white
                    : Colors.black,

              ),
            ),

            const SizedBox(height: 8),

            Text(
              propertyType.title,
              style: context.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
