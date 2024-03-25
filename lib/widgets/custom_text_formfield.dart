import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workfow_management_system/resources/style_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.hint, required this.controller, this.onTap, required this.validator, this.onChanged, this.keyboardType = TextInputType.text,  this.height = 40,  this.maxLines = 1, this.minLines = 1,});
  final String hint;

  final TextEditingController controller;
  final Function()? onTap;
  final String? Function(String?)? validator;
 final Function(String)? onChanged;
 final TextInputType keyboardType;
 final double height;
 final int maxLines;
 final int minLines;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      height: height.h,
      child: TextFormField(
        maxLines: maxLines,
        minLines: minLines,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: commonHintStyle,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12.r))),
        controller: controller,

        onTap: onTap,
      ),
    );
  }
}
