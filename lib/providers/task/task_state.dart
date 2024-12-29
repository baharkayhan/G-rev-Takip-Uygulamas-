//Görev durumlarını tanımlar

import 'package:equatable/equatable.dart';
import 'package:gorevim/data/data.dart';

// Görevlerin durumunu temsil eden sınıf
class TaskState extends Equatable {
  // Görevlerin listesi
  final List<Task> tasks;

  // Varsayılan constructor
  const TaskState({
    required this.tasks,
  });

  // Başlangıç durumu için constructor
  const TaskState.initial({
    this.tasks = const [],
  });

  // Yeni bir TaskState nesnesi döndürür, mevcut durumun bir kopyasını oluşturur
  TaskState copyWith({
    List<Task>? tasks,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object> get props => [tasks];
}
