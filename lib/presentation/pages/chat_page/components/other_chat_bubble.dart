import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OtherChatBubble extends StatelessWidget {
  final String message;
  final Timestamp time;

  const OtherChatBubble({super.key, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('HH:mm').format(time.toDate());
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(237, 242, 246, 1), // Цвет фона
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23),
            topRight: Radius.circular(23),
            bottomRight: Radius.circular(23),
            bottomLeft: Radius.circular(6)), // Закругленные углы
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: const TextStyle(
              color: Color.fromRGBO(43, 51, 62, 1), // Цвет текста
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            formattedTime.toString(),
            style: const TextStyle(
              color: Color.fromRGBO(43, 51, 62, 1),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
