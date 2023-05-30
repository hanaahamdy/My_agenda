import 'package:hive/hive.dart';
part  'NoteModel.g.dart';
@HiveType(typeId: 1)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subtitle;
  @HiveField(2)
  int color;
  @HiveField(3)
  String date;

  NoteModel(
      {required this.title,
      required this.color,
      required this.subtitle,
      required this.date});
}
