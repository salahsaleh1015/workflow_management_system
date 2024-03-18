import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workfow_management_system/features/dean/view/screens/dean_dashboard.dart';
import 'package:workfow_management_system/features/dean/view/screens/dean_tasks.dart';
import 'package:workfow_management_system/features/dean/view/screens/dean_vacations.dart';
import 'package:workfow_management_system/resources/color_manager.dart';
import 'package:workfow_management_system/resources/style_manager.dart';
import 'package:workfow_management_system/widgets/app_bar_widget.dart';

class DeanHomeScreen extends StatelessWidget {
  const DeanHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: appBarWidget(symbol: "D", title: "Ahmed Salama" ,subTitle: "Dean"),
        body:  TabBarView(
            children: [
                DeanDashboard(),
              const DeanTasks(),
              const  DeanVacations(),
        ]),
      ),
    );
  }
}




