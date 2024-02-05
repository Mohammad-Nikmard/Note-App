import 'package:todo/DI/service_locator.dart';
import 'package:todo/data/datasource/task_datasource.dart';
import 'package:todo/data/model/task.dart';

abstract class ITaskRepository {
  Future<void> addItem(Task taskItem);
  Future<List<Task>> getItems();
  Future<void> deleteItem(int index);
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
  Future<void> deleteItem(int index) async {
    await _datasource.deleteItem(index);
  }
}
