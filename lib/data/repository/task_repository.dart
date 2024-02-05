import 'package:todo/DI/service_locator.dart';
import 'package:todo/data/datasource/task_datasource.dart';
import 'package:todo/data/model/task.dart';
import 'package:todo/data/model/task_type.dart';

abstract class ITaskRepository {
  Future<void> addItem(Task taskItem);
  Future<List<Task>> getItems();
  Future<void> deleteItem(Task taskItem);
  Future<void> saveIsDone(Task taskItem, bool isTrue);
  Future<void> editItem(Task taskItem, String title, String subTitle,
      DateTime time, TaskType type);
}

class TaskHiveRepository extends ITaskRepository {
  final ITaskDatasource _datasource = locator.get();
  @override
  Future<void> addItem(Task taskItem) async {
    await _datasource.addTasks(taskItem);
  }

  @override
  Future<List<Task>> getItems() async {
    return await _datasource.getItems();
  }

  @override
  Future<void> deleteItem(Task taskItem) async {
    await _datasource.deleteItem(taskItem);
  }

  @override
  Future<void> saveIsDone(Task taskItem, bool isTrue) async {
    await _datasource.saveIsDone(taskItem, isTrue);
  }

  @override
  Future<void> editItem(Task taskItem, String title, String subTitle,
      DateTime time, TaskType type) async {
    await _datasource.editItem(taskItem, title, subTitle, time, type);
  }
}
