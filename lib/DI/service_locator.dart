import 'package:get_it/get_it.dart';
import 'package:todo/data/datasource/task_type_datasource.dart';
import 'package:todo/data/repository/task_type_repository.dart';

var locator = GetIt.instance;

void initServiceLocator() {
  locator.registerSingleton<ITaskTypeDatasource>(TaskTypeLocalDatasource());

  locator.registerSingleton<ITaskTypeRepository>(TaskTypeLocalRepository());
}
