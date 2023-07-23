import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  const PrimaryButton({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0.0,
            shadowColor: Colors.transparent,
            minimumSize: const Size(double.infinity, 50),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)))),
        onPressed: () {},
        child: Text(
          label,
          style: const TextStyle(fontSize: 18),
        ));
  }
}
