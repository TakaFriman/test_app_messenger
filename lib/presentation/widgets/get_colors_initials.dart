import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    return words[0][0].toUpperCase();
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
