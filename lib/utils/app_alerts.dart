import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gorevim/data/data.dart';
import 'package:gorevim/providers/providers.dart';
import 'package:go_router/go_router.dart';
import 'package:gorevim/utils/utils.dart';

// Uygulama genelinde kullanılan uyarı ve bildirimleri içeren sınıf
@immutable
class AppAlerts {
  const AppAlerts._();

  // Snackbar gösterir
  static displaySnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: context.textTheme.bodyMedium,
        ),
        backgroundColor: context.colorScheme.onSecondary,
      ),
    );
  }

  // Görev silme uyarı diyalogu gösterir
  static Future<void> showAlertDeleteDialog({
    required BuildContext context,
    required WidgetRef ref,
    required Task task,
  }) async {
    Widget cancelButton = TextButton(
      child: const Text('HAYIR'),
      onPressed: () => context.pop(),
    );
    Widget deleteButton = TextButton(
      onPressed: () async {
        await ref.read(tasksProvider.notifier).deleteTask(task).then(
          (value) {
            displaySnackbar(
              context,
              'Görev başarıyla silindi!',
            );
            context.pop();
          },
        );
      },
      child: const Text('EVET'),
    );

    AlertDialog alert = AlertDialog(
      title: const Text('Bu görevi silmek istediğinizden emin misiniz?'),
      actions: [
        deleteButton,
        cancelButton,
      ],
    );

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
