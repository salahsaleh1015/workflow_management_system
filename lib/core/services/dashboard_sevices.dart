import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workfow_management_system/core/models/task_model.dart';
import 'package:workfow_management_system/core/models/vacation_model.dart';

class DashboardServices {
  final CollectionReference _tasksCollectionRef =
      FirebaseFirestore.instance.collection("Tasks");

  final CollectionReference _vacationsCollectionRef =
      FirebaseFirestore.instance.collection("Vacations");

 final DocumentReference documentReference =
  FirebaseFirestore.instance.collection('Tasks').doc();

  Future<List<QueryDocumentSnapshot>> getTasks() async {
    var value = await _tasksCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getVacations() async {
    var value = await _vacationsCollectionRef.get();
    return value.docs;
  }

  Future<void> addTaskToFireStore(TaskModel taskModel)async{
    String taskId = documentReference.id;
    taskModel.taskId = taskId;

    return await _tasksCollectionRef.doc(taskId).set(taskModel.toJson());
  }


  Future<void> addVacationToFireStore(VacationModel vacationModel)async{
    String vacationId = documentReference.id;
    vacationModel.vacationId = vacationId;

    return await _vacationsCollectionRef.doc(vacationId).set(vacationModel.toJson());
  }


  Future<void> deleteTaskById(String documentId) async {
    await _tasksCollectionRef.doc(documentId).delete();
  }

  Future<void> updateTaskById(String documentId, Map<String, dynamic> updatedData) async {
    await _tasksCollectionRef.doc(documentId).update(updatedData);
  }
}
