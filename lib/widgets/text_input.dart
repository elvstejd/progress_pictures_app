import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String label;

  const TextInput({
    super.key,
    required this.label,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late FocusNode myFocusNode;
  bool isActive = false;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color outlineColor = Colors.grey.shade300;
    Color inputBgColor = isActive ? Colors.transparent : Colors.grey.shade300;

    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = true;
          myFocusNode.requestFocus();
        });
      },
      child: Container(
          decoration: BoxDecoration(
              color: inputBgColor,
              border: Border.all(color: outlineColor, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.label,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey.shade800),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      focusNode: myFocusNode,
                      onTap: () {
                        setState(() {
                          isActive = true;
                        });
                      },
                      // onTapOutside: (event) {
                      //   setState(() {
                      //     isActive = false;
                      //     myFocusNode.unfocus();
                      //   });
                      // },
                      style: const TextStyle(fontSize: 18),
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                      )),
                ),
              ],
            ),
          )),
    );
  }
}
