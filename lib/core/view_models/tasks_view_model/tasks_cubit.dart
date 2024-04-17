import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workfow_management_system/core/firebase_services/tasks_services.dart';
import 'package:workfow_management_system/core/models/task_model.dart';
import 'package:workfow_management_system/core/view_models/tasks_view_model/tasks_state.dart';

class TasksCubit extends Cubit<TasksStates> {
  TasksCubit() : super(TasksInitial());
  static TasksCubit get(context) => BlocProvider.of(context);

  List<TaskModel> get tasks => _tasks;
  List<TaskModel> _tasks = [];

  List<TaskModel> get responses => _responses;
  List<TaskModel> _responses = [];

  getTasks() async {
    emit(GetTasksLoadingState());
    TasksServices().getTasks().then((value) {
      _tasks = [];
      for (int i = 0; i < value.length; i++) {
        _tasks.add(TaskModel.fromJson(value[i].data() as Map<String, dynamic>));
        print(_tasks.length);
      }
    }).then((value) {
      emit(GetTasksSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetTasksErrorState(error.toString()));
    });
  }

  Future<void> addTaskToFireStore(
    String taskName,
    String taskSender,
    String taskReceiver,
    String taskDeadline,
  ) async {
    emit(AddTaskLoadingState());
    final taskModel = TaskModel(
      isSubmitted: false,
      taskResponse: "",
      taskDeadline: taskDeadline,
      taskReceiver: taskReceiver,
      taskSender: taskSender,
      taskTitle: taskName,
      createdAt: Timestamp.now(),
    );
    TasksServices().addTaskToFireStore(taskModel).then((value) {
      getTasks();
      print("added successfully");
      emit(AddTaskSuccessState());
    }).catchError((error) {
      print(error);
      emit(AddTaskErrorState(error.toString()));
    });
  }

  Future<void> deleteTaskById(String documentId) async {
    emit(DeleteTaskLoadingState());
    TasksServices().deleteTaskById(documentId).then((value) {
      getTasks();
      print("deleted successfully");
      emit(DeleteTaskSuccessState());
    }).catchError((error) {
      print(error);
      emit(DeleteTaskErrorState(error.toString()));
    });
  }

  Future<void> updateTaskById(
      {required String documentId,
      required String taskTitle,
      required String taskSender,
      required String taskReceiver,
      required String taskDeadline}) async {
    emit(UpdateTaskLoadingState());
    TasksServices().updateTaskById(documentId, {
      "task title": taskTitle,
      "task sender": taskSender,
      "task receiver": taskReceiver,
      "task deadline": taskDeadline,
    }).then((value) {
      getTasks();
      print("updated successfully");
      emit(UpdateTaskSuccessState());
    }).catchError((error) {
      print(error);
      emit(UpdateTaskErrorState(error.toString()));
    });
  }

  Future<void> updateTaskResponseById(
      {required String documentId, required String taskResponse}) async {
    emit(UpdateTaskResponseLoadingState());

    TasksServices().updateTaskById(documentId, {
      "task response": taskResponse,
    }).then((value) {
      updateResponseStatusById(documentId);
      getTasksResponse();
      print("updated successfully");
      emit(UpdateTaskResponseSuccessState());
    }).catchError((error) {
      print(error);
      emit(UpdateTaskResponseErrorState(error.toString()));
    });
  }

  getTasksResponse() {
    emit(GetTasksResponseLoadingState());

    TasksServices().getTasksResponse().then((value) {
      _responses = [];
      for (int i = 0; i < value.length; i++) {
        _responses
            .add(TaskModel.fromJson(value[i].data() as Map<String, dynamic>));
        print(_responses.length);
      }
    }).then((value) {
      emit(GetTasksResponseSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetTasksResponseErrorState(error.toString()));
    });
  }

Future<void> updateResponseStatusById(String documentId)async{
  emit(UpdateResponseStatusLoadingState());
  TasksServices().updateResponseStatusById(documentId: documentId).then((value){
    emit(UpdateResponseStatusSuccessState());
  }).catchError((error){
    emit(UpdateResponseStatusErrorState(error.toString()));

  });
}

}
