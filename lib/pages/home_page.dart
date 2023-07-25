import 'package:flutter/material.dart';
import 'package:progress_pictures_app/entities/folder.dart';
import 'package:progress_pictures_app/services/isar_service.dart';
import 'package:progress_pictures_app/utils/show_custom_modal_bottom_sheet.dart';
import 'package:progress_pictures_app/widgets/folder_card.dart';
import 'package:progress_pictures_app/widgets/folder_form.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final isar = IsarService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Collections',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w700)),
        elevation: 0,
      ),
      body: Container(
          color: Colors.grey.shade100,
          child: StreamBuilder<List<Folder>>(
              stream: isar.listenToFolders(),
              builder: (context, snapshot) {
                return ListView.separated(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                  itemBuilder: (context, index) => FolderCard(
                    title: snapshot.data![index].title!,
                    date: 'today',
                    entries: 0,
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                );
              })),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 20,
        onPressed: () {
          showCustomModalBottomSheet(context, FolderForm(isarService: isar),
              title: "Create new collection");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
