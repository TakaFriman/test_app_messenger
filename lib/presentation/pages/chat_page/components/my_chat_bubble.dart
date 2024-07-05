import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyChatBubble extends StatelessWidget {
  final String message;
  final Timestamp time;

  const MyChatBubble({super.key, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('HH:mm').format(time.toDate());
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(60, 237, 120, 1), // Цвет фона
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23),
            topRight: Radius.circular(23),
            bottomRight: Radius.circular(6),
            bottomLeft: Radius.circular(23)), // Закругленные углы
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: const TextStyle(
              color: Color.fromRGBO(0, 82, 28, 1), // Цвет текста
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            formattedTime.toString(),
            style: const TextStyle(
              color: Color.fromRGBO(0, 82, 28, 1),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
