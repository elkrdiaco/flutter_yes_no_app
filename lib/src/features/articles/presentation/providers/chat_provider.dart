import 'package:flutter/material.dart';
import 'package:yes_no_app/src/features/articles/domain/entities/message_entity.dart';

import '../../../../core/helpers/get_yes_no_answer.dart';

class ChatProvider extends ChangeNotifier {
  
  final ScrollController scrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<MessageEntity> messageList = [
    MessageEntity(text: 'Hola amor!', fromWho: FromWho.mio),
    MessageEntity(text: 'Ya regresaste del trabajo?', fromWho: FromWho.mio),
    MessageEntity(text: 'Si, ya estoy aqui mi vida', fromWho: FromWho.tuyo),
    MessageEntity(text: 'Que tal tu dia?', fromWho: FromWho.tuyo),
  ];

  Future<void> sendMsg(String message) async {
    if (message.isEmpty) return;

    final newMessage = MessageEntity(fromWho: FromWho.mio, text: message);

    messageList.add(newMessage);
    notifyListeners();
    moveScrollToBottom();

    if (message.endsWith('?')) {
      await yourReply();
      return; 
    }
  }

  Future<void> moveScrollToBottom() async {

    await Future.delayed(Duration(milliseconds: 100));

    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 200),
      curve: Curves.bounceOut,
    );
  }

  Future<void> yourReply() async {

    final answer = await getYesNoAnswer.getAnswer();

    messageList.add(answer);
    notifyListeners();
    moveScrollToBottom();
  }
}
