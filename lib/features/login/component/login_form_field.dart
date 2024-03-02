import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workfow_management_system/resources/color_manager.dart';

class LoginFormField extends StatelessWidget {
  const LoginFormField(
      {super.key,
      required this.hint,
      required this.prefixIcon,
      required this.controller});
  final String hint;
  final IconData prefixIcon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: ColorManager.primary,
              width: 0.1.w,
            ),
          ),
          prefixIcon: Icon(prefixIcon, color: ColorManager.primary),
          hintText: hint,
          hintStyle: TextStyle(
            color: ColorManager.primary,
          )),
    );
  }
}
