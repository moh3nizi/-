import 'package:hive_flutter/hive_flutter.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  String title = '';
  @HiveField(1)
  String bodyText = '';
  @HiveField(2)
  bool isComplited = false;
  @HiveField(3)
  bool isDeleted = false;
  @HiveField(4)
  DateTime date = DateTime.now();
}
