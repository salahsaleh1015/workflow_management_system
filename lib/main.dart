import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:workfow_management_system/core/view_models/tasks_view_model/tasks_cubit.dart';
import 'package:workfow_management_system/core/view_models/vacations_view_model/vacations_cubit.dart';
import 'package:workfow_management_system/features/dean/view/dean_home_screen.dart';
import 'package:workfow_management_system/features/doctors/view/doctors_home_screen.dart';
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
        BlocProvider<TasksCubit>(create: (context) =>TasksCubit()..getTasks()..getTasksResponse()),
        BlocProvider<VacationsCubit>(create: (context) => VacationsCubit()..getVacations()),

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
          home: DeanHomeScreen(),

        ),
      ),
    );
  }
}
