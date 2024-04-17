import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:workfow_management_system/core/view_models/tasks_view_model/tasks_cubit.dart';
import 'package:workfow_management_system/core/view_models/tasks_view_model/tasks_state.dart';
import 'package:workfow_management_system/resources/style_manager.dart';
import 'package:workfow_management_system/resources/color_manager.dart';
import 'package:workfow_management_system/widgets/custom_dialog_button.dart';
import 'package:workfow_management_system/widgets/custom_text_formfield.dart';

class TasksTable extends StatelessWidget {
  TasksTable(
      {super.key,
      required this.height,
      required this.width,
      this.isMore = false,
      this.icon,
      this.submitResponse,
      this.isResponse = false,
      this.isDelete = false,
      this.secondIcon});

  final double height;
  final double width;
  final bool isDelete;
  final bool isMore;
  final bool isResponse;
  final IconData? icon;
  final IconData? secondIcon;

  final _senderNameController = TextEditingController();
  final _taskNameController = TextEditingController();
  final _deadlineController = TextEditingController();
  final _receiverController = TextEditingController();
  //final _submitFormKey = GlobalKey<FormState>();
  final _submitTaskController = TextEditingController();

  final GestureTapCancelCallback? submitResponse;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final cubit = TasksCubit.get(context);
    return BlocBuilder<TasksCubit, TasksStates>(
      builder: (context, state) {
        if (state is GetTasksSuccessState || state is UpdateTaskResponseSuccessState || state is GetTasksResponseSuccessState) {
          return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              border: Border.all(color: ColorManager.grey, width: 0.3.w),
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 6.h),
                  child: _tableHeader(),
                ),
                SizedBox(
                  height: 5.h,
                ),
                _mainColumns(),
                SizedBox(
                  height: 5.h,
                ),
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 8.h),
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          content: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Task",
                                                  style: commonHeadTextStyle),
                                              Text(cubit.tasks[i].taskTitle,
                                                  style: commonTextStyle),
                                              Text("Sender",
                                                  style: commonHeadTextStyle),
                                              Text(cubit.tasks[i].taskSender,
                                                  style: commonTextStyle),
                                              Text("Receiver",
                                                  style: commonHeadTextStyle),
                                              Text(cubit.tasks[i].taskReceiver,
                                                  style: commonTextStyle),
                                              Text("Deadline",
                                                  style: commonHeadTextStyle),
                                              Text(cubit.tasks[i].taskDeadline,
                                                  style: commonTextStyle),
                                            ],
                                          ),
                                        ));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: 20.w,
                                      child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          cubit.tasks[i].taskTitle,
                                          style: commonTextStyle)),
                                  SizedBox(
                                    width: 20.w,
                                    child: Text(cubit.tasks[i].taskSender,
                                        style: commonTextStyle),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                    child: SizedBox(
                                      child: Text(cubit.tasks[i].taskDeadline,
                                          style: commonTextStyle),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                    child: Text(cubit.tasks[i].taskReceiver,
                                        style: commonTextStyle),
                                  ),
                                  (isResponse == true)
                                      ? cubit.tasks[i].isSubmitted == true
                                          ? Text("(Submitted)",
                                              style: commonHintStyle)
                                          : GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (context) =>
                                                            AlertDialog(
                                                              actions: [
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          10.w,
                                                                      vertical:
                                                                          20.h),
                                                                  child: Form(
                                                                    key:
                                                                        _formKey,
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          children: [
                                                                            Text(
                                                                              "Add Response",
                                                                              style: commonTextStyle,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 10.w,
                                                                            ),
                                                                            Text("(${cubit.tasks[i].taskReceiver})",
                                                                                style: commonTextStyle),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              7.h,
                                                                        ),
                                                                        CustomTextFormField(
                                                                          maxLines:
                                                                              15,
                                                                          minLines:
                                                                              5,
                                                                          height:
                                                                              150.h,
                                                                          validator:
                                                                              (value) {
                                                                            if (value!.isEmpty) {
                                                                              return "Add Response";
                                                                            }
                                                                            return null;
                                                                          },
                                                                          controller:
                                                                              _submitTaskController,
                                                                          hint:
                                                                              "add response",
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              20.h,
                                                                        ),
                                                                        CustomDialogButton(
                                                                          buttonOnTap:
                                                                              () {
                                                                            _formKey.currentState!.save();
                                                                            if (_formKey.currentState!.validate()) {
                                                                              cubit.updateTaskResponseById(documentId: cubit.tasks[i].taskId!, taskResponse: _submitTaskController.text);
                                                                              Navigator.pop(context);
                                                                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('response added successfully')));
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
                                              child: Container(
                                                width: 25.w,
                                                height: 25.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.r),
                                                    border: Border.all(
                                                      color:
                                                          ColorManager.primary,
                                                    )),
                                                child: Center(
                                                  child: Text("Submit",
                                                      style: TextStyle(
                                                          color: ColorManager
                                                              .primary,
                                                          fontSize: 4.sp)),
                                                ),
                                              ),
                                            )
                                      : (isMore == true)
                                          ? (isDelete)
                                              ? IconButton(
                                                  onPressed: () {
                                                    cubit.deleteTaskById(
                                                        cubit.tasks[i].taskId!);
                                                  },
                                                  icon: Icon(
                                                    icon,
                                                    size: 10.r,
                                                    color: ColorManager.black,
                                                  ))
                                              : IconButton(
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder:
                                                            (context) =>
                                                                AlertDialog(
                                                                  actions: [
                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal: 10
                                                                              .w,
                                                                          vertical:
                                                                              20.h),
                                                                      child:
                                                                          Form(
                                                                        key:
                                                                            _formKey,
                                                                        child:
                                                                            Column(
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
                                                                                return null;
                                                                              },
                                                                              controller: _taskNameController,
                                                                              hint: "enter task title",
                                                                            ),
                                                                            SizedBox(
                                                                              height: 20.h,
                                                                            ),
                                                                            CustomTextFormField(
                                                                              validator: (value) {
                                                                                if (value!.isEmpty) {
                                                                                  return 'input must not be empty';
                                                                                }
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
                                                                                return null;
                                                                              },
                                                                              hint: "Mon,1 may, 2022",
                                                                              controller: _deadlineController,
                                                                              onTap: () {
                                                                                showDatePicker(
                                                                                  context: context,
                                                                                  firstDate: DateTime.now(),
                                                                                  lastDate: DateTime.parse('2025-12-30'),
                                                                                  initialDate: DateTime.now(),
                                                                                ).then((value) {
                                                                                  _deadlineController.text = DateFormat.yMMMEd().format(value!).toString();
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
                                                                                  cubit.updateTaskById(documentId: cubit.tasks[i].taskId!, taskTitle: _taskNameController.text, taskSender: _senderNameController.text, taskReceiver: _receiverController.text, taskDeadline: _deadlineController.text);
                                                                                  Navigator.pop(context);
                                                                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('task updated successfully')));
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
                                                  icon: Icon(
                                                    secondIcon,
                                                    size: 10.r,
                                                    color: ColorManager.black,
                                                  ))
                                          : SizedBox(
                                              width: 10.w,
                                            )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, i) => SizedBox(height: 2.h),
                        itemCount: cubit.tasks.length))
              ],
            ),
          );
        } else if (state is GetTasksErrorState) {
          return Center(child: Text(state.message.toString()));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _tableHeader() => Row(
        children: [
          Icon(
            Icons.file_open,
            color: ColorManager.red,
            size: 20.r,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            "Tasks",
            style: TextStyle(fontSize: 5.sp, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          SizedBox(width: 10.w),
        ],
      );

  Widget _mainColumns() => Container(
        width: double.infinity,
        height: 30.h,
        color: ColorManager.lightGrey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 20.w, child: Text("title", style: commonTextStyle)),
              SizedBox(
                  width: 20.w, child: Text("sender", style: commonTextStyle)),
              SizedBox(
                  width: 20.w, child: Text("deadline", style: commonTextStyle)),
              SizedBox(
                width: 20.w,
                child: Text("receiver", style: commonTextStyle),
              ),
              (isMore == true)
                  ? Icon(
                      icon,
                      size: 20.r,
                      color: ColorManager.primary,
                    )
                  : SizedBox(
                      width: 15.w,
                    )
            ],
          ),
        ),
      );
}
