
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workfow_management_system/features/dean/view/screens/dean_dashboard.dart';
import 'package:workfow_management_system/resources/color_manager.dart';
import 'package:workfow_management_system/resources/style_manager.dart';
import 'package:workfow_management_system/widgets/app_bar_widget.dart';
import 'package:workfow_management_system/widgets/tasks_table.dart';

class DeanTasks extends StatelessWidget {
  const DeanTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child:  TasksTable(
        width: MediaQuery.of(context).size.width*0.8,
        height: MediaQuery.of(context).size.height*0.8,

      ),
    );
  }
}