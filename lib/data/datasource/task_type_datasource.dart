import 'package:todo/data/model/task_type.dart';

abstract class ITaskTypeDatasource {
  Future<List<TaskType>> getTaskTypeList();
}

class TaskTypeLocalDatasource extends ITaskTypeDatasource {
  @override
  Future<List<TaskType>> getTaskTypeList() async {
    return [
      TaskType(
        "امور بانکی",
        'images/banking.png',
        0,
      ),
      TaskType(
        "کار سخت",
        'images/hard_working.png',
        1,
      ),
      TaskType(
        "آرامش",
        'images/meditate.png',
        2,
      ),
      TaskType(
        "قرار دوستانه",
        'images/social_frends.png',
        3,
      ),
      TaskType(
        "قرار کاری",
        'images/work_meeting.png',
        4,
      ),
      TaskType(
        "ورزش",
        'images/workout.png',
        5,
      ),
    ];
  }
}
