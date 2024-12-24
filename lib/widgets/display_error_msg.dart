import 'package:flutter/material.dart';
import 'package:gorevim/utils/extensions.dart';
import 'common_container.dart';

class DisplayErrorMessage extends StatelessWidget {
  const DisplayErrorMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;

    return CommonContainer(
      width: deviceSize.width,
      height: deviceSize.height * 0.3,
      child: const Center(
        // Hata mesajı gösterimi
        child: Text('Bir hata oluştu. Lütfen tekrar deneyin.'),
      ),
    );
  }
}
