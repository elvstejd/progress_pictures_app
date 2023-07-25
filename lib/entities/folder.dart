import 'package:isar/isar.dart';
import 'package:progress_pictures_app/entities/entry.dart';

part 'folder.g.dart';

@Collection()
class Folder {
  Id id = Isar.autoIncrement;
  String? title;

  @Backlink(to: 'folder')
  final entries = IsarLink<Entry>();
}
