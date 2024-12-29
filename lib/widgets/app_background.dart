//Uygulama arka planı

import 'package:flutter/material.dart';
import 'package:gorevim/utils/utils.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key, this.header, this.body, this.headerHeight});
  final Widget? body;
  final Widget? header;
  final double? headerHeight;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

    return Column(
      children: [
        // Üst kısım (header)
        Container(
          height: headerHeight,
          width: deviceSize.width,
          color: colors.primary,
          child: Center(child: header),
        ),
        // Alt kısım (body)
        Expanded(
          child: Container(
            width: deviceSize.width,
            color: colors.background,
            child: body,
          ),
        ),
      ],
    );
  }
}
