// Ortak bir metin girişi bileşeni

import 'package:flutter/material.dart';
import 'package:gorevim/utils/utils.dart';
import 'package:gap/gap.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.title,
    this.maxLines,
    this.suffixIcon,
    this.readOnly = false,
  });
  final TextEditingController? controller; // Metin denetleyicisi
  final String hintText; // Metin alanı için ipucu metni
  final String title;
  final int? maxLines;
  final Widget? suffixIcon; // Metin alanı için ek ikon
  final bool readOnly; // Metin alanının salt okunur olup olmadığı

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.stretch, // Sütunun genişliğini genişlet
      children: [
        // Başlık metni
        Text(
          title,
          style: context.textTheme
              .titleLarge, // Başlık metni için büyük başlık metni stili
        ),
        const Gap(10),
        // Metin alanı
        TextField(
          readOnly: readOnly,
          onTapOutside: (event) {
            // Metin alanı dışına tıklandığında klavyeyi kapat
            FocusManager.instance.primaryFocus?.unfocus(); // Klavyeyi kapat
          },
          autocorrect: false, // Otomatik düzeltmeyi kapat
          controller: controller,
          decoration: InputDecoration(
            // Metin alanı dekorasyonu
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
          maxLines: maxLines,
        ),
      ],
    );
  }
}
