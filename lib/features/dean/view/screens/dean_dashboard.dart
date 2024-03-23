import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workfow_management_system/widgets/control_bar.dart';
import 'package:workfow_management_system/resources/color_manager.dart';
import 'package:workfow_management_system/widgets/tasks_table.dart';
import 'package:workfow_management_system/widgets/vacations_table.dart';

class DeanDashboard extends StatelessWidget {
 const DeanDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.white,
      child: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          ControlBar(
            userName: "Ahmed",
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TasksTable(
                width: 200.w,
                height: 300.h,
              ),
              VacationsTable(
                showButtons: false,
                width: 150.w,
                height: 300.h,
              )
            ],
          )
        ],
      ),
    );
  }
}
