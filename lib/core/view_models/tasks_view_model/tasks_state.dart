abstract class TasksStates {}

class TasksInitial extends TasksStates {}

class GetTasksLoadingState extends TasksStates {}

class GetTasksSuccessState extends TasksStates {}

class GetTasksErrorState extends TasksStates {
  final String message;
  GetTasksErrorState(this.message);
}

class AddTaskLoadingState extends TasksStates {}

class AddTaskSuccessState extends TasksStates {}

class AddTaskErrorState extends TasksStates {
  final String error;

  AddTaskErrorState(this.error);
}

class DeleteTaskLoadingState extends TasksStates {}

class DeleteTaskSuccessState extends TasksStates {}

class DeleteTaskErrorState extends TasksStates {
  final String error;

  DeleteTaskErrorState(this.error);
}

class UpdateTaskLoadingState extends TasksStates {}

class UpdateTaskSuccessState extends TasksStates {}

class UpdateTaskErrorState extends TasksStates {
  final String error;

  UpdateTaskErrorState(this.error);
}

class UpdateTaskResponseLoadingState extends TasksStates {}

class UpdateTaskResponseSuccessState extends TasksStates {}

class UpdateTaskResponseErrorState extends TasksStates {
  final String error;

  UpdateTaskResponseErrorState(this.error);
}
 class GetTasksResponseSuccessState extends TasksStates {}
 class GetTasksResponseLoadingState extends TasksStates {}

class GetTasksResponseErrorState extends TasksStates {
  final String error;

  GetTasksResponseErrorState(this.error);
}

class UpdateResponseStatusSuccessState extends TasksStates {}
class UpdateResponseStatusLoadingState extends TasksStates {}

class UpdateResponseStatusErrorState extends TasksStates {
  final String error;

  UpdateResponseStatusErrorState(this.error);
}
