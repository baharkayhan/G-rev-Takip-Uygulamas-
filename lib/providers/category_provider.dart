import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gorevim/utils/utils.dart';

// Görev kategorisini sağlayan bir StateProvider
final categoryProvider = StateProvider.autoDispose<TaskCategory>((ref) {
  // Varsayılan olarak 'others' kategorisini döndürür
  return TaskCategory.others;
});
