import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workfow_management_system/core/firebase_services/vacation_services.dart';
import 'package:workfow_management_system/core/models/vacation_model.dart';
import 'package:workfow_management_system/core/view_models/vacations_view_model/vacations_state.dart';


class VacationsCubit extends Cubit<VacationsStates> {
  VacationsCubit() : super(VacationsInitial());

 static VacationsCubit get(context) => BlocProvider.of(context);



  List<VacationModel> get vacationModel => _vacationModel;
  List<VacationModel> _vacationModel = [];







  getVacations() async {
    emit(GetVacationsLoadingState());
    VacationServices().getVacations().then((value) {
      _vacationModel = [];
      for (int i = 0; i < value.length; i++) {
        _vacationModel.add(
            VacationModel.fromJson(value[i].data() as Map<String, dynamic>));
        print(_vacationModel.length);
      }
    }).then((value) {
      emit(GetVacationsSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetVacationsErrorState(error.toString()));
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
      createdAt: Timestamp.now(),
      vacationStartDate: vacationStartDate,
      vacationSender: vacationSender,
      vacationType: vacationType,
      vacationDuration: vacationDuration,
      vacationStatus: "pending",
    );
    VacationServices().addVacationToFireStore(vacationModel).then((value) {
      getVacations();
      print("added successfully");
      emit(AddVacationSuccessState());
    }).catchError((error) {
      print(error);
      emit(AddVacationErrorState(error.toString()));
    });
  }


  Future<void> deleteVacationById(String documentId) async {
    emit(DeleteVacationLoadingState());
    VacationServices().deleteVacationById(documentId).then((value) {
      getVacations();
      print("deleted successfully");
      emit(DeleteVacationSuccessState());
    }).catchError((error) {
      print(error);
      emit(DeleteVacationErrorState(error.toString()));
    });
  }

  Future<void> updateVacationStatusById(String documentId , String value)async{
    emit(UpdateVacationLoadingState());
    VacationServices().updateVacationStatusById(
      documentId:documentId,
      value: value,
    ).then((value) {
      getVacations();
      print("updated successfully");
      emit(UpdateVacationSuccessState());
    }).catchError((error) {
      print(error);
      emit(UpdateVacationErrorState(error.toString()));
    });

  }
}
