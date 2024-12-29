// Görev kategorilerini temsil eden enum

import 'package:flutter/material.dart';

enum TaskCategory {
  // Eğitim kategorisi, simge ve renk ile birlikte
  education(Icons.school, Colors.blueGrey),
  // Sağlık kategorisi, simge ve renk ile birlikte
  health(Icons.favorite, Colors.orange),
  // Ev kategorisi, simge ve renk ile birlikte
  home(Icons.home, Colors.green),
  // Diğer kategorisi, simge ve renk ile birlikte
  others(Icons.calendar_month_rounded, Colors.purple),
  // Kişisel kategorisi, simge ve renk ile birlikte
  personal(Icons.person, Colors.lightBlue),
  // Alışveriş kategorisi, simge ve renk ile birlikte
  shopping(Icons.shopping_bag, Colors.deepOrange),
  // Sosyal kategorisi, simge ve renk ile birlikte
  social(Icons.people, Colors.brown),
  // Seyahat kategorisi, simge ve renk ile birlikte
  travel(Icons.flight, Colors.pink),
  // İş kategorisi, simge ve renk ile birlikte
  work(Icons.work, Colors.amber);

  // String bir değeri TaskCategory enum değerine dönüştüren fonksiyon
  static TaskCategory stringToTaskCategory(String name) {
    try {
      // Enum değerleri arasında adı eşleşen ilk değeri döndür
      return TaskCategory.values.firstWhere(
        (category) => category.name == name,
      );
    } catch (e) {
      // Eşleşme bulunamazsa 'others' kategorisini döndür
      return TaskCategory.others;
    }
  }

  // Kategoriye ait simge
  final IconData icon;
  // Kategoriye ait renk
  final Color color;
  // Constructor, simge ve rengi alır
  const TaskCategory(this.icon, this.color);
}
