import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:workfow_management_system/resources/color_manager.dart';
import 'package:workfow_management_system/widgets/action_card.dart';
import 'package:workfow_management_system/widgets/control_bar.dart';
import 'package:workfow_management_system/widgets/info_card.dart';
import 'package:workfow_management_system/widgets/tasks_table.dart';
import 'package:workfow_management_system/widgets/vacations_table.dart';

class ViceDashboard extends StatelessWidget {
   ViceDashboard({super.key});
  final _senderNameController = TextEditingController();
  final _taskNameController = TextEditingController();
  final _deadlineController = TextEditingController();
  final _receiverController = TextEditingController();
  final  _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorManager.white,
        child: Column(children: [
          SizedBox(
            height: 15.h,
          ),
          ControlBar(
              receiverOnSaved: (String? value){
                _receiverController.text = value!;
              },
              receiverValidator: (value){
                if (value!.isEmpty) {
                  return 'input must not be empty';
                }
                return null;
              },
              receiverController: _receiverController,
              receiverHint: "To Dr:#### ####",
            userName: "Maher",
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
                width: 150.w,
                height: 300.h,
              )
            ],
          ),
        ]));
  }


}
