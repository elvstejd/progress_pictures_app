import 'package:flutter/material.dart';
import 'package:progress_pictures_app/utils/show_custom_modal_bottom_sheet.dart';
import 'package:progress_pictures_app/widgets/collection_card.dart';
import 'package:progress_pictures_app/widgets/collection_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var collections = ['heelo', 'hola', 'que tal'];

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
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            itemCount: collections.length,
            itemBuilder: (context, index) => CollectionCard(
              title: collections[index],
              date: 'today',
              entries: 0,
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 20,
        onPressed: () {
          showCustomModalBottomSheet(context, const CollectionForm(),
              title: "Create new collection");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
