import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workfow_management_system/core/view_models/vacations_view_model/vacations_cubit.dart';
import 'package:workfow_management_system/core/view_models/vacations_view_model/vacations_state.dart';
import 'package:workfow_management_system/resources/style_manager.dart';
import 'package:workfow_management_system/resources/color_manager.dart';

class VacationsTable extends StatelessWidget {
  const VacationsTable(
      {super.key,
      required this.width,
      required this.height,
      this.showButtons = false});
  final double width;
  final double height;
  final bool showButtons;
  @override
  Widget build(BuildContext context) {
    var cubit = VacationsCubit.get(context);
    return BlocBuilder<VacationsCubit, VacationsStates>(
      builder: (context, state) {
        if (state is GetVacationsSuccessState ||
            state is AddVacationSuccessState) {
          return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              border: Border.all(color: ColorManager.grey, width: 0.3.w),
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 6.h),
                  child: Row(
                    children: [
                      Icon(
                        Icons.file_copy_outlined,
                        color: ColorManager.blue,
                        size: 20.r,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "vacations",
                        style: TextStyle(
                            fontSize: 5.sp, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: double.infinity,
                  height: 30.h,
                  color: ColorManager.lightGrey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 30.w,
                            child: Text("type", style: commonTextStyle)),
                        SizedBox(
                            width: 30.w,
                            child: Text("duration", style: commonTextStyle)),
                        SizedBox(
                            width: 30.w,
                            child: Text("start date", style: commonTextStyle)),
                        SizedBox(
                            width: 30.w,
                            child: Text("sender", style: commonTextStyle)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 8.h),
                            child: Row(
                              children: [
                                SizedBox(
                                    width: 30.w,
                                    child: Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        cubit.vacationModel[i].vacationType,
                                        style: commonTextStyle)),
                                SizedBox(
                                    width: 30.w,
                                    child: Text(
                                        cubit.vacationModel[i].vacationDuration,
                                        style: commonTextStyle)),
                                SizedBox(
                                    width: 30.w,
                                    child: Text(
                                        cubit
                                            .vacationModel[i].vacationStartDate,
                                        style: commonTextStyle)),
                                SizedBox(
                                    width: 20.w,
                                    child: Text(
                                        cubit.vacationModel[i].vacationSender,
                                        style: commonTextStyle)),

                                SizedBox(
                                    width: 25.w,
                                    child: Text("(${cubit.vacationModel[i].vacationStatus})", style: commonHintStyle)),
                                (showButtons == true)
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [

                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                cubit.updateVacationStatusById(
                                                  cubit.vacationModel[i].vacationId!,
                                                  "accepted",
                                                );
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: ColorManager.green,
                                              )),
                                          IconButton(
                                              onPressed: () {

                                                cubit.updateVacationStatusById(
                                                  cubit.vacationModel[i].vacationId!,
                                                  "rejected",
                                                );
                                              },
                                              icon: Icon(
                                                Icons.delete_sweep_rounded,
                                                color: ColorManager.red,
                                              )),
                                          SizedBox(
                                            width: 40.w,
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                cubit.deleteVacationById(
                                                  cubit.vacationModel[i]
                                                      .vacationId!,
                                                );
                                              },
                                              icon: Icon(
                                                Icons.delete_forever,
                                                color: ColorManager.red,
                                              ))
                                        ],
                                      )
                                    : SizedBox(
                                        width: 10.w,
                                      )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, i) => SizedBox(height: 2.h),
                        itemCount: cubit.vacationModel.length))
              ],
            ),
          );
        } else if (state is GetVacationsErrorState) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
