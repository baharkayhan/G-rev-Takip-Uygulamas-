import 'package:flutter/material.dart';
import 'package:gorevim/config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Gorevim extends ConsumerWidget {
  const Gorevim({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // routesProvider'ı izleyerek route'u alır
    final route = ref.watch(routesProvider);

    // MaterialApp.router ile uygulamayı başlatır
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: route,
    );
  }
}
