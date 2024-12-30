//Görev listesini gösterir

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gorevim/data/data.dart';
import 'package:gorevim/providers/providers.dart';
import 'package:gorevim/utils/utils.dart';
import 'package:gorevim/widgets/widgets.dart';

class DisplayListOfTasks extends ConsumerWidget {
  const DisplayListOfTasks({
    super.key,
    this.isCompletedTasks = false, // Tamamlanan görevler mi?
    required this.tasks,
  });
  final bool isCompletedTasks;
  final List<Task> tasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height = isCompletedTasks
        ? deviceSize.height * 0.25
        : deviceSize.height * 0.3; // Görev listesi yüksekliği
    final emptyTasksAlert =
        isCompletedTasks // Görev listesi boşsa gösterilecek mesaj
            ? 'Tamamlanan bir görev yok!'
            : 'Yapılacak bir görev yok!';

    return CommonContainer(
      // Görev listesi container
      height: height,
      child: tasks.isEmpty // Görev listesi boş mu
          ? Center(
              // Görev listesi boşsa gösterilecek mesaj
              child: Text(
                emptyTasksAlert,
                style: context.textTheme.headlineSmall,
              ),
            )
          : ListView.separated(
              shrinkWrap:
                  true, // ListView'in boyutunu içindeki elemanlara göre ayarlar
              itemCount: tasks.length, // Görev sayısı
              padding: EdgeInsets.zero, // ListView kenar boşlukları
              itemBuilder: (ctx, index) {
                // Görev listesi elemanları
                final task = tasks[index]; // Görev

                return InkWell(
                  // Görev uzun basıldığında silme uyarısı gösterimi
                  onLongPress: () async {
                    await AppAlerts.showAlertDeleteDialog(
                      context: context,
                      ref: ref,
                      task: task,
                    );
                  },
                  // Görev tıklandığında detaylarının gösterimi
                  onTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      builder: (ctx) {
                        return TaskDetails(task: task);
                      },
                    );
                  },
                  child: TaskTile(
                    task: task,
                    // Görev tamamlanma durumu değiştirildiğinde yapılacak işlemler
                    onCompleted: (value) async {
                      await ref
                          .read(tasksProvider.notifier)
                          .updateTask(task)
                          .then((value) {
                        AppAlerts.displaySnackbar(
                          context,
                          task.isCompleted
                              ? 'Görev tamamlanmadı'
                              : 'Görev tamamlandı',
                        );
                      });
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                // Görevler arasına çizgi ekler
                thickness: 1.5,
              ),
            ),
    );
  }
}
