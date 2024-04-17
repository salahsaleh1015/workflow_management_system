import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:workfow_management_system/core/view_models/vacations_view_model/vacations_cubit.dart';
import 'package:workfow_management_system/core/view_models/vacations_view_model/vacations_state.dart';
import 'package:workfow_management_system/resources/routes_manager.dart';
import 'package:workfow_management_system/resources/style_manager.dart';
import 'package:workfow_management_system/widgets/action_card.dart';
import 'package:workfow_management_system/widgets/custom_dialog_button.dart';
import 'package:workfow_management_system/widgets/custom_text_formfield.dart';
import 'package:workfow_management_system/widgets/info_card.dart';
import 'package:workfow_management_system/resources/color_manager.dart';

class DoctorsControlBar extends StatefulWidget {
  DoctorsControlBar({
    super.key,
  });

  @override
  State<DoctorsControlBar> createState() => _DoctorsControlBarState();
}

class _DoctorsControlBarState extends State<DoctorsControlBar> {
  final _vacationSenderController = TextEditingController();
  final _vacationDaysController = TextEditingController();
  final _vacationStartDateController = TextEditingController();
  final _vacationTypeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var cubit = VacationsCubit.get(context);
    return BlocBuilder<VacationsCubit, VacationsStates>(
      builder: (context, state) {
        return Container(
          height: 170.h,
          width: double.infinity,
          color: ColorManager.lightGrey,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: 3.h, right: 10.w, left: 10.w, top: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const InfoCard(
                  name: "Doctors/Assistants",
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
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "vacations",
                                          style: commonTextStyle,
                                        ),
                                        SizedBox(
                                          height: 7.h,
                                        ),
                                        CustomTextFormField(

                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Add sender name";
                                            }
                                            return null;
                                          },
                                          controller: _vacationSenderController,
                                          hint: "ahmed mohamed",
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        CustomTextFormField(
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Add duration";
                                            }
                                            return null;
                                          },
                                          controller: _vacationDaysController,
                                          hint: '33',
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        CustomTextFormField(
                                          onTap: () {
                                            showDatePicker(
                                              context: context,
                                              firstDate: DateTime.now(),
                                              lastDate:
                                                  DateTime.parse('2025-12-30'),
                                              initialDate: DateTime.now(),
                                            ).then((value) {
                                              _vacationStartDateController
                                                      .text =
                                                  DateFormat.yMMMEd()
                                                      .format(value!)
                                                      .toString();
                                            });
                                          },
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Add start date";
                                            }
                                            return null;
                                          },
                                          controller:
                                              _vacationStartDateController,
                                          hint: "12, Mar 18, 2024",
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        CustomTextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "add vacation type";
                                            }
                                            return null;
                                          },
                                          controller: _vacationTypeController,
                                          hint: "ordinary",
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        CustomDialogButton(
                                          buttonOnTap: () {
                                            _formKey.currentState!.save();
                                            if (_formKey.currentState!
                                                .validate()) {
                                              cubit.addVacationToFireStore(
                                                  _vacationStartDateController
                                                      .text,
                                                  _vacationSenderController
                                                      .text,
                                                  _vacationTypeController.text,
                                                  _vacationDaysController.text);
                                              Navigator.pop(context);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          'vacation added successfully')));
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
                  width: 100.w,
                  title: "vacation",
                  mainTitle: "Add vacation",
                  textOfButton: "Add",
                ),
                ActionCard(
                  title: "Response",
                  mainTitle: "Submit your Task",
                  textOfButton: "Submit",
                  width: 100.w,

                  onTap: () {
                    Navigator.pushNamed(context, Routes.submitTasksRoute);
                  }
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
