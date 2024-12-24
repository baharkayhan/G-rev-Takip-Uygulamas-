import 'package:flutter_riverpod/flutter_riverpod.dart';

// Şu anki tarihi sağlayan bir StateProvider
final dateProvider = StateProvider<DateTime>((ref) {
  // Şu anki tarihi döndürür
  return DateTime.now();
});
