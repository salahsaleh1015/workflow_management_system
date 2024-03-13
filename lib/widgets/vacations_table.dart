import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workfow_management_system/resources/style_manager.dart';
import 'package:workfow_management_system/resources/color_manager.dart';

class VacationsTable extends StatelessWidget {
  const VacationsTable({super.key, required this.width, required this.height,  this.showButtons = false});
final double width;
  final double height;
  final bool showButtons;
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
                  Icons.file_copy_outlined,
                  color: ColorManager.blue,
                  size: 20.r,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "vacations",
                  style: TextStyle(fontSize: 5.sp, fontWeight: FontWeight.bold),
                )
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
                      width: 20.w, child: Text("type", style: commonTextStyle)),
                  Text("duration", style: commonTextStyle),
                  Text("start date", style: commonTextStyle),
                  Text("sender", style: commonTextStyle),
                  SizedBox(
                    width: 25.w,
                  )
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
                              width: 20.w,
                              child: Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  "ordinary",
                                  style: commonTextStyle)),
                          Text("3 days", style: commonTextStyle),
                          Text("11-3-2024", style: commonTextStyle),
                          Text("marwa anany", style: commonTextStyle),

                          (showButtons == true)? Row(
                            children: [
                              InkWell(
                                child: CircleAvatar(
                                  backgroundColor: ColorManager.green,
                                  radius: 7.r,
                                  child: Center(
                                      child: Icon(Icons.add,
                                          color: ColorManager.white, size: 10.r)),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              InkWell(
                                child: CircleAvatar(
                                  backgroundColor: ColorManager.red,
                                  radius: 7.r,
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 15.h),
                                    child: Center(
                                        child: Icon(Icons.minimize,
                                            color: ColorManager.white, size: 10.r)),
                                  ),
                                ),
                              )
                            ],
                          ):SizedBox(
                            width: 20.w,
                          )

                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, i) => SizedBox(height: 2.h),
                  itemCount: 5))
        ],
      ),
    );
  }
}
