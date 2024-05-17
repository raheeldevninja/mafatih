import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.controller,
    required this.keyboardType,
    required this.validator,
    this.hintText,
    this.isPassword = false,
    this.isPhone = false,
    this.isSearch = false,
    this.obscureText = false,
    this.visibilityCallback,
    this.countryPickerCallback,
    this.maxLines = 1,
    this.isReadOnly = false,
    super.key,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? hintText;

  final bool isPassword;
  final bool isPhone;
  final bool isSearch;
  final bool? obscureText;
  final bool isReadOnly;

  final String? Function(String?)? validator;
  final VoidCallback? visibilityCallback;
  final VoidCallback? countryPickerCallback;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    Widget? suffixIcon;

    if (isPassword) {
      suffixIcon = IconButton(
        onPressed: visibilityCallback,
        icon: Icon(
          obscureText! ? Icons.visibility : Icons.visibility_off,
          color: Colors.grey,
        ),
      );
    } else if (isSearch) {
      suffixIcon = IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.search,
          color: AppColors.greyColor,
        ),
      );
    } else {
      suffixIcon = null;
    }

    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      readOnly: isReadOnly,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.secondaryColor,
        contentPadding: const EdgeInsets.all(12.0),
        hintText: hintText,
        hintStyle: context.textTheme.bodyMedium,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.grey.withOpacity(0.3), width: 1.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.lightGrey, width: 1.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        prefixIcon: isPhone
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 16),
                  InkWell(
                    onTap: countryPickerCallback,
                    child: const Text('+966',
                        style: TextStyle(color: Colors.grey)),
                  ),
                  Container(
                    height: 20,
                    width: 1,
                    color: Colors.grey,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                ],
              )
            : null,
        suffixIcon: suffixIcon,
      ),
      validator: validator,
    );
  }
}
