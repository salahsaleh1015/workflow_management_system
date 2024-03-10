import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workfow_management_system/resources/color_manager.dart';

class LoginButton extends StatelessWidget {
  LoginButton({super.key, required this.onTap});
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.green,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text("Login",
              style: TextStyle(
                color: ColorManager.white,
                fontSize: 5.sp,
              )),
        ),
      ),
    );
  }
}
