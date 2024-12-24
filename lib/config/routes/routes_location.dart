import 'package:flutter/foundation.dart' show immutable;

@immutable
class RouteLocation {
  const RouteLocation._();

  // Ana sayfa rotası
  static String get home => '/home';
  // Görev oluşturma rotası
  static String get createTask => '/createTask';
}
