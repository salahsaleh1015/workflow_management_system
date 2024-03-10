import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workfow_management_system/resources/style_manager.dart';
import 'package:workfow_management_system/resources/color_manager.dart';

class TasksTable extends StatelessWidget {
  const TasksTable(
      {super.key,
      required this.height,
      required this.width,
      required this.showButton});
  final double height;
  final double width;
  final bool showButton;

  @override
  Widget build(BuildContext context) {
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
            child: Row(
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
                  style: TextStyle(
                      fontSize: 5.sp, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                (showButton == true)?
                InkWell(
                  onTap: (){},
                  child: Container(
                    width: 25.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(
                          color: ColorManager.green,
                        )),
                    child: Center(
                      child: Text("add Task",
                          style:
                          TextStyle(color:ColorManager.green, fontSize: 4.sp)),
                    ),
                  ),
                ):SizedBox(width: 10.w),

              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            width: double.infinity,
            height: 30.h,
            color: ColorManager.lightGrey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 30.w,
                      child: Text("title", style: commonTextStyle)),
                  Text("sender", style: commonTextStyle),
                  Text("deadline", style: commonTextStyle),
                  Text("time remaining", style: commonTextStyle),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, i) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 30.w,
                              child: Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  "ahhsabkajjdjdjdgsffafsvxvgsvxh",
                                  style: commonTextStyle)),
                          Text("ahmed salama", style: commonTextStyle),
                          Text("11-3-2024", style: commonTextStyle),
                          Text("more than month", style: commonTextStyle)
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, i) => SizedBox(height: 2.h),
                  itemCount: 30))
        ],
      ),
    );
  }
}
