import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:workfow_management_system/resources/color_manager.dart';
import 'package:workfow_management_system/widgets/doctors_control_bar.dart';
import 'package:workfow_management_system/widgets/tasks_table.dart';
import 'package:workfow_management_system/widgets/vacations_table.dart';

class DoctorsDashboard extends StatelessWidget {
  DoctorsDashboard({super.key});
  final _vacationSenderController = TextEditingController();
  final _vacationDaysController = TextEditingController();
  final _vacationStartDateController = TextEditingController();
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
            buttonOnTap: () {},
            textFieldOnTap: () {
              showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime.parse('2025-12-30'),
                initialDate: DateTime.now(),
              ).then((value) {
                _vacationStartDateController.text =
                    DateFormat.yMMMEd().format(value!).toString();
              });
            },
            vacationStartDateValidator: (String? value) {
              if (value!.isEmpty) {
                return "Add start date";
              }
              return null;
            },
            vacationStartDateController: _vacationStartDateController,
            vacationStartDateHint: "Mon, Mar 18, 2024",
            vacationDaysController: _vacationDaysController,
            vacationDaysValidator: (String? value) {
              if (value!.isEmpty) {
                return "Add days number";
              }
              return null;
            },
            vacationNumOfDaysHint: "33",
            vacationHint: "sender name",
            vacationSenderController: _vacationSenderController,
            vacationSenderValidator: (value) {
              if (value!.isEmpty) {
                return "Add Name";
              }
              return null;
            },
          ),
         SizedBox(
           height: 10.w,
         ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TasksTable(
                width: 150.w,
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
