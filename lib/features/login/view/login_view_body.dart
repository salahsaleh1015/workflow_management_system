import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workfow_management_system/features/dean/view/dean_home_screen.dart';

import 'package:workfow_management_system/features/login/view/component/login_button.dart';
import 'package:workfow_management_system/features/login/view/component/login_form_field.dart';
import 'package:workfow_management_system/features/login/view_model/auth_cubit.dart';
import 'package:workfow_management_system/resources/assets_maneger.dart';
import 'package:workfow_management_system/resources/color_manager.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Row(
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
                          onSaved: (value) {
                            //AuthCubit.get(context).password = value!;
                          },
                          controller: emailController,
                          prefixIcon: Icons.mail,
                          hint: "User Name",
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        LoginFormField(
                          onSaved: (value) {
                            //AuthCubit.get(context).password = value!;
                          },
                          controller: passwordController,
                          prefixIcon: Icons.lock,
                          hint: "password",
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        LoginButton(
                          onTap: () {
                            _formKey.currentState!.save();
                            if (_formKey.currentState!.validate()) {
                              AuthCubit.get(context).signInWithEmailAndPassword(
                                  context,
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: double.infinity,
                child:
                    Image.asset(AssetsManager.welcomeImage, fit: BoxFit.cover),
              )
            ],
          ),
        );
      },
    );
  }
}
