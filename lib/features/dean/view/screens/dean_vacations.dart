
import 'package:flutter/material.dart';



import 'package:workfow_management_system/widgets/vacations_table.dart';



class DeanVacations extends StatelessWidget {
  const DeanVacations({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: VacationsTable(
        showButtons: false,
        width: MediaQuery.of(context).size.width*0.8,
        height: MediaQuery.of(context).size.height*0.8,
      )
    );
  }
}