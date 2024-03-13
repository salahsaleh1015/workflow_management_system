








  import 'package:flutter/material.dart';
import 'package:workfow_management_system/widgets/vacations_table.dart';

class EditVacationsScreen extends StatelessWidget {
    const EditVacationsScreen({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body:  Center(
            child: VacationsTable(
              showButtons: true,
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.8,
            )
        ),
      );
    }
  }
