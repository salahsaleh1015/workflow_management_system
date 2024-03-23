import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:workfow_management_system/core/view_model/dashboard_cubit.dart';
import 'package:workfow_management_system/core/view_model/dashboard_cubit.dart';
import 'package:workfow_management_system/core/view_model/dashboard_state.dart';
import 'package:workfow_management_system/resources/color_manager.dart';
import 'package:workfow_management_system/widgets/doctors_control_bar.dart';
import 'package:workfow_management_system/widgets/tasks_table.dart';
import 'package:workfow_management_system/widgets/vacations_table.dart';

class DoctorsDashboard extends StatelessWidget {
  DoctorsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.white,
      child: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          DoctorsControlBar(
          ),
          SizedBox(
            height: 10.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TasksTable(
                width: 200.w,
                height: 300.h,
              ),
              VacationsTable(
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
