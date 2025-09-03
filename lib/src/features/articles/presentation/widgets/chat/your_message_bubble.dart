import 'package:flutter/material.dart';
import 'package:yes_no_app/src/features/articles/domain/entities/message_entity.dart';

class YourMessageBubble extends StatelessWidget {
  final MessageEntity message;

  const YourMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.inversePrimary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: TextStyle(color: colors.inverseSurface),
            ),
          ),
        ),
        const SizedBox(height: 5),
        _ImageBubble(message.imageUrl?.toString() ?? 'https://gifdb.com/images/featured/empty-wallet-7jxelfj7du3moqqu.gif'),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  
  final String imageUrl;
  const _ImageBubble(
    this.imageUrl
  );

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          width: size.width * 0.7,
          height: 150,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              width: size.width * 0.7,
              height: 150,
              alignment: AlignmentDirectional.center,
              child: Text('Estan enviando una imagen'),
            );
          },
        ),
      );
    }
  }
}
