import 'package:dio/dio.dart';
import 'package:yes_no_app/src/core/mappers/message_mapper.dart';
import 'package:yes_no_app/src/features/articles/domain/entities/message_entity.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<MessageEntity> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final MessageMapper mapper = MessageMapper.fromJsonApi(response.data);
    return mapper.toEntity();
  }
}
