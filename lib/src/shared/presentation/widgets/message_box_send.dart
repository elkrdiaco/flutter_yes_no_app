import 'package:flutter/material.dart';

class MessageBoxSend extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageBoxSend({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(50),
    );

    final decoration = InputDecoration(
      hintText: "Finalice su mensaje con un ?",
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      fillColor: colors.surface,
      suffixIcon: Padding(
        padding: EdgeInsetsGeometry.directional(end: 5),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(50),
          child: IconButton.filled(
            onPressed: () {
              onValue(textController.value.text);
              textController.clear();
            },
            icon: Icon(Icons.send_outlined),
            color: colors.surface,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
        ),
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: decoration,
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
