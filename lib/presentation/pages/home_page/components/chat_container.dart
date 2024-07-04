import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:test_app_messenger/data/models/message_model.dart';

class ChatContainer extends StatelessWidget {
  final MessageModel chat;
  const ChatContainer({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CircleAvatar(
              maxRadius: 25,
              backgroundColor: getRandomColor(),
              child: Text(
                getInitials(chat.name),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    chat.messenger,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(94, 122, 144, 1),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              formatDate(chat.date),
              style: const TextStyle(color: Color.fromRGBO(94, 122, 144, 1), fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ]),
          const Divider(color: Color.fromRGBO(237, 242, 246, 1), thickness: 1.5),
        ],
      ),
    );
  }
}

Color getRandomColor() {
  Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}

String getInitials(String fullName) {
  List<String> words = fullName.split(' ');
  if (words.length < 2) {
    return '';
  }
  String initials = words[0][0] + words[1][0];
  return initials.toUpperCase();
}

String formatDate(String date) {
  DateTime dateTime = DateTime.parse(date);
  DateTime now = DateTime.now();
  DateTime yesterday = now.subtract(const Duration(days: 1));

  // Если дата сегодняшняя
  if (dateTime.year == now.year && dateTime.month == now.month && dateTime.day == now.day) {
    return DateFormat('HH:mm').format(dateTime);
  }

  // Если дата вчерашняя
  if (dateTime.year == yesterday.year && dateTime.month == yesterday.month && dateTime.day == yesterday.day) {
    return 'Вчера';
  }

  // Для всех остальных случаев
  return DateFormat('dd.MM.yyyy').format(dateTime);
}
