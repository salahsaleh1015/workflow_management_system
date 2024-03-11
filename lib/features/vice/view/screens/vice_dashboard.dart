import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workfow_management_system/resources/color_manager.dart';
import 'package:workfow_management_system/widgets/action_card.dart';
import 'package:workfow_management_system/widgets/info_card.dart';
import 'package:workfow_management_system/widgets/tasks_table.dart';
import 'package:workfow_management_system/widgets/vacations_table.dart';

class ViceDashboard extends StatelessWidget {
  const ViceDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorManager.white,
        child: Column(children: [
          SizedBox(
            height: 15.h,
          ),
          viceDashBoardBar(),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TasksTable(
                width: 150.w,
                height: 300.h,
                showButton: false,
              ),
              VacationsTable(
                width: 150.w,
                height: 300.h,
              )
            ],
          ),
        ]));
  }

  Widget viceDashBoardBar() => Container(
        height: 170.h,
        width: double.infinity,
        color: ColorManager.lightGrey,
        child: Padding(
          padding:
              EdgeInsets.only(bottom: 3.h, right: 10.w, left: 10.w, top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InfoCard(
                name: "Maher",
                onTap: () {},
              ),
              SizedBox(
                width: 10.w,
              ),
              ActionCard(
                width: 40.w,
                cardColor: ColorManager.red,
                title: "Task",
                mainTitle: "Add New Task",
                textOfButton: "Add Now",
              ),
              ActionCard(
                width: 40.w,
                cardColor: ColorManager.blue,
                title: "Vacation",
                mainTitle: "Accept or refuse",
                textOfButton: "Get It",
              ),
              ActionCard(
                width: 40.w,
                cardColor: ColorManager.red,
                title: "Task",
                mainTitle: "Edit Task",
                textOfButton: "Edit Now",
              ),
              ActionCard(
                width: 40.w,
                cardColor: ColorManager.yellow,
                title: "Task",
                mainTitle: "Delete Task",
                textOfButton: "Delete",
              ),
              ActionCard(
                width: 40.w,
                cardColor: ColorManager.blue,
                title: "Response",
                mainTitle: "Add New Response",
                textOfButton: "Add Now",
              ),
            ],
          ),
        ),
      );
}
