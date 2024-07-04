import 'package:flutter/material.dart';
import 'package:test_app_messenger/data/models/message_model.dart';
import 'package:test_app_messenger/presentation/pages/home_page/components/chat_container.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = [
      MessageModel(id: 1, name: 'Виктор Власов', messenger: 'Привет, как дела?', date: '2024-07-04T08:45:00'),
      MessageModel(id: 2, name: 'Саша Алексеев', messenger: 'Я готов', date: '2024-07-03T08:45:00'),
      MessageModel(id: 3, name: 'Пётр Жаринов', messenger: 'Я вышел', date: '2024-04-02T08:45:00'),
      MessageModel(id: 3, name: 'Пётр Жаринов', messenger: 'Я вышел', date: '2024-01-02T08:45:00'),
    ];
    chats.sort((a, b) => DateTime.parse(b.date).compareTo(DateTime.parse(a.date)));
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            return ChatContainer(chat: chats[index]);
          },
        ),
      ),
    );
  }
}
