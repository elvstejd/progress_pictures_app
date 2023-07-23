import 'package:flutter/material.dart';

Future<void> showCustomModalBottomSheet(BuildContext context, Widget body,
    {String title = 'Default title'}) {
  return showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          // ignore: sized_box_for_whitespace
          child: Container(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      width: 32,
                      height: 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade300),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800),
                    ),
                  ),
                  Expanded(
                    child: body,
                  )
                ],
              ),
            ),
          ),
        );
      });
}
