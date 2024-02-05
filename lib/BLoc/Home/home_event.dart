import 'package:todo/data/model/task.dart';

abstract class HomeEvent {}

class HomeShowListEvent extends HomeEvent {}

class DeleteItemEvent extends HomeEvent {
  int index;

  DeleteItemEvent(this.index);
}

class CheckBoxItem extends HomeEvent {
  bool isTapped;
  Task taskItem;

  CheckBoxItem(this.isTapped, this.taskItem);
}
