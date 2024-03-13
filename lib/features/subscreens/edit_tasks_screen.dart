


  import 'package:flutter/material.dart';
import 'package:workfow_management_system/widgets/tasks_table.dart';

class EditTasksScreen extends StatelessWidget {
    const EditTasksScreen({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child:  TasksTable(
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.height*0.8,
            showButton: false,
            isMore: true,
            icon: Icons.more_horiz,
          ),
        ),
      );
    }
  }
