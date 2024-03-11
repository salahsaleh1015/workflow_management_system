



  import 'package:flutter/material.dart';
import 'package:workfow_management_system/widgets/vacations_table.dart';

class ViceVacations extends StatelessWidget {
    const ViceVacations({super.key});

    @override
    Widget build(BuildContext context) {
      return Center(
          child: VacationsTable(
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.height*0.8,
          )
      );
    }
  }
