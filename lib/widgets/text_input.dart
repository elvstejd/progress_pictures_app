import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String labelText;
  final String hintText;
  final String errorText;
  final bool obscureText;
  final String? Function(String?) validator;
  final Function(String?) onSaved;

  const TextInput({
    super.key,
    this.labelText = '',
    this.hintText = '',
    this.errorText = '',
    this.obscureText = false,
    this.validator = validatorDefaultFuction,
    this.onSaved = savedDefaultFuction,
  });

  static String? validatorDefaultFuction(String? val) {
    return null;
  }

  static void savedDefaultFuction(String? val) {}

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late FocusNode myFocusNode;
  final TextEditingController _controller = TextEditingController();

  bool isActive = false;
  bool hasError = false;

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

    if (hasError) {
      outlineColor = isActive ? Colors.red.shade300 : Colors.red.shade100;
      inputBgColor = isActive ? Colors.transparent : Colors.red.shade100;
    }

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
                  widget.labelText,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey.shade800),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: TextFormField(
                      controller: _controller,
                      textCapitalization: TextCapitalization.sentences,
                      focusNode: myFocusNode,
                      validator: (value) {
                        setState(() {
                          hasError = widget.validator(value) != null;
                        });
                        return widget.validator(value);
                      },
                      onSaved: widget.onSaved,
                      onTap: () {
                        setState(() {
                          isActive = true;
                        });
                      },
                      // TODO: tap outside should blur input
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
