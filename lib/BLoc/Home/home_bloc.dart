import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/BLoc/Home/home_event.dart';
import 'package:todo/BLoc/Home/home_state.dart';
import 'package:todo/data/repository/task_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ITaskRepository _iTaskRepository;
  HomeBloc(this._iTaskRepository) : super(HomeInitState()) {
    on<HomeShowListEvent>(
      (event, emit) async {
        emit(HomeLoadingState());
        var taskList = await _iTaskRepository.getItems();
        emit(HomeResponse(taskList));
      },
    );
    on<DeleteItemEvent>(
      (event, emit) async {
        await _iTaskRepository.deleteItem(event.index);
        var taskList = await _iTaskRepository.getItems();
        emit(HomeResponse(taskList));
      },
    );
  }
}
