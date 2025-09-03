import 'package:flutter/material.dart';
import 'package:yes_no_app/src/features/articles/domain/entities/message_entity.dart';

class MyMessageBubble extends StatelessWidget {
  final MessageEntity message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: TextStyle(color: colors.surface),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
