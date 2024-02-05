import 'package:hive_flutter/adapters.dart';
import 'package:todo/data/model/task.dart';
import 'package:todo/data/model/task_type.dart';

abstract class ITaskDatasource {
  Future<void> addTasks(Task taskItem);
  Future<List<Task>> getItems();
  Future<void> deleteItem(Task taskItem);
  Future<void> saveIsDone(Task taskItem, bool isTrue);
  Future<void> editItem(Task taskItem, String title, String subTitle,
      DateTime time, TaskType type);
}

class TaskHiveDatasource extends ITaskDatasource {
  var box = Hive.box<Task>("TaskBox");
  @override
  Future<void> addTasks(Task taskItem) async {
    await box.add(taskItem);
  }

  @override
  Future<List<Task>> getItems() async {
    return box.values.toList();
  }

  @override
  Future<void> deleteItem(Task taskItem) async {
    await taskItem.delete();
  }

  @override
  Future<void> saveIsDone(Task taskItem, bool isTrue) async {
    taskItem.isDone = isTrue;
    taskItem.save();
  }

  @override
  Future<void> editItem(Task taskItem, String title, String subTitle,
      DateTime time, TaskType type) async {
    taskItem.title = title;
    taskItem.subtitle = subTitle;
    taskItem.time = time;
    taskItem.taskType = type;

    taskItem.save();
  }
}
