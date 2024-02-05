import 'package:todo/data/model/task_type.dart';

abstract class TaskState {}

class TaskInitState extends TaskState {}

class TaskLoadingState extends TaskState {}

class TaskReponseState extends TaskState {
  List<TaskType> taskTypeList;

  TaskReponseState(this.taskTypeList);
}
