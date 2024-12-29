//Rota yönetimi için kullanılan provider ayarlarını içerir.

import 'package:flutter/material.dart';
import 'package:gorevim/config/config.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Navigasyon için global anahtar
final navigationKey = GlobalKey<NavigatorState>();

// GoRouter sağlayıcısı
final routesProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: RouteLocation.home,
      navigatorKey: navigationKey,
      routes: appRoutes,
    );
  },
);
