


 import 'package:flutter/material.dart';
import 'package:workfow_management_system/features/vice/view/screens/vice_dashboard.dart';
import 'package:workfow_management_system/features/vice/view/screens/vice_tasks.dart';
import 'package:workfow_management_system/features/vice/view/screens/vice_vacations.dart';
import 'package:workfow_management_system/widgets/app_bar_widget.dart';

class ViceHomeScreen extends StatelessWidget {
   const ViceHomeScreen({super.key});

   @override
   Widget build(BuildContext context) {
     return DefaultTabController(
       length: 3,
       child:  Scaffold(
         appBar: appBarWidget(symbol: "V", title: "Vice Maher" , subTitle: "Vice"),
         body: const TabBarView(
           children: [
             ViceDashboard(),
             ViceTasks(),
             ViceVacations(),
           ],
         ),
       ),
     );
   }
 }
