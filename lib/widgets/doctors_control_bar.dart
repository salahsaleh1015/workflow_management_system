import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workfow_management_system/resources/style_manager.dart';
import 'package:workfow_management_system/widgets/action_card.dart';
import 'package:workfow_management_system/widgets/custom_dialog_button.dart';
import 'package:workfow_management_system/widgets/custom_text_formfield.dart';
import 'package:workfow_management_system/widgets/info_card.dart';
import 'package:workfow_management_system/resources/color_manager.dart';

class DoctorsControlBar extends StatefulWidget {
  const DoctorsControlBar(
      {super.key,
      required this.vacationHint,
      required this.vacationSenderController,
      required this.vacationSenderValidator,
      required this.vacationNumOfDaysHint,
      required this.vacationDaysController,
      required this.vacationDaysValidator,
      required this.vacationStartDateHint,
      required this.vacationStartDateController,
      required this.vacationStartDateValidator,
      this.textFieldOnTap,
      this.buttonOnTap});

  final String vacationHint;
  final String vacationNumOfDaysHint;
  final String vacationStartDateHint;
  final TextEditingController vacationSenderController;
  final TextEditingController vacationDaysController;
  final TextEditingController vacationStartDateController;
  final FormFieldValidator<String> vacationSenderValidator;
  final FormFieldValidator<String> vacationDaysValidator;
  final FormFieldValidator<String> vacationStartDateValidator;

  final Function()? textFieldOnTap;
  final Function()? buttonOnTap;

  @override
  State<DoctorsControlBar> createState() => _DoctorsControlBarState();
}

class _DoctorsControlBarState extends State<DoctorsControlBar> {
  String? selectedValue = 'ordinary';

  List<String> items = ['ordinary', 'sick leave', 'Maternity leave'];

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
                    builder: (context) => StatefulBuilder(
                      builder: (context , setState)=>
                       AlertDialog(
                            actions: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 20.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "vacations",
                                      style: commonTextStyle,
                                    ),
                                    SizedBox(
                                      height: 7.h,
                                    ),
                                    CustomTextFormField(
                                      validator: widget.vacationSenderValidator,
                                      controller: widget.vacationSenderController,
                                      hint: widget.vacationHint,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    CustomTextFormField(
                                      keyboardType: TextInputType.number,
                                      validator: widget.vacationDaysValidator,
                                      controller: widget.vacationDaysController,
                                      hint: widget.vacationNumOfDaysHint,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    CustomTextFormField(
                                      onTap: widget.textFieldOnTap,
                                      validator:
                                          widget.vacationStartDateValidator,
                                      controller:
                                          widget.vacationStartDateController,
                                      hint: widget.vacationStartDateHint,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    DropdownButton<String>(
                                      isExpanded: true,
                                      value: selectedValue,
                                      icon:
                                          Icon(Icons.arrow_downward, size: 20.r),
                                      items: items
                                          .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(item,
                                                  style: commonTextStyle)))
                                          .toList(),
                                      onChanged: (item) =>
                                          setState(() => selectedValue = item),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    CustomDialogButton(
                                        buttonOnTap: widget.buttonOnTap),
                                  ],
                                ),
                              )
                            ],
                          ),
                    ));
              },
              width: 200.w,
              cardColor: ColorManager.yellow,
              title: "vacation",
              mainTitle: "Add vacation",
              textOfButton: "Add",
            ),
          ],
        ),
      ),
    );
  }
}
