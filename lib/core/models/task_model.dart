class TaskModel {
  String? taskId; // Added field for the document ID
  String taskTitle;
  String taskSender;
  String taskReceiver;
  String taskDeadline;

  TaskModel(
      { this.taskId,
      required this.taskTitle,
      required this.taskSender,
      required this.taskReceiver,
      required this.taskDeadline});

  TaskModel.fromJson(Map<String, dynamic> json)
      : taskId = json['task id'],
        taskTitle = json['task title'],
        taskSender = json['task sender'],
        taskReceiver = json['task receiver'],
        taskDeadline = json['task deadline'];

  Map<String, dynamic> toJson() {
    return {
      'task id': taskId,
      'task title': taskTitle,
      'task sender': taskSender,
      'task receiver': taskReceiver,
      'task deadline': taskDeadline,
    };
  }
}

