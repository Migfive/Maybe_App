import 'package:flutter/material.dart';

class MessagesFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessagesFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    //variable constructora de bordes
    final outlineInputBorde = UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(40));
    final inputDecorations = InputDecoration(
      hintText: 'End your Meesage with a "?"',
      enabledBorder: outlineInputBorde,
      focusedBorder: outlineInputBorde,
      filled: true,
      suffixIcon: IconButton(
          onPressed: () {
            final texValue = textController.value.text;

            textController.clear();
            onValue(texValue);
          },
          icon: Icon(Icons.send_outlined)),
    );
    return TextFormField(
      onTapOutside: (event) => focusNode.unfocus(),
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecorations,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
