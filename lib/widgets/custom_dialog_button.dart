
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:workfow_management_system/resources/color_manager.dart';


 class CustomDialogButton extends StatelessWidget {
   const CustomDialogButton({super.key, required this.buttonOnTap});
   final Function()? buttonOnTap;
   @override
   Widget build(BuildContext context) {
     return  InkWell(
       onTap: buttonOnTap,
       child: Container(
         decoration: BoxDecoration(
           borderRadius:
           BorderRadius.circular(25.r),
           color: ColorManager.primary,
         ),
         width: double.infinity,
         height: 40.h,
         child: Center(
           child: Text("Done",
               style: TextStyle(
                   color: ColorManager.white,
                   fontWeight: FontWeight.bold)),
         ),
       ),
     );
   }
 }
