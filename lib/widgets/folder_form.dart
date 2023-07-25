import 'package:flutter/material.dart';
import 'package:progress_pictures_app/entities/folder.dart';
import 'package:progress_pictures_app/services/isar_service.dart';
import 'package:progress_pictures_app/widgets/text_input.dart';
import 'package:progress_pictures_app/widgets/primary_button.dart';

class FolderForm extends StatefulWidget {
  const FolderForm({
    super.key,
    required this.isarService,
  });

  final IsarService isarService;

  @override
  State<FolderForm> createState() => _FolderFormState();
}

class _FolderFormState extends State<FolderForm> {
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  String _title = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextInput(
            labelText: 'Title',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a value';
              }
              return null;
            },
            onSaved: (value) {
              _title = value!;
            },
          ),
          PrimaryButton(
            label: 'Create',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Folder newFolder = Folder()..title = _title;
                widget.isarService.createFolder(newFolder);
              }
            },
          )
        ],
      ),
    );
  }
}
