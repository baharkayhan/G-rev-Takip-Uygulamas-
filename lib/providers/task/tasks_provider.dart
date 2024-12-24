import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gorevim/data/data.dart';
import 'package:gorevim/providers/providers.dart';

// tasksProvider, TaskNotifier ve TaskState'i sağlayan bir StateNotifierProvider'dır
final tasksProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  // taskRepositoryProvider'ı izleyerek repository'yi alır
  final repository = ref.watch(taskRepositoryProvider);
  // TaskNotifier'ı repository ile başlatır
  return TaskNotifier(repository);
});
