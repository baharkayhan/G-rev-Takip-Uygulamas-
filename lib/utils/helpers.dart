// Yardımcı fonksiyonlar

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gorevim/data/data.dart';
import 'package:gorevim/providers/providers.dart';
import 'package:intl/intl.dart';

@immutable
class Helpers {
  const Helpers._();

  // TimeOfDay nesnesini string formatına dönüştürür
  static String timeToString(TimeOfDay time) {
    try {
      final DateTime now = DateTime.now();
      final date = DateTime(
        now.year,
        now.month,
        now.day,
        time.hour,
        time.minute,
      );
      final formatType = DateFormat.jm();
      return formatType.format(date);
    } catch (e) {
      return '12:00';
    }
  }

  // Tarih seçimi için tarih seçici açar
  static void selectDate(BuildContext context, WidgetRef ref) async {
    final initialDate = ref.read(dateProvider);
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2060),
    );

    if (pickedDate != null) {
      ref.read(dateProvider.notifier).state = pickedDate;
    }
  }

  // Görevin seçilen tarihe ait olup olmadığını kontrol eder
  static bool isTaskFromSelectedDate(Task task, DateTime selectedDate) {
    final DateTime taskDate = _stringToDateTime(task.date);
    if (taskDate.month == selectedDate.month &&
        taskDate.year == selectedDate.year &&
        taskDate.day == selectedDate.day) {
      return true;
    }
    return false;
  }

  // String formatındaki tarihi DateTime nesnesine dönüştürür
  static DateTime _stringToDateTime(String dateString) {
    try {
      DateFormat format = DateFormat.yMMMd();
      return format.parse(dateString);
    } catch (e) {
      return DateTime.now();
    }
  }

  // DateTime nesnesini string formatına dönüştürür
  static String dateFormatter(DateTime date) {
    try {
      return DateFormat.yMMMd().format(date);
    } catch (e) {
      return DateFormat.yMMMd().format(
        DateTime.now(),
      );
    }
  }
}
