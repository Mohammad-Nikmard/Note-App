import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/BLoc/Task/task_event.dart';
import 'package:todo/BLoc/Task/task_state.dart';
import 'package:todo/data/model/task.dart';
import 'package:todo/data/repository/task_repository.dart';
import 'package:todo/data/repository/task_type_repository.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final ITaskTypeRepository _iTaskTypeRepository;
  final ITaskRepository _iTaskRepository;
  TaskBloc(this._iTaskTypeRepository, this._iTaskRepository)
      : super(TaskInitState()) {
    on<TaskTypeListEvent>(
      (event, emit) async {
        emit(TaskLoadingState());
        var taskTypeList = await _iTaskTypeRepository.getTaskTypeList();
        emit(TaskReponseState(taskTypeList));
      },
    );
    on<AddTaskEvent>(
      (event, emit) async {
        emit(TaskLoadingState());
        Task taskItem =
            Task(event.title, event.subTitle, event.time, event.taskType);
        await _iTaskRepository.addItem(taskItem);
        emit(TaskAddedState());
      },
    );
  }
}
