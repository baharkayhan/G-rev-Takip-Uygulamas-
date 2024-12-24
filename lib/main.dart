import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gorevim/app/app.dart';

void main() {
  // Flutter widget bağlamasını başlatır
  WidgetsFlutterBinding.ensureInitialized();

  // Uygulamayı başlatır ve ProviderScope ile sarar
  runApp(
    const ProviderScope(
      child: Gorevim(),
    ),
  );
}
