import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workfow_management_system/resources/style_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.hint, this.onSaved, required this.controller, this.onTap, required this.validator, this.onChanged});
  final String hint;
  final Function(String?)? onSaved;
  final TextEditingController controller;
  final Function()? onTap;
  final FormFieldValidator<String> validator;
 final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      height: 40.h,
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: commonHintStyle,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12.r))),
        controller: controller,
        onSaved: onSaved,
        onTap: onTap,
      ),
    );
  }
}
