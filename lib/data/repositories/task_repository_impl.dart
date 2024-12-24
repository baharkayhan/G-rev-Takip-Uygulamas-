import 'package:gorevim/data/data.dart';

// TaskRepositoryImpl sınıfı, TaskRepository arayüzünü uygular ve görev verilerini yönetir.
class TaskRepositoryImpl implements TaskRepository {
  final TaskDatasource _datasource;
  TaskRepositoryImpl(this._datasource);

  @override
  Future<void> addTask(Task task) async {
    try {
      // Yeni bir görev ekler
      await _datasource.addTask(task);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> deleteTask(Task task) async {
    try {
      // Bir görevi siler
      await _datasource.deleteTask(task);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<List<Task>> getAllTasks() async {
    try {
      // Tüm görevleri getirir
      return await _datasource.getAllTasks();
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> updateTask(Task task) async {
    try {
      // Bir görevi günceller
      await _datasource.updateTask(task);
    } catch (e) {
      throw '$e';
    }
  }
}
