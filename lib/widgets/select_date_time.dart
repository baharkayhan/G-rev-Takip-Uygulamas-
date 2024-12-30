//Tarih ve zaman seçici

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gorevim/providers/providers.dart';
import 'package:gorevim/utils/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'common_text_field.dart';

class SelectDateTime extends ConsumerWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(timeProvider); // Saat durumunu izleme
    final date = ref.watch(dateProvider); // Tarih durumunu izleme

    return Row(
      children: [
        // Tarih seçimi için metin alanı
        Expanded(
          child: CommonTextField(
            title: 'Tarih',
            hintText: Helpers.dateFormatter(date),
            readOnly: true,
            suffixIcon: IconButton(
              onPressed: () => Helpers.selectDate(context, ref),
              icon:
                  const FaIcon(FontAwesomeIcons.calendar), // Tarih seçici ikonu
            ),
          ),
        ),
        const Gap(10),
        // Saat seçimi için metin alanı
        Expanded(
          child: CommonTextField(
            title: 'Saat',
            hintText: Helpers.timeToString(time),
            readOnly: true,
            suffixIcon: IconButton(
              onPressed: () => _selectTime(context, ref),
              icon: const FaIcon(FontAwesomeIcons.clock),
            ),
          ),
        ),
      ],
    );
  }

  // Saat seçimi için zaman seçici fonksiyonu
  void _selectTime(BuildContext context, WidgetRef ref) async {
    TimeOfDay? pickedTime = await showTimePicker(
      // Zaman seçiciyi göster
      context: context,
      initialTime: TimeOfDay.now(), // Varsayılan zaman
    );
    if (pickedTime != null) {
      // Zaman seçildiyse
      ref.read(timeProvider.notifier).state =
          pickedTime; // Seçilen zamanı güncelle
    }
  }
}
