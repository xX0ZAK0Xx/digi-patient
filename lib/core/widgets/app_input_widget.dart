import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../colors.dart';
import '../sizes.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.textInputAction,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.obscureText,
    this.suffixIcon,
    this.autofocus,
    this.expanded,
    this.focusNode,
    this.maxLine,
    this.enable,
    this.readOnly = false,
  });

  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final bool? obscureText;
  final Widget? suffixIcon;
  final String hintText;
  final String labelText;
  final bool? autofocus;
  final bool? expanded;
  final bool readOnly;
  final bool? enable;
  final FocusNode? focusNode;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            textCapitalization: TextCapitalization.sentences,
            focusNode: focusNode,
            onChanged: onChanged,
            autofocus: autofocus ?? false,
            validator: validator,
            obscureText: obscureText ?? false,
            obscuringCharacter: '●',
            readOnly: readOnly,
            cursorColor: AppColors.primary,
            maxLines: expanded == true ? null : maxLine ?? 1,
            expands: expanded ?? false,
            enabled: enable,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 14,
                color: AppColors.grey,
              ),
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 14),
              filled: true,
              fillColor: AppColors.primary.withValues(alpha: 0.05),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
                borderSide: BorderSide(color: AppColors.primary, width: 0.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
                borderSide: const BorderSide(color: Colors.redAccent, width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
                borderSide: BorderSide.none,
              ),
            ),
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
          ),
        ],
      ),
    );
  }
}


class AppPhoneFormField extends StatelessWidget {
  const AppPhoneFormField({
    super.key,
    this.controller,
    this.onChanged,
    this.validator,
    required this.labelText,
    this.focusNode,
  });

  final PhoneController? controller;
  final dynamic Function(PhoneNumber)? onChanged;
  final String? Function(PhoneNumber?)? validator;
  final String labelText;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          PhoneFormField(
            focusNode: focusNode,
            controller: controller ??
                PhoneController(
                  initialValue: const PhoneNumber(
                    isoCode: IsoCode.BD,
                    nsn: '',
                  ),
                ),
            onChanged: onChanged,
            validator: validator,
            cursorColor: AppColors.primary,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: "Enter phone number",
              hintStyle: const TextStyle(
                fontSize: 14,
                color: AppColors.grey,
              ),
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 14),
              filled: true,
              fillColor: AppColors.primary.withValues(alpha: 0.05),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
                borderSide: BorderSide(color: AppColors.primary, width: 0.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
                borderSide: const BorderSide(color: Colors.redAccent, width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
