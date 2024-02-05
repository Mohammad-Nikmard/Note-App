import 'package:hive/hive.dart';
import 'package:todo/data/model/task_type.dart';
part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subtitle;
  @HiveField(2)
  DateTime time;
  @HiveField(3)
  TaskType taskType;
  @HiveField(4)
  bool isDone;

  Task(this.title, this.subtitle, this.time, this.taskType,
      {this.isDone = false});
}
