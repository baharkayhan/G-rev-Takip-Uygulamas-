import 'package:gorevim/data/datasource/datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TaskDatasource sağlayıcısı
final taskDatasourceProvider = Provider<TaskDatasource>((ref) {
  // TaskDatasource örneğini döndürür
  return TaskDatasource();
});
