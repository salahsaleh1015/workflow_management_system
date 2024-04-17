import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workfow_management_system/core/view_models/tasks_view_model/tasks_cubit.dart';
import 'package:workfow_management_system/core/view_models/tasks_view_model/tasks_cubit.dart';
import 'package:workfow_management_system/core/view_models/tasks_view_model/tasks_state.dart';
import 'package:workfow_management_system/resources/color_manager.dart';
import 'package:workfow_management_system/resources/style_manager.dart';

class ResponsesScreen extends StatelessWidget {
  const ResponsesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksStates>(
      builder: (context, state) {
        var cubit = TasksCubit.get(context);
        return Scaffold(

            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Expanded(
                    child: GridView.count(
                      crossAxisCount: 5, crossAxisSpacing: 5, mainAxisSpacing: 5,
                      children: List.generate(cubit.responses.length, (index) =>
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
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(cubit.responses[index].taskReceiver,style: commonTextStyle,),
                                  Text(cubit.responses[index].taskResponse,style: commonHintStyle,overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            )
                          ),


                      ),
                    )
                    ) ),
            ),
            )
        ;
      },
    );
  }
}
