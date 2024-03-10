

import 'package:flutter/material.dart';
import 'package:workfow_management_system/features/login/view/login_app_bar.dart';
import 'package:workfow_management_system/features/login/view/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: loginAppBar(),
       body:  LoginViewBody(),
    );
  }
}
