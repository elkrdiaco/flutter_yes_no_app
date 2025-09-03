enum FromWho { mio, tuyo}

class MessageEntity {
  final String text;
  final String? imageUrl;
  final FromWho fromWho; // true = me, false = her

  MessageEntity({
    required this.text,
    this.imageUrl,
    required this.fromWho,
  });
}
