import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workfow_management_system/features/dean/view/dean_home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:workfow_management_system/features/vice/view/vice_home_screen.dart';
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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => const MaterialApp(
        title: 'workflow management system',
        debugShowCheckedModeBanner: false,
        home: ViceHomeScreen(),
      ),
    );
  }
}
