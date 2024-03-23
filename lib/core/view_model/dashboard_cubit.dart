import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workfow_management_system/core/models/task_model.dart';
import 'package:workfow_management_system/core/models/vacation_model.dart';
import 'package:workfow_management_system/core/services/dashboard_sevices.dart';
import 'package:workfow_management_system/core/view_model/dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardStates> {
  DashboardCubit() : super(DashboardInitialState());

  static DashboardCubit get(context) => BlocProvider.of(context);

  List<TaskModel> get taskModel => _taskModel;
  List<TaskModel> _taskModel = [];

  List<VacationModel> get vacationModel => _vacationModel;
  List<VacationModel> _vacationModel = [];

  getTasks() async {
    emit(DashboardLoadingState());
    DashboardServices().getTasks().then((value) {
      _taskModel = [];
      for (int i = 0; i < value.length; i++) {
        _taskModel
            .add(TaskModel.fromJson(value[i].data() as Map<String, dynamic>));
        print(_taskModel.length);
      }
    }).then((value) {
      emit(DashboardSuccessState());
    }).catchError((error) {
      print(error);
      emit(DashboardErrorState(error.toString()));
    });
  }

  getVacations() async {
    emit(DashboardLoadingState());
    DashboardServices().getVacations().then((value) {
      _vacationModel = [];
      for (int i = 0; i < value.length; i++) {
        _vacationModel.add(
            VacationModel.fromJson(value[i].data() as Map<String, dynamic>));
        print(_vacationModel.length);
      }
    }).then((value) {
      emit(DashboardSuccessState());
    }).catchError((error) {
      print(error);
      emit(DashboardErrorState(error.toString()));
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
      taskDeadline: taskDeadline,
      taskReceiver: taskReceiver,
      taskSender: taskSender,
      taskTitle: taskName,
    );
    DashboardServices().addTaskToFireStore(taskModel).then((value) {
      getTasks();
      print("added successfully");
      emit(AddTaskSuccessState());
    }).catchError((error) {
      print(error);
      emit(AddTaskErrorState(error.toString()));
    });
  }

  Future<void> addVacationToFireStore(
    String vacationStartDate,
    String vacationSender,
    String vacationType,
    String vacationDuration,
  ) async {
    emit(AddVacationLoadingState());
    final vacationModel = VacationModel(
      vacationStartDate: vacationStartDate,
      vacationSender: vacationSender,
      vacationType: vacationType,
      vacationDuration: vacationDuration,
    );
    DashboardServices().addVacationToFireStore(vacationModel).then((value) {
      getVacations();
      print("added successfully");
      emit(AddVacationSuccessState());
    }).catchError((error) {
      print(error);
      emit(AddVacationErrorState(error.toString()));
    });
  }

  Future<void> deleteTaskById(String documentId) async {
    emit(DeleteTaskLoadingState());
    DashboardServices().deleteTaskById(documentId).then((value) {
      getTasks();
      print("deleted successfully");
      emit(DeleteTaskSuccessState());
    }).catchError((error) {
      print(error);
      emit(DeleteTaskErrorState(error.toString()));
    });
  }

  Future<void> updateTaskById({required String documentId,required String taskTitle,
    required String taskSender,required String taskReceiver,required String taskDeadline}) async {
    emit(UpdateTaskLoadingState());
    DashboardServices().updateTaskById(documentId, {
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
}
