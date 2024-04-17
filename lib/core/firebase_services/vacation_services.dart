import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workfow_management_system/core/models/vacation_model.dart';


class VacationServices {

  final CollectionReference _vacationsCollectionRef =
  FirebaseFirestore.instance.collection("Vacations");

  final DocumentReference documentReference =
  FirebaseFirestore.instance.collection('Vacations').doc();


  Future<List<QueryDocumentSnapshot>> getVacations() async {
    var value = await _vacationsCollectionRef.orderBy('created at', descending: true).get();
    return value.docs;
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


  Future<void> updateVacationStatusById({required String documentId,required String value}) async {
    _vacationsCollectionRef.doc(documentId).update({'vacation status': value});
  }


}