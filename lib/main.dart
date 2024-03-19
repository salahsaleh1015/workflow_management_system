import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:workfow_management_system/features/doctors/view/doctors_home_screen.dart';
import 'package:workfow_management_system/features/login/view/login_view.dart';
import 'package:workfow_management_system/features/login/view_model/auth_cubit.dart';
import 'package:workfow_management_system/features/vice/view/vice_home_screen.dart';
import 'package:workfow_management_system/resources/routes_manager.dart';
import 'firebase_options.dart';


void main() async{

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => const MaterialApp(
          onGenerateRoute:RouteGenerator.getRoute,
          initialRoute: Routes.loginRoute,
          title: 'workflow management system',
          debugShowCheckedModeBanner: false,
          home: LoginView(),
        ),
      ),
    );
  }
}
