import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String? taskId; // Added field for the document ID
  String taskTitle;
  String taskSender;
  String taskReceiver;
  String taskDeadline;
  Timestamp createdAt;
  String taskResponse;
  bool isSubmitted;


  TaskModel(
      { this.taskId,
      required this.taskTitle,
      required this.taskSender,
      required this.taskReceiver,
      required this.isSubmitted,
      required this.taskDeadline,
        required this.taskResponse,
      required this.createdAt});

  TaskModel.fromJson(Map<String, dynamic> json)
      : taskId = json['task id'],
        isSubmitted = json['is submitted'],
        taskTitle = json['task title'],
        taskResponse = json['task response'],
        taskSender = json['task sender'],
        taskReceiver = json['task receiver'],
        createdAt = json['created at'],
        taskDeadline = json['task deadline'];

  Map<String, dynamic> toJson() {
    return {
      'task response': taskResponse,
      'task id': taskId,
      'task title': taskTitle,
      'task sender': taskSender,
      'task receiver': taskReceiver,
      'task deadline': taskDeadline,
      'created at': createdAt,
      'is submitted': isSubmitted
    };
  }
}

