import 'package:flutter/material.dart';
import 'package:progress_pictures_app/widgets/text_input.dart';
import 'package:progress_pictures_app/widgets/primary_button.dart';

class CollectionForm extends StatelessWidget {
  const CollectionForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextInput(
          label: 'Title',
        ),
        PrimaryButton(
          label: 'Create',
        )
      ],
    );
  }
}
