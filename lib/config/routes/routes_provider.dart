//Rota yönetimi için kullanılan provider ayarlarını içerir.

import 'package:flutter/material.dart';
import 'package:gorevim/config/config.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// uygulamanın herhangi bir yerinden Navigatora erişim sağlamak için global bir anahtar oluşturur.
final navigationKey = GlobalKey<NavigatorState>();

// GoRouter sağlayıcısı
final routesProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      //GoRouter, uygulamada yönlendirme işlemlerini yönetir.
      initialLocation: RouteLocation
          .home, //Uygulama ilk başlatıldığında açılacak olan başlangıç konumu
      navigatorKey: navigationKey,
      routes: appRoutes,
    );
  },
);
