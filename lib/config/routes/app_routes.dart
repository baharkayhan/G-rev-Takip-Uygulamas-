import 'package:gorevim/config/config.dart';
import 'package:gorevim/screens/screens.dart';
import 'package:go_router/go_router.dart';

// Uygulama rotalarını tanımlar
final appRoutes = [
  // Ana sayfa rotası
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: navigationKey,
    builder: HomeScreen.builder,
  ),
  // Görev oluşturma rotası
  GoRoute(
    path: RouteLocation.createTask,
    parentNavigatorKey: navigationKey,
    builder: CreateTaskScreen.builder,
  ),
];
