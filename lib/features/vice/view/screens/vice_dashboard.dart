import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:workfow_management_system/resources/color_manager.dart';

import 'package:workfow_management_system/widgets/tasks_table.dart';
import 'package:workfow_management_system/widgets/vacations_table.dart';
import 'package:workfow_management_system/widgets/vice_control_bar.dart';

class ViceDashboard extends StatelessWidget {
  const ViceDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.white,
      child: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          const ViceControlBar(
            userName: "Maher",
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TasksTable(
                width: 170.w,
                height: 300.h,
              ),
              VacationsTable(
                showButtons: false,
                width: 170.w,
                height: 300.h,
              )
            ],
          )
        ],
      ),
    );
  }
}
