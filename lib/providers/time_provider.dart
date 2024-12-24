import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Şu anki saati sağlayan bir StateProvider
final timeProvider = StateProvider.autoDispose<TimeOfDay>((ref) {
  // Şu anki saati döndürür
  return TimeOfDay.now();
});
