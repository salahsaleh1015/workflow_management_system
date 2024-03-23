import 'package:cloud_firestore/cloud_firestore.dart';

class VacationModel {
  String? vacationId;
  String vacationStartDate;
  String vacationSender;
  String vacationType;
  String vacationDuration;
  VacationModel({
      this.vacationId,
      required this.vacationStartDate,required this.vacationSender,
    required this.vacationType,required this.vacationDuration});

  VacationModel.fromJson(Map<String, dynamic> json)
      : vacationStartDate = json['vacation start date'],
        vacationSender = json['vacation sender'],
        vacationType = json['vacation type'],
        vacationDuration = json['vacation duration'],
        vacationId = json['vacation id']
  ;

  toJson() {
    return {
      'vacation start date': vacationStartDate,
      'vacation sender': vacationSender,
      'vacation type': vacationType,
      'vacation duration': vacationDuration,
      'vacation id': vacationId
    };
  }
}
