//Ana ekranın tasarımı ve işlevleri

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gorevim/config/config.dart';
import 'package:gorevim/data/data.dart';
import 'package:gorevim/providers/providers.dart';
import 'package:gorevim/utils/utils.dart';
import 'package:gorevim/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

// HomeScreen sınıfı, ana ekranı temsil eder.
class HomeScreen extends ConsumerWidget {
  // Bu statik metod, HomeScreen'in bir örneğini oluşturur.
  static HomeScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // build metodu, HomeScreen'in arayüzünü oluşturur.
    final deviceSize = context.deviceSize; // Cihazın boyutunu alır.
    final date = ref.watch(dateProvider); // Tarih sağlayıcısını izler.
    final taskState = ref.watch(tasksProvider); // Görev sağlayıcısını izler.
    final inCompletedTasks =
        _incompltedTask(taskState.tasks, ref); // Tamamlanmamış görevleri alır.
    final completedTasks =
        _compltedTask(taskState.tasks, ref); // Tamamlanmış görevleri alır.

    return Scaffold(
      // Scaffold uygulamanın temel yapısını oluşturur
      body: Stack(
        children: [
          // Uygulama arka planı
          AppBackground(
            headerHeight: deviceSize.height * 0.3, // Arka planın yüksekliği
            header: SingleChildScrollView(
              // Başlık kısmını kaydırılabilir yapar
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Başlık kısmını dikeyde ortalar
                children: [
                  // Tarih seçimi
                  InkWell(
                    onTap: () =>
                        Helpers.selectDate(context, ref), // Tarih seçme işlevi
                    child: DisplayWhiteText(
                      text: Helpers.dateFormatter(date), // Tarihi biçimlendirir
                      fontWeight: FontWeight.normal, // Yazı tipi kalınlığı
                    ),
                  ),
                  const DisplayWhiteText(text: 'Görev Listem', size: 40),
                ],
              ),
            ),
          ),
          // Görev listesi
          Positioned(
            top: 130, // Başlangıç yüksekliği
            left: 0,
            right: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20.0), // Kenar boşlukları
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .stretch, // Elemanları yatayda genişletir
                  children: [
                    // Tamamlanmamış görevler
                    DisplayListOfTasks(
                      tasks: inCompletedTasks,
                    ),
                    const Gap(20),
                    Text(
                      'Tamamlanan Görevler',
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(20),
                    // Tamamlanmış görevler
                    DisplayListOfTasks(
                      isCompletedTasks: true,
                      tasks: completedTasks,
                    ),
                    const Gap(20),
                    // Yeni görev ekleme butonu
                    ElevatedButton(
                      onPressed: () => context.push(RouteLocation.createTask),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: DisplayWhiteText(
                          text: 'Yeni Görev Ekle',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Tamamlanmamış görevleri filtreler
  List<Task> _incompltedTask(List<Task> tasks, WidgetRef ref) {
    final date = ref.watch(dateProvider); // Tarih sağlayıcısını izler
    final List<Task> filteredTask = []; // Filtrelenmiş görevler

    for (var task in tasks) {
      // Görevlerin her biri için
      if (!task.isCompleted) {
        // Görev tamamlanmamışsa
        final isTaskDay = Helpers.isTaskFromSelectedDate(
            task, date); // Görevin tarihi seçilen tarihe eşitse
        if (isTaskDay) {
          filteredTask.add(task); // Görevi filtrelenmiş görevlere ekle
        }
      }
    }
    return filteredTask;
  }

  // Tamamlanmış görevleri filtreler
  List<Task> _compltedTask(List<Task> tasks, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Task> filteredTask = [];

    for (var task in tasks) {
      if (task.isCompleted) {
        final isTaskDay = Helpers.isTaskFromSelectedDate(task, date);
        if (isTaskDay) {
          filteredTask.add(task);
        }
      }
    }
    return filteredTask;
  }
}
