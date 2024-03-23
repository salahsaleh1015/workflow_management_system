
abstract class DashboardStates {}

final class DashboardInitialState extends DashboardStates {}

final class DashboardLoadingState extends DashboardStates {}

final class DashboardSuccessState extends DashboardStates {}

final class DashboardErrorState extends DashboardStates {
  final String message;

  DashboardErrorState(this.message);
}


class AddTaskLoadingState extends DashboardStates {}
class AddTaskSuccessState extends DashboardStates {}

class AddTaskErrorState extends DashboardStates {
  final String error;

  AddTaskErrorState(this.error);

}
class DeleteTaskLoadingState extends DashboardStates {}
class DeleteTaskSuccessState extends DashboardStates {}

class DeleteTaskErrorState extends DashboardStates {
  final String error;

  DeleteTaskErrorState(this.error);

}

class UpdateTaskLoadingState extends DashboardStates {}
class UpdateTaskSuccessState extends DashboardStates {}

class UpdateTaskErrorState extends DashboardStates {
  final String error;

  UpdateTaskErrorState(this.error);

}

class AddVacationLoadingState extends DashboardStates {}
class AddVacationSuccessState extends DashboardStates {}

class AddVacationErrorState extends DashboardStates {
  final String error;

  AddVacationErrorState(this.error);

}