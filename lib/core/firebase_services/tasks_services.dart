
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workfow_management_system/core/models/task_model.dart';


class TasksServices {

  final CollectionReference _tasksCollectionRef =
  FirebaseFirestore.instance.collection("Tasks");

  final DocumentReference documentReference =
  FirebaseFirestore.instance.collection('Tasks').doc();




  Future<List<QueryDocumentSnapshot>> getTasks() async {
    var value = await _tasksCollectionRef.orderBy('created at', descending: true).get();
    return value.docs;
  }

  Future<void> addTaskToFireStore(TaskModel taskModel)async{
    String taskId = documentReference.id;
    taskModel.taskId = taskId;
    taskModel.createdAt = Timestamp.now();
    return await _tasksCollectionRef.doc(taskId).set(taskModel.toJson());
  }


  Future<void> deleteTaskById(String documentId) async {
    await _tasksCollectionRef.doc(documentId).delete();
  }


  Future<void> updateTaskById(String documentId, Map<String, dynamic> updatedData) async {
    await _tasksCollectionRef.doc(documentId).update(updatedData);
  }

  Future<void> updateTaskResponseById(String documentId, String response) async {
    await _tasksCollectionRef.doc(documentId).update({'task response': response});
  }

  Future<List<QueryDocumentSnapshot>> getTasksResponse() async {
    var value = await _tasksCollectionRef
        .where('task response', isNotEqualTo: '')

        .get();
    return value.docs;
  }

  Future<void> updateResponseStatusById({required String documentId}) async {
    _tasksCollectionRef.doc(documentId).update({'is submitted': true});
  }

}