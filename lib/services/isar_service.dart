import 'dart:io';

import 'package:isar/isar.dart';
import 'package:progress_pictures_app/entities/entry.dart';
import 'package:progress_pictures_app/entities/folder.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    Directory dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([FolderSchema, EntrySchema], directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }

  Future<void> createFolder(Folder newFolder) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.folders.putSync(newFolder));
  }

  Stream<List<Folder>> listenToFolders() async* {
    final isar = await db;
    yield* isar.folders.where().watch();
  }
}
