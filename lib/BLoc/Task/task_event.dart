import 'package:todo/data/model/task_type.dart';

abstract class TaskEvent {}

class TaskTypeListEvent extends TaskEvent {}

class AddTaskEvent extends TaskEvent {
  String title;
  String subTitle;
  DateTime time;
  TaskType taskType;

  AddTaskEvent(this.title, this.subTitle, this.time, this.taskType);
}
