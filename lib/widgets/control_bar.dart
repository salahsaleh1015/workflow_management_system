import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:workfow_management_system/features/subscreens/delete_task.dart';
import 'package:workfow_management_system/features/subscreens/edit_tasks_screen.dart';
import 'package:workfow_management_system/features/subscreens/edit_vacations_screen.dart';

import 'package:workfow_management_system/resources/style_manager.dart';
import 'package:workfow_management_system/widgets/action_card.dart';
import 'package:workfow_management_system/widgets/custom_text_formfield.dart';
import 'package:workfow_management_system/widgets/info_card.dart';
import 'package:workfow_management_system/resources/color_manager.dart';
import 'package:workfow_management_system/widgets/tasks_table.dart';
import 'package:workfow_management_system/widgets/vacations_table.dart';

class ControlBar extends StatelessWidget {
  final TextEditingController taskController;
  final TextEditingController senderController;
  final TextEditingController deadlineController;
  final String taskHint;
  final String senderHint;
  final String deadlineHint;
  final Function(String?)? taskOnSaved;
  final Function(String?)? senderOnSaved;
  final Function(String?)? deadlineOnSaved;
  final Function()? onTap;
  final Function()? buttonOnTap;
  final FormFieldValidator<String> taskValidator;
  final FormFieldValidator<String> deadlineValidator;
  final FormFieldValidator<String> senderValidator;
  final Function(String)? onChanged;
final String userName;
  const ControlBar(
      {super.key,
      required this.taskController,
      required this.senderController,
      required this.deadlineController,
      required this.taskHint,
      required this.senderHint,
      required this.deadlineHint,
      this.taskOnSaved,
      this.senderOnSaved,
      this.deadlineOnSaved,
      this.onTap,
      this.buttonOnTap,
      required this.taskValidator,
      required this.deadlineValidator,
      required this.senderValidator,
      this.onChanged, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              name: userName,
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
                                    onChanged: onChanged,
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditVacationsScreen()));
              },
              width: 50.w,
              cardColor: ColorManager.blue,
              title: "vacations",
              mainTitle: "accept or refuse",
              textOfButton: "Now",
            ),
            ActionCard(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditTasksScreen()));
              },
              width: 50.w,
              cardColor: ColorManager.red,
              title: "Task",
              mainTitle: "Edit Task",
              textOfButton: "Edit",
            ),
            ActionCard(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DeleteTasksScreen()));
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
  }
}
