//Görev detayları widget'ı

import 'package:flutter/material.dart';
import 'package:gorevim/data/data.dart';
import 'package:gorevim/utils/utils.dart';
import 'package:gorevim/widgets/circle_container.dart';
import 'package:gap/gap.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Görev kategorisinin renginde bir daire içinde ikon gösterimi
          CircleContainer(
            color: task.category.color.withOpacity(0.3),
            child: Icon(
              task.category.icon,
              color: task.category.color,
            ),
          ),
          const Gap(16),
          // Görev başlığı
          Text(
            task.title,
            style: style.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          // Görev zamanı
          Text(task.time, style: style.titleMedium),
          const Gap(16),
          // Görev tamamlanmadıysa tamamlanması gereken tarih ve checkbox gösterimi
          Visibility(
            visible: !task.isCompleted,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Tamamlnaması Gereken Tarih:   '),
                Text(task.date),
                Icon(
                  Icons.check_box,
                  color: task.category.color,
                ),
              ],
            ),
          ),
          const Gap(16),
          // Ayırıcı çizgi
          Divider(
            color: task.category.color,
            thickness: 1.5,
          ),
          const Gap(16),
          // Görev notu veya açıklama
          Text(
            task.note.isEmpty
                ? 'Bu görev için bir açıklama eklenmemiş.'
                : task.note,
            style: context.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const Gap(16),
          // Görev tamamlandıysa "Görev Tamamlandı" mesajı ve checkbox gösterimi
          Visibility(
            visible: task.isCompleted,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Görev Tamamlandı'),
                Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
