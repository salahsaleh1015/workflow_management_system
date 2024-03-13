import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:workfow_management_system/features/subscreens/delete_task.dart';
import 'package:workfow_management_system/features/subscreens/edit_tasks_screen.dart';
import 'package:workfow_management_system/features/subscreens/edit_vacations_screen.dart';

import 'package:workfow_management_system/resources/style_manager.dart';
import 'package:workfow_management_system/widgets/action_card.dart';
import 'package:workfow_management_system/widgets/control_bar.dart';
import 'package:workfow_management_system/widgets/custom_text_formfield.dart';
import 'package:workfow_management_system/widgets/info_card.dart';
import 'package:workfow_management_system/resources/color_manager.dart';
import 'package:workfow_management_system/widgets/tasks_table.dart';
import 'package:workfow_management_system/widgets/vacations_table.dart';

class DeanDashboard extends StatelessWidget {
  DeanDashboard({super.key});
  final _senderNameController = TextEditingController();
  final _taskNameController = TextEditingController();
  final _deadlineController = TextEditingController();
  final  _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.white,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            ControlBar(
              userName: "Ahmed",
              onChanged: (value){
                _taskNameController.text = value;

              },
                deadlineValidator: (value) {
                  if (value!.isEmpty) {
                    return 'input must not be empty';
                  }
                  return null;
                },
                senderValidator: (value) {
                  if (value!.isEmpty) {
                    return 'input must not be empty';
                  }
                  return null;
                },
                taskValidator: (value) {
                  if ( value!.isEmpty) {
                    return 'input must not be empty';
                  }

                },
                buttonOnTap: () {
                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {

                  }
                },
                deadlineController: _deadlineController,
                deadlineHint: "deadline",
                deadlineOnSaved: (String? value) {
                  _deadlineController.text = value!;
                },
                onTap: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.parse('2025-12-30'),
                    initialDate: DateTime.now(),
                  ).then((value) {
                    _deadlineController.text =
                        DateFormat.yMMMEd().format(value!).toString();
                  });
                },
                senderOnSaved: (String? value) {
                  _senderNameController.text = value!;
                },
                senderController: _senderNameController,
                senderHint: "sender name",
                taskOnSaved: (String? value) {
                  _taskNameController.text = value!;
                },

                taskController: _taskNameController,
                taskHint: "task name"),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TasksTable(
                  width: 150.w,
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
      ),
    );
  }
}

