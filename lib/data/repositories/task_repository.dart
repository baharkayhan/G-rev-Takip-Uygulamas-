import 'package:gorevim/data/data.dart';

// Görevlerle ilgili işlemleri tanımlayan soyut sınıf
abstract class TaskRepository {
  // Yeni bir görev ekler
  Future<void> addTask(Task task);
  // Bir görevi günceller
  Future<void> updateTask(Task task);
  // Bir görevi siler
  Future<void> deleteTask(Task task);
  // Tüm görevleri alır
  Future<List<Task>> getAllTasks();
}
