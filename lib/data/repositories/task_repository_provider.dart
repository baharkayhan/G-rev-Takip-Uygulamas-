//Repository'yi sağlayan provider

import 'package:gorevim/data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TaskRepository sağlayıcısı
final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  // taskDatasourceProvider'ı okuyarak datasource'u alır
  final datasource = ref.read(taskDatasourceProvider);
  // TaskRepositoryImpl ile repository'yi döndürür
  return TaskRepositoryImpl(datasource);
});
