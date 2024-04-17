import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:workfow_management_system/core/view_models/tasks_view_model/tasks_cubit.dart';
import 'package:workfow_management_system/core/view_models/tasks_view_model/tasks_state.dart';
import 'package:workfow_management_system/resources/routes_manager.dart';
import 'package:workfow_management_system/resources/style_manager.dart';
import 'package:workfow_management_system/widgets/action_card.dart';
import 'package:workfow_management_system/widgets/custom_dialog_button.dart';
import 'package:workfow_management_system/widgets/custom_text_formfield.dart';
import 'package:workfow_management_system/widgets/info_card.dart';
import 'package:workfow_management_system/resources/color_manager.dart';


class ControlBar extends StatefulWidget {
   
   ControlBar({super.key, required this.userName});
   final String userName;

  @override
  State<ControlBar> createState() => _ControlBarState();
}

class _ControlBarState extends State<ControlBar> {
   final _formKey = GlobalKey<FormState>();

   final _senderNameController = TextEditingController();

   final _taskNameController = TextEditingController();

   final _deadlineController = TextEditingController();

   final _receiverController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = TasksCubit.get(context);
    return BlocBuilder<TasksCubit, TasksStates>(
  builder: (context, state) {
    return Container(
      height: 170.h,
      width: double.infinity,
      color: ColorManager.lightGrey,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: 3.h, right: 10.w, left:5.w, top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InfoCard(
              name: widget.userName,
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
                              child: Form(
                                key: _formKey,
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
                                      maxLines: 5,
                                      minLines: 2,
                                      height: 70.h,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'input must not be empty';
                                        }
                                        // You can add more validation rules here if needed
                                        return null;
                                      },
                                      controller: _taskNameController,
                                      hint: "enter task here",

                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    CustomTextFormField(

                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'input must not be empty';
                                        }
                                        // You can add more validation rules here if needed
                                        return null;
                                      },
                                      hint: "sender name",
                                      controller: _senderNameController,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    CustomTextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'input must not be empty';
                                        }
                                        // You can add more validation rules here if needed
                                        return null;
                                      },
                                      hint: "deadline",
                                      controller: _deadlineController,
                                      onTap:  () {
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
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    CustomTextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'input must not be empty';
                                        }
                                        // You can add more validation rules here if needed
                                        return null;
                                      },
                                      hint: "receiver name",
                                      controller: _receiverController,

                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    CustomDialogButton(
                                      buttonOnTap: () {
                                        _formKey.currentState!.save();
                                        if (_formKey.currentState!.validate()) {
                                          cubit.addTaskToFireStore(
                                              _taskNameController.text,
                                              _senderNameController.text,
                                              _receiverController.text,
                                              _deadlineController.text);
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('task added successfully')));
                                        }

                                      },
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ));
              },
              width: 50.w,

              title: "Task",
              mainTitle: "Add New Task",
              textOfButton: "Add",
            ),
            ActionCard(
              onTap: () {
                Navigator.pushNamed(context, Routes.manageVacationRoute);
              },
              width: 50.w,
              title: "vacations",
              mainTitle: "Manage Vacations",
              textOfButton: "Now",
            ),
            ActionCard(
              onTap: () {
                Navigator.pushNamed(context, Routes.editTasksRoute);
              },
              width: 50.w,

              title: "Task",
              mainTitle: "Edit Task",
              textOfButton: "Edit",
            ),
            ActionCard(
              onTap: () {
                Navigator.pushNamed(context, Routes.deleteTasksRoute);
              },
              width: 50.w,

              title: "Task",
              mainTitle: "delete Task",
              textOfButton: "delete",
            ),
            ActionCard(
              onTap: () {
                Navigator.pushNamed(context, Routes.responseRoute);
              },
              width: 50.w,
              title: "Response",
              mainTitle: "view responses",
              textOfButton: "Now",
            ),
          ],
        ),
      ),
    );
  },
);
  }
}
