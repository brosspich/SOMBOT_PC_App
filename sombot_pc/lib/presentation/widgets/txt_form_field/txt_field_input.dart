import 'package:flutter/material.dart';

import '../../../core/config/themes/app_colors.dart';

class TxtFieldInput extends StatefulWidget {
  final TextEditingController txtController;
  final bool isPass;
  final String hintText;
  final IconData iCons;
  final FocusNode txtFocusNode;
  final TextInputType txtInputTypekeyboard;
  final String? Function(String?)? validator;

  const TxtFieldInput({
    super.key,
    required this.txtController,
    this.isPass = false,
    required this.hintText,
    required this.iCons,
    required this.txtFocusNode,
    required this.txtInputTypekeyboard,
    this.validator,
  });

  @override
  State<TxtFieldInput> createState() => _TxtFieldInputState();
}

class _TxtFieldInputState extends State<TxtFieldInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPass,
      controller: widget.txtController,
      focusNode: widget.txtFocusNode,
      keyboardType: widget.txtInputTypekeyboard,
      style: const TextStyle(
        color: AppColors.black,
        fontSize: 14,
      ),
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        fillColor: AppColors.lightGrey,
        filled: true,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: AppColors.grey,
          fontSize: 14,
        ),
        prefixIcon: Icon(
          widget.iCons,
          color: AppColors.primary,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: AppColors.black.withOpacity(0.4),
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 1,
          ),
        ),
      ),
    );
  }
}
