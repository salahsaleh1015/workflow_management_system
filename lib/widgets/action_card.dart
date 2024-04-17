import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workfow_management_system/resources/color_manager.dart';
import 'package:workfow_management_system/resources/style_manager.dart';

class ActionCard extends StatelessWidget {
  const ActionCard(
      {super.key,

      required this.title,
      required this.mainTitle,
      required this.textOfButton, required this.width, this.onTap});

  final String title;
  final String mainTitle;
  final String textOfButton;
  final double width;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          height: 140.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 0.r,
                blurRadius: 4.r,
                offset: Offset(
                    0.w, 4.h), // changes position of shadow
              ),
            ],
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 25.w,
                height: 25.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(
                      color: ColorManager.primary,
                    )),
                child: Center(
                  child: Text(title,
                      style:
                          TextStyle(color:ColorManager.primary, fontSize: 4.sp)),
                ),
              ),
              Text(mainTitle,
                  style: commonTextStyle),
              InkWell(
                 onTap: onTap,
                child: Container(
                  height: 25.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.r),
                      border: Border.all(
                          color: ColorManager.primary, width: 0.2.w)),
                  child: Center(
                    child: Text(textOfButton,
                        style: TextStyle(color: ColorManager.black , fontSize: 5.sp)),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 5.h,
          width: width,
          color:ColorManager.primary,
        )
      ],
    );
  }
}
