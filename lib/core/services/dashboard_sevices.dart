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
    var value = await _tasksCollectionRef.orderBy('created at', descending: true).get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getVacations() async {
    var value = await _vacationsCollectionRef.orderBy('created at', descending: true).get();
    return value.docs;
  }

  Future<void> addTaskToFireStore(TaskModel taskModel)async{
    String taskId = documentReference.id;
    taskModel.taskId = taskId;
    taskModel.createdAt = Timestamp.now();
    return await _tasksCollectionRef.doc(taskId).set(taskModel.toJson());
  }


  Future<void> addVacationToFireStore(VacationModel vacationModel)async{
    String vacationId = documentReference.id;
    vacationModel.vacationId = vacationId;
    vacationModel.createdAt = Timestamp.now();
    return await _vacationsCollectionRef.doc(vacationId).set(vacationModel.toJson());
  }

  Future<void> deleteVacationById(String documentId) async {
    await _vacationsCollectionRef.doc(documentId).delete();
  }

  Future<void> deleteTaskById(String documentId) async {
    await _tasksCollectionRef.doc(documentId).delete();
  }

  Future<void> updateTaskById(String documentId, Map<String, dynamic> updatedData) async {
    await _tasksCollectionRef.doc(documentId).update(updatedData);
  }
  Future<void> updateVacationStatusById({required String documentId,required String value}) async {
    _vacationsCollectionRef.doc(documentId).update({'vacation status': value});
  }
}
