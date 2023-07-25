import 'package:isar/isar.dart';
import 'package:progress_pictures_app/entities/folder.dart';

part 'entry.g.dart';

@Collection()
class Entry {
  Id id = Isar.autoIncrement;

  // entry date
  // list of picture files
  // note, limited?

  final folder = IsarLink<Folder>();
}
