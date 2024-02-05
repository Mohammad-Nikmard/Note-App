import 'package:hive/hive.dart';
part 'task_type.g.dart';

@HiveType(typeId: 1)
class TaskType {
  @HiveField(0)
  String title;
  @HiveField(1)
  String image;
  @HiveField(2)
  int index;

  TaskType(this.title, this.image, this.index);
}
