


 import 'package:flutter/material.dart';
import 'package:workfow_management_system/features/doctors/view/screens/doctors_dashboard.dart';
import 'package:workfow_management_system/features/doctors/view/screens/doctors_tasks.dart';
import 'package:workfow_management_system/features/doctors/view/screens/doctors_vacations.dart';

import '../../../widgets/app_bar_widget.dart';

class DoctorsHomeScreen extends StatelessWidget {
   const DoctorsHomeScreen({super.key});

   @override
   Widget build(BuildContext context) {
     return DefaultTabController(
         length: 3,

         child:  Scaffold(
           appBar: appBarWidget(symbol: "D", title: "Ahmed Gaber" ,subTitle: "doctor"),
           body: const TabBarView(
             children: [
               DoctorsDashboard(),
               DoctorsTasks(),
               DoctorsVacations(),
             ],
           ),
         ));
   }
 }
