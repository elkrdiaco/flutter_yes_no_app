import 'package:yes_no_app/src/features/articles/domain/entities/message_entity.dart';

class MessageMapper {
  String answer;
  bool forced;
  String? image;

  MessageMapper({required this.answer, required this.forced, this.image});

  factory MessageMapper.fromJsonApi(Map<String, dynamic> responseApi) {
    return MessageMapper(
      answer: responseApi["answer"],
      forced: responseApi["forced"],
      image: responseApi["image"],
    );
  }

  Map<String, dynamic> toJsonApi() => {
    "answer": answer,
    "forced": forced,
    "image": image,
  };

  MessageEntity toEntity() =>
      MessageEntity(
        text: answer, 
        fromWho: FromWho.tuyo, 
        imageUrl: image
      );
}
