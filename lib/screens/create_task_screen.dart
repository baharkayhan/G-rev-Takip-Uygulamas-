//Yeni görev oluşturma ekranını tanımlar

import 'package:flutter/material.dart'; //Flutter UI bileşenleri için gerekli temel kütüphane
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gorevim/config/config.dart';
import 'package:gorevim/data/data.dart';
import 'package:gorevim/providers/providers.dart';
import 'package:gorevim/utils/utils.dart';
import 'package:gorevim/widgets/widgets.dart';
import 'package:gap/gap.dart'; //UI bileşenleri arasında boşluk bırakmak için kullanılır
import 'package:go_router/go_router.dart'; // Uygulama rotalarını yönetmek için kullanılır
import 'package:intl/intl.dart'; //Tarih ve zaman formatlama için kullanılır

// CreateTaskScreen sınıfı, yeni bir görev oluşturma ekranını temsil eder.
class CreateTaskScreen extends ConsumerStatefulWidget {
  // Bu statik metod, CreateTaskScreen'in bir örneğini oluşturur.
  static CreateTaskScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CreateTaskScreen();
  const CreateTaskScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateTaskScreenState();
}

// _CreateTaskScreenState sınıfı, CreateTaskScreen'in durumunu yönetir.
class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  // Görev adı ve açıklama için metin denetleyicileri tanımlanır.
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    // Metin denetleyicileri serbest bırakılır.
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Ekranın oluşturulması ve görüntülenmesi için kullanılır
    final colors = context.colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        title: const DisplayWhiteText(
          text: 'Yeni Görev Ekle',
        ),
      ),
      body: SafeArea(
        // Ekranın güvenli alanını oluşturur
        child: SingleChildScrollView(
          // Ekranın kaydırılabilir olmasını sağlar
          physics:
              const AlwaysScrollableScrollPhysics(), // Ekranın her zaman kaydırılabilir olmasını sağlar
          padding:
              const EdgeInsets.all(20), // Ekranın kenar boşluklarını belirler
          child: Column(
            // Ekranın içeriğini sütun şeklinde düzenler
            crossAxisAlignment: CrossAxisAlignment
                .stretch, // Sütun içindeki bileşenlerin genişliğini ekran genişliğine kadar uzatır
            children: [
              // Görev adı girişi için metin alanı
              CommonTextField(
                hintText: 'Görev Adı',
                title: 'Görev Adı',
                controller: _titleController, // Metin denetleyicisi
              ),
              const Gap(30),
              // Kategori seçimi bileşeni
              const CategoriesSelection(),
              const Gap(30),
              // Tarih ve saat seçimi bileşeni
              const SelectDateTime(),
              const Gap(30),
              // Açıklama girişi için metin alanı
              CommonTextField(
                hintText: 'Açıklama',
                title: 'Açıklama',
                maxLines: 6, // Metin alanının maksimum satır sayısını belirler
                controller: _noteController,
              ),
              const Gap(30),
              // Kaydet butonu
              ElevatedButton(
                onPressed:
                    _createTask, // Butona tıklandığında çalışacak fonksiyon
                child: const Padding(
                  padding: EdgeInsets.all(
                      8.0), // Buton içeriğinin kenar boşluklarını belirler
                  child: DisplayWhiteText(
                    text: 'Kaydet',
                  ),
                ),
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }

  // Yeni görev oluşturur
  void _createTask() async {
    final title = _titleController.text.trim(); // Görev adını alır
    final note = _noteController.text.trim(); // Görev açıklamasını alır
    final time = ref.watch(timeProvider); // Görev saatinin alınması
    final date = ref.watch(dateProvider); // Görev tarihinin alınması
    final category =
        ref.watch(categoryProvider); // Görev kategorisinin alınması
    if (title.isNotEmpty) {
      // Görev adı boş değilse
      final task = Task(
        // Görev nesnesi oluşturulur
        title: title,
        category: category,
        time: Helpers.timeToString(time),
        date: DateFormat.yMMMd().format(date),
        note: note,
        isCompleted: false,
      );

      await ref.read(tasksProvider.notifier).createTask(task).then((value) {
        // Görev oluşturulur
        AppAlerts.displaySnackbar(
            context, 'Görev başarıyla eklendi'); // Snackbar mesajı gösterilir
        context.go(RouteLocation.home); // Ana ekrana yönlendirilir
      });
    } else {
      AppAlerts.displaySnackbar(context,
          'Görev adı boş olamaz'); // Görev adı boşsa hata mesajı gösterilir
    }
  }
}
