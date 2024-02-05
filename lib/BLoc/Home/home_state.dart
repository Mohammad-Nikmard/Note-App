import 'package:todo/data/model/task.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeResponse extends HomeState {
  List<Task> taskList;

  HomeResponse(this.taskList);
}
