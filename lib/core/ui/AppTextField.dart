import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.controller,
    required this.keyboardType,
    required this.validator,
    this.hintText,
    this.isPassword = false,
    this.isPhone = false,
    this.obscureText = false,
    this.visibilityCallback,
    this.countryPickerCallback,
    super.key,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? hintText;

  final bool isPassword;
  final bool isPhone;
  final bool? obscureText;

  final String? Function(String?)? validator;
  final VoidCallback? visibilityCallback;
  final VoidCallback? countryPickerCallback;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 1,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.secondaryColor,
        contentPadding: const EdgeInsets.all(12.0),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
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
        suffixIcon: isPassword
            ? IconButton(
                onPressed: visibilityCallback,
                icon: Icon(
                  obscureText! ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              )
            : null,
      ),
      validator: validator,
    );
  }
}
