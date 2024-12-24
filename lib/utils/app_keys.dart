import 'package:flutter/foundation.dart' show immutable;

// Uygulama genelinde kullanılan anahtarları tanımlayan sınıf
@immutable
class AppKeys {
  const AppKeys._();
  static const String isDarkMode = 'isDarkMode';
  static const String dbTable = 'tasks';
}
