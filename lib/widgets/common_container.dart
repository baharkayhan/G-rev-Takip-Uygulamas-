import 'package:flutter/material.dart';
import 'package:gorevim/utils/utils.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({
    super.key,
    this.child,
    this.height,
    this.width,
    this.color,
    this.borderRadius = 16,
    this.padding,
  });
  final Widget? child; // Kapsayıcı içindeki widget
  final double? height; // Kapsayıcı yüksekliği
  final double? width; // Kapsayıcı genişliği
  final Color? color; // Kapsayıcı rengi
  final double borderRadius; // Kenar yuvarlaklığı
  final EdgeInsets? padding; // İç boşluk

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? colors.primaryContainer,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
