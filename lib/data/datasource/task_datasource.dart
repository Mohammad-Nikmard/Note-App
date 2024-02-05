import 'package:hive_flutter/adapters.dart';
import 'package:todo/data/model/task.dart';

abstract class ITaskDatasource {
  Future<void> addTasks(Task taskItem);
  Future<List<Task>> getItems();
  Future<void> deleteItem(int index);
  Future<void> saveIsDone(Task taskItem, bool isTrue);
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
  Future<void> deleteItem(int index) async {
    await box.deleteAt(index);
  }

  @override
  Future<void> saveIsDone(Task taskItem, bool isTrue) async {
    taskItem.isDone = isTrue;
    taskItem.save();
  }
}
