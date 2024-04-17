



  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workfow_management_system/resources/color_manager.dart';

class InfoCard extends StatelessWidget {
    const InfoCard({super.key, required this.name,});
    final String name;


    @override
    Widget build(BuildContext context) {
      return   Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 120.h,
            width: 80.w,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0.w, 2.h), // changes position of shadow
                ),
              ],
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome back ",
                        style: TextStyle(

                            fontWeight: FontWeight.bold,
                            fontSize: 5.sp,
                            color: ColorManager.primary)),
                    Text(name,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 5.sp,
                            color: ColorManager.black)),
                  ],
                ),

              ],
            ),
          ),
          SizedBox(
             height: 20.h,
          )
        ],
      );
    }
  }
