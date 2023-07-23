import 'package:flutter/material.dart';

class CollectionCard extends StatelessWidget {
  final String title;
  final String date;
  final int entries;

  const CollectionCard({
    super.key,
    required this.title,
    required this.date,
    required this.entries,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        margin: const EdgeInsets.all(0),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Placeholder(fallbackWidth: 86, fallbackHeight: 86),
              const SizedBox(width: 16),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
