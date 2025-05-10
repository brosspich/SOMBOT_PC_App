import 'package:flutter/material.dart';

import '../../../core/config/themes/app_colors.dart';

class TxtFieldPass extends StatefulWidget {
  final TextEditingController txtController;
  final bool isPass;
  final String hintText;
  final IconData iCons;
  final FocusNode txtFocusNode;
  final TextInputType txtInputTypekeyboard;
  final String? Function(String?)? validator;

  const TxtFieldPass({
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
  State<TxtFieldPass> createState() => _TxtFieldPassState();
}

class _TxtFieldPassState extends State<TxtFieldPass> {
  bool passwordVisible = true;

  @override
  void initState() {
    super.initState();
    passwordVisible = !widget.isPass;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: passwordVisible,
      controller: widget.txtController,
      focusNode: widget.txtFocusNode,
      keyboardType: widget.txtInputTypekeyboard,
      style: const TextStyle(
        fontSize: 14,
        color: AppColors.black,
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
        suffixIcon: IconButton(
          icon: Icon(
            passwordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
        ),
        suffixIconColor: AppColors.primary,
        alignLabelWithHint: false,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: AppColors.black,
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
