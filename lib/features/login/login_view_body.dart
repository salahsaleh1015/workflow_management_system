import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workfow_management_system/features/login/component/login_button.dart';
import 'package:workfow_management_system/features/login/component/login_form_field.dart';
import 'package:workfow_management_system/resources/assets_maneger.dart';
import 'package:workfow_management_system/resources/color_manager.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: double.infinity,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
                vertical: 10.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Back",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.primary)),
                  Text("Go To Manage Your Work",
                      style: TextStyle(
                          fontSize: 5.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.green)),
                  SizedBox(
                    height: 50.h,
                  ),
                  LoginFormField(
                    controller: userNameController,
                    prefixIcon: Icons.mail,
                    hint: "User Name",
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  LoginFormField(
                    controller: passwordController,
                    prefixIcon: Icons.lock,
                    hint: "password",
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  LoginButton(
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: double.infinity,
          child: Image.asset(AssetsManager.welcomeImage, fit: BoxFit.cover),
        )
      ],
    );
  }
}
