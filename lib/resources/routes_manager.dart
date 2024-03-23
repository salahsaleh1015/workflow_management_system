



import 'package:flutter/material.dart';
import 'package:workfow_management_system/features/dean/view/dean_home_screen.dart';
import 'package:workfow_management_system/features/doctors/view/doctors_home_screen.dart';
import 'package:workfow_management_system/features/login/view/login_view.dart';
import 'package:workfow_management_system/features/subscreens/delete_task.dart';
import 'package:workfow_management_system/features/subscreens/edit_tasks_screen.dart';
import 'package:workfow_management_system/features/subscreens/edit_vacations_screen.dart';
import 'package:workfow_management_system/features/vice/view/vice_home_screen.dart';

class Routes {
  static const String loginRoute = "/";
  static const String deanRoute = "/dean";
  static const String viceRoute = "/vice";
  static const String staffRoute = "/staff";
  static const String manageVacationRoute = "/manageVacation";
  static const String editTasksRoute = "/editTasks";
  static const String deleteTasksRoute = "/deleteTasks";

}


class RouteGenerator {

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.deanRoute:
        return MaterialPageRoute(builder: (_) => const DeanHomeScreen());
      case Routes.viceRoute:
        return MaterialPageRoute(builder: (_) => const ViceHomeScreen());
      case Routes.staffRoute:
        return MaterialPageRoute(builder: (_) => const DoctorsHomeScreen());
      case Routes.manageVacationRoute:
        return MaterialPageRoute(builder: (_) => const EditVacationsScreen());
      case Routes.editTasksRoute:
        return MaterialPageRoute(builder: (_) => const EditTasksScreen());
      case Routes.deleteTasksRoute:
        return MaterialPageRoute(builder: (_) => const DeleteTasksScreen());
      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) =>
            Scaffold(
              appBar: AppBar(
                title: const Text(
                    "noRouteFound"
                ),
              ),
              body: const Center(
                child: Text(
                    "noRouteFound"
                ),
              ),
            ));
  }
}