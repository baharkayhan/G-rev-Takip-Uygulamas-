// Rotaların URL ile eşleştirilmesini sağlar.

import 'package:flutter/foundation.dart' show immutable;

@immutable //sınıfın değiştirilemez olduğunu belirtir.
class RouteLocation {
  const RouteLocation._(); // RouteLocation sınıfının dışarıdan erişilemez olmasını sağlar.

  // Ana sayfa rotası
  static String get home => '/home';
  // Görev oluşturma rotası
  static String get createTask => '/createTask';

  //Statik oldukları için sınıfın bir örneğini oluşturmadan RouteLocation.home şeklinde doğrudan erişilebilir.
}
