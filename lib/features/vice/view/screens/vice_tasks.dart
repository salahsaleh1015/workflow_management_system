



  import 'package:flutter/material.dart';
import 'package:workfow_management_system/widgets/tasks_table.dart';

class ViceTasks extends StatelessWidget {
    const ViceTasks({super.key});

    @override
    Widget build(BuildContext context) {
      return  Center(
        child:  TasksTable(
          width: MediaQuery.of(context).size.width*0.8,
          height: MediaQuery.of(context).size.height*0.8,

        ),
      );
    }
  }
