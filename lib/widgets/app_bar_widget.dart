import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workfow_management_system/resources/color_manager.dart';
import 'package:workfow_management_system/resources/routes_manager.dart';

import '../resources/assets_maneger.dart';

PreferredSize appBarWidget({required Function() onPressed ,required String title , required String symbol , required String subTitle , }) => PreferredSize(
      preferredSize: Size.fromHeight(55.h),
      child: AppBar(
        backgroundColor: ColorManager.primary,
        title: Row(children: [
          SizedBox(
            width: 20.w,
          ),
          Icon(Icons.cast_for_education_outlined,color: ColorManager.white,size: 30.r,),
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
                    color: ColorManager.white,
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
          SizedBox(
            width: 150.w,
            child: TabBar(

                indicatorColor: ColorManager.transparent,
                dividerColor: ColorManager.transparent,
                tabs: const [
                  AppBarTab(

                    title: "Dashboard",
                  ),
                  AppBarTab(
                    title: "Tasks",
                  ),
                  AppBarTab(
                    title: "vacations",
                  ),
                ]),
          ),
          SizedBox(
            width: 10.w,
          ),
          CircleAvatar(
            radius: 15.r,
            backgroundColor: ColorManager.white,
            child: Center(
              child: Text(symbol,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorManager.primary,
                  )),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                    color: ColorManager.white,
                    fontSize: 5.sp,
                  )),
              Text(subTitle,
                  style: TextStyle(
                    color: ColorManager.white,
                    fontSize: 3.sp,
                  )),
            ],
          ),
          SizedBox(
            width: 10.w,
          ),
          IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.logout,
                color: ColorManager.white,
                size: 30.r,
              ))
        ]),
      ),
    );

class AppBarTab extends StatelessWidget {
  const AppBarTab({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                fontSize: 5.sp,
                color: ColorManager.white,
              )),
          Container(
            color: ColorManager.white,
            height: 20.h,
            width: 0.2.w,
          ),
        ],
      ),
    );
  }
}
