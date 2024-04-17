

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workfow_management_system/resources/style_manager.dart';
import 'package:workfow_management_system/widgets/custom_dialog_button.dart';
import 'package:workfow_management_system/widgets/custom_text_formfield.dart';
import 'package:workfow_management_system/widgets/tasks_table.dart';

 class SubmitTasksScreen extends StatelessWidget {
    SubmitTasksScreen({super.key});


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Center(
         child:  TasksTable(
           width: MediaQuery.of(context).size.width*0.8,
           height: MediaQuery.of(context).size.height*0.8,
           isMore: false,
           isDelete: false,
           isResponse: true,
         submitResponse: (){

         },
         ),
       ),
     );
   }
 }
