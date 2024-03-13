import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:workfow_management_system/features/dean/view/screens/subscreens/delete_task.dart';
import 'package:workfow_management_system/features/dean/view/screens/subscreens/edit_tasks_screen.dart';
import 'package:workfow_management_system/features/dean/view/screens/subscreens/edit_vacations_screen.dart';
import 'package:workfow_management_system/resources/style_manager.dart';
import 'package:workfow_management_system/widgets/action_card.dart';
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
            dashControlBar(
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
                context: context,
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
                  showButton: false,
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

Widget dashControlBar({
  context,
  required TextEditingController taskController,
  required TextEditingController senderController,
  required TextEditingController deadlineController,
  required String taskHint,
  required String senderHint,
  required String deadlineHint,
  Function(String?)? taskOnSaved,
  Function(String?)? senderOnSaved,
  Function(String?)? deadlineOnSaved,
  Function()? onTap,
  Function()? buttonOnTap,
  required FormFieldValidator<String> taskValidator,
  required FormFieldValidator<String> deadlineValidator,
  required FormFieldValidator<String> senderValidator,
  Function(String)? onChanged,
}) =>
    Container(
      height: 170.h,
      width: double.infinity,
      color: ColorManager.lightGrey,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: 3.h, right: 10.w, left: 10.w, top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InfoCard(
              name: "Ahmed",

            ),
            SizedBox(
              width: 10.w,
            ),
            ActionCard(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          actions: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 20.h),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Tasks",
                                        style: commonTextStyle,
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7.h,
                                  ),
                                  CustomTextFormField(
                                    onChanged:onChanged,
                                    validator: taskValidator,
                                    controller: taskController,
                                    hint: taskHint,
                                    onSaved: taskOnSaved,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  CustomTextFormField(
                                    validator: senderValidator,
                                    hint: senderHint,
                                    controller: senderController,
                                    onSaved: senderOnSaved,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  CustomTextFormField(
                                    validator: deadlineValidator,
                                    hint: deadlineHint,
                                    controller: deadlineController,
                                    onSaved: deadlineOnSaved,
                                    onTap: onTap,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  InkWell(
                                    onTap: buttonOnTap,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25.r),
                                        color: ColorManager.primary,
                                      ),
                                      width: 100.w,
                                      height: 40.h,
                                      child: Center(
                                        child: Text("Done",
                                            style: TextStyle(
                                                color: ColorManager.white,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ));
              },
              width: 50.w,
              cardColor: ColorManager.red,
              title: "Task",
              mainTitle: "Add New Task",
              textOfButton: "Add",
            ),
            ActionCard(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const EditVacationsScreen()));
              },
              width: 50.w,
              cardColor: ColorManager.blue,
              title: "vacations",
              mainTitle: "accept or refuse",
              textOfButton: "Now",
            ),
            ActionCard(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const EditTasksScreen()));
              },
              width: 50.w,
              cardColor: ColorManager.red,
              title: "Task",
              mainTitle: "Edit Task",
              textOfButton: "Edit",
            ),
            ActionCard(
              onTap:  (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const DeleteTasksScreen()));
              },
              width: 50.w,
              cardColor: ColorManager.yellow,
              title: "Task",
              mainTitle: "delete Task",
              textOfButton: "delete",
            ),
          ],
        ),
      ),
    );
