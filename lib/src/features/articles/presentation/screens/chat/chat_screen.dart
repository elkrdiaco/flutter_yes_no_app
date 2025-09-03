import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/src/features/articles/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/src/features/articles/presentation/widgets/chat/your_message_bubble.dart';
import 'package:yes_no_app/src/shared/presentation/widgets/message_box_send.dart';

import '../../../domain/entities/message_entity.dart';
import '../../providers/chat_provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(100),
            shadowColor: Colors.grey,
            child: const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                'https://media.istockphoto.com/id/1389348844/photo/studio-shot-of-a-beautiful-young-woman-smiling-while-standing-against-a-grey-background.jpg?s=612x612&w=0&k=20&c=anRTfD_CkOxRdyFtvsiPopOluzKbhBNEQdh4okZImQc=',
              ),
            ),
          ),
        ),
        title: const Text('My Love ❤️'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.scrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return
                  (message.fromWho == FromWho.mio)
                  ? MyMessageBubble(message: message)
                  : YourMessageBubble(message: message);
                },
              ),
            ),
            MessageBoxSend(
              onValue: chatProvider.sendMsg
            )
          ],
        ),
      ),
    );
  }
}
