//Beyaz metin için bir widget

import 'package:flutter/material.dart';
import 'package:gorevim/utils/utils.dart';

class DisplayWhiteText extends StatelessWidget {
  const DisplayWhiteText({
    super.key,
    required this.text,
    this.size,
    this.fontWeight,
  });
  final String text; // Gösterilecek metin
  final double? size; // Metin boyutu
  final FontWeight? fontWeight; // Metin kalınlığı

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.headlineSmall?.copyWith(
        color: context.colorScheme.surface, // Metin rengi
        fontSize: size, // Metin boyutu
        fontWeight: fontWeight ??
            FontWeight.bold, // Metin kalınlığı, varsayılan olarak kalın
      ),
    );
  }
}
