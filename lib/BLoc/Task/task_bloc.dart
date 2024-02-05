import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/BLoc/Task/task_event.dart';
import 'package:todo/BLoc/Task/task_state.dart';
import 'package:todo/data/repository/task_type_repository.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final ITaskTypeRepository _iTaskTypeRepository;
  TaskBloc(this._iTaskTypeRepository) : super(TaskInitState()) {
    on<TaskTypeListEvent>(
      (event, emit) async {
        emit(TaskLoadingState());
        var taskTypeList = await _iTaskTypeRepository.getTaskTypeList();
        emit(TaskReponseState(taskTypeList));
      },
    );
  }
}
