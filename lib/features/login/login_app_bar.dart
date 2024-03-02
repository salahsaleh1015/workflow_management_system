
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/assets_maneger.dart';
import '../../resources/color_manager.dart';

PreferredSize loginAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(55.h),
    child: AppBar(
      backgroundColor: ColorManager.primary,
      title: Row(children: [
        SizedBox(
          width: 50.w,
        ),
        Image.asset(AssetsManager.loginIcon),
        SizedBox(
          width: 10.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("work flow",
                style: TextStyle(
                  fontSize: 5.sp,
                  color: ColorManager.white,
                )),
            Text("management",
                style: TextStyle(
                  fontSize: 5.sp,
                  color: ColorManager.green,
                )),
          ],
        ),
        SizedBox(
          width: 10.w,
        ),
        Container(
          color: ColorManager.white,
          height: 45.h,
          width: 0.7.w,
        ),
        SizedBox(
          width: 10.w,
        ),
        InkWell(
          onTap: (){},
          child: Text("Users",
              style: TextStyle(
                fontSize: 5.sp,
                color: ColorManager.white,
              )),
        ),
        SizedBox(
          width: 10.w,
        ),
        Container(
          color: ColorManager.white,
          height: 20.h,
          width: 0.2.w,
        ),
        SizedBox(
          width: 10.w,
        ),
        InkWell(
          onTap: (){},
          child: Text("Tasks",
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 5.sp,
                color: ColorManager.white,
              )),
        ),
        SizedBox(
          width: 10.w,
        ),
        Container(
          color: ColorManager.white,
          height: 20.h,
          width: 0.2.w,
        ),
      ]),
    ),
  );
}
