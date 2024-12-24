import 'package:flutter/material.dart';

// CircleContainer sınıfı, yuvarlak bir kapsayıcı widget'ı oluşturur.
class CircleContainer extends StatelessWidget {
  const CircleContainer({
    super.key,
    this.child,
    required this.color,
    this.borderWidth,
    this.borderColor,
  });
  final Widget? child; // Kapsayıcı içindeki widget
  final Color color; // Kapsayıcı rengi
  final double? borderWidth; // Kenarlık genişliği
  final Color? borderColor; // Kenarlık rengi

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9), // Kapsayıcı içindeki boşluk
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Kapsayıcı şekli yuvarlak
        color: color, // Kapsayıcı rengi
        border: Border.all(
          width: borderWidth ?? 2, // Kenarlık genişliği, varsayılan olarak 2
          color: color, // Kenarlık rengi
        ),
      ),
      child: Center(
        child: child, // Kapsayıcı içindeki widget'ı ortalar
      ),
    );
  }
}
