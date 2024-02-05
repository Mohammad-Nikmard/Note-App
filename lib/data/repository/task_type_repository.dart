import 'package:todo/DI/service_locator.dart';
import 'package:todo/data/datasource/task_type_datasource.dart';
import 'package:todo/data/model/task_type.dart';

abstract class ITaskTypeRepository {
  Future<List<TaskType>> getTaskTypeList();
}

class TaskTypeLocalRepository extends ITaskTypeRepository {
  final ITaskTypeDatasource _datasource = locator.get();
  @override
  Future<List<TaskType>> getTaskTypeList() async {
    return await _datasource.getTaskTypeList();
  }
}
