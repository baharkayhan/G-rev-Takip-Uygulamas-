//Kategori seçimi widget'ı

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gorevim/providers/category_provider.dart';
import 'package:gorevim/utils/utils.dart';
import 'package:gorevim/widgets/widgets.dart';
import 'package:gap/gap.dart';

class CategoriesSelection extends ConsumerWidget {
  const CategoriesSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref, provider'ı okumak için kullanılır
    final selectedCategory = ref.watch(categoryProvider);
    final List<TaskCategory> categories =
        TaskCategory.values.toList(); // Kategorileri listeye dönüştürür

    return SizedBox(
      // Kategori seçimi widget'ı
      height: 60,
      child: Row(
        children: [
          // Kategori başlığı
          Text(
            'Kategori',
            style: context.textTheme.titleLarge,
          ),
          const Gap(10),
          // Kategorilerin yatay listesi
          Expanded(
            child: ListView.separated(
              itemCount: categories.length, // Kategori sayısı
              shrinkWrap: true, // Kategorilerin boyutunu daraltır
              scrollDirection: Axis.horizontal, // Yatay kaydırma
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (ctx, index) {
                // Kategori oluşturucu
                final category = categories[index];

                return InkWell(
                  //ınkwell tıklanabilir widget
                  // Kategori seçimi
                  onTap: () {
                    ref.read(categoryProvider.notifier).state =
                        category; //seçilen kategoriyi günceller
                  },
                  borderRadius: BorderRadius.circular(30), // Kenar yuvarlaklığı
                  child: CircleContainer(
                    // Yuvarlak kapsayıcı
                    color: category.color.withOpacity(0.3), // Kategori rengi
                    borderColor: category.color, // Kenarlık rengi
                    child: Icon(
                      // Kategori simgesi
                      category.icon,
                      color: selectedCategory == category
                          ? context.colorScheme.primary
                          : category.color.withOpacity(0.5),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  const Gap(8), // Kategori aralığı
            ),
          ),
        ],
      ),
    );
  }
}
