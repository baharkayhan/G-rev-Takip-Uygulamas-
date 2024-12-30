//Görevlerin durumlarını takip eder.

import 'package:flutter/foundation.dart'; // debugPrint ile hata mesajı yazdırmak için
import 'package:gorevim/data/data.dart';
import 'package:gorevim/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Görevlerin durumunu yöneten sınıf
class TaskNotifier extends StateNotifier<TaskState> {
  final TaskRepository _repository;

  // Constructor, repository'yi alır ve başlangıç durumunu ayarlar
  TaskNotifier(this._repository) : super(const TaskState.initial()) {
    // Görevleri alır
    getTasks();
  }

  // Yeni bir görev oluşturur
  Future<void> createTask(Task task) async {
    try {
      await _repository.addTask(
          task); //Yeni görevi TaskRepository aracılığıyla veritabanına ekler.
      getTasks();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Bir görevi siler
  Future<void> deleteTask(Task task) async {
    try {
      await _repository.deleteTask(task); //Veritabanındaki görevi siler
      getTasks();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Bir görevi günceller
  Future<void> updateTask(Task task) async {
    try {
      final isCompleted =
          !task.isCompleted; //Görevin tamamlanma durumunu tersine çevirir
      final updatedTask = task.copyWith(isCompleted: isCompleted);
      await _repository.updateTask(updatedTask);
      getTasks();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Tüm görevleri alır
  void getTasks() async {
    try {
      final tasks = await _repository.getAllTasks();
      state = state.copyWith(tasks: tasks);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
