 import 'package:flutter/material.dart';
import 'package:workfow_management_system/widgets/tasks_table.dart';

class DeleteTasksScreen extends StatelessWidget {
   const DeleteTasksScreen({super.key});

   @override
   Widget build(BuildContext context) {
     return  Scaffold(
       body: Center(
         child:  TasksTable(
           width: MediaQuery.of(context).size.width*0.8,
           height: MediaQuery.of(context).size.height*0.8,
           isMore: true,
           isDelete: true,
           icon: Icons.delete_forever,
         ),
       ),
     );
   }
 }
