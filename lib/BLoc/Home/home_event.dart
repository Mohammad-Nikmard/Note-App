import 'package:todo/data/model/task.dart';

abstract class HomeEvent {}

class HomeShowListEvent extends HomeEvent {}

class DeleteItemEvent extends HomeEvent {
  Task taskItem;

  DeleteItemEvent(this.taskItem);
}

class CheckBoxItem extends HomeEvent {
  bool isTapped;
  Task taskItem;

  CheckBoxItem(this.isTapped, this.taskItem);
}
