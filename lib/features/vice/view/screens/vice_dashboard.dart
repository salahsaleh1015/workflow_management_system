import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:workfow_management_system/core/view_model/dashboard_cubit.dart';
import 'package:workfow_management_system/core/view_model/dashboard_state.dart';
import 'package:workfow_management_system/resources/color_manager.dart';
import 'package:workfow_management_system/widgets/action_card.dart';
import 'package:workfow_management_system/widgets/control_bar.dart';
import 'package:workfow_management_system/widgets/info_card.dart';
import 'package:workfow_management_system/widgets/tasks_table.dart';
import 'package:workfow_management_system/widgets/vacations_table.dart';
import 'package:workfow_management_system/widgets/vice_control_bar.dart';

class ViceDashboard extends StatelessWidget {
 const  ViceDashboard({super.key});


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<DashboardCubit, DashboardStates>(
      listener: (context, state){},
      builder: (context, state) {
        if (state is DashboardSuccessState || state is AddVacationSuccessState || state is AddTaskSuccessState) {
          return Container(
            color: ColorManager.white,
            child: Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                const ViceControlBar(
                  userName: "Maher",
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TasksTable(
                      width: 170.w,
                      height: 300.h,

                    ),
                    VacationsTable(
                      showButtons: false,
                      width: 170.w,
                      height: 300.h,
                    )
                  ],
                )
              ],
            ),
          );
        }else if(state is DashboardErrorState){
          return Center(
            child: Text(state.message),
          );
        }else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }


      },
    );
  }


}
