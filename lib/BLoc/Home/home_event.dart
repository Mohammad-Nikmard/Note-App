abstract class HomeEvent {}

class HomeShowListEvent extends HomeEvent {}

class DeleteItemEvent extends HomeEvent {
  int index;

  DeleteItemEvent(this.index);
}
