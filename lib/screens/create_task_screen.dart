import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gorevim/config/config.dart';
import 'package:gorevim/data/data.dart';
import 'package:gorevim/providers/providers.dart';
import 'package:gorevim/utils/utils.dart';
import 'package:gorevim/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

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
    final colors = context.colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        title: const DisplayWhiteText(
          text: 'Yeni Görev Ekle',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Görev adı girişi için metin alanı
              CommonTextField(
                hintText: 'Görev Adı',
                title: 'Görev Adı',
                controller: _titleController,
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
                maxLines: 6,
                controller: _noteController,
              ),
              const Gap(30),
              // Kaydet butonu
              ElevatedButton(
                onPressed: _createTask,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
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
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    final time = ref.watch(timeProvider);
    final date = ref.watch(dateProvider);
    final category = ref.watch(categoryProvider);
    if (title.isNotEmpty) {
      final task = Task(
        title: title,
        category: category,
        time: Helpers.timeToString(time),
        date: DateFormat.yMMMd().format(date),
        note: note,
        isCompleted: false,
      );

      await ref.read(tasksProvider.notifier).createTask(task).then((value) {
        AppAlerts.displaySnackbar(context, 'Görev başarıyla eklendi');
        context.go(RouteLocation.home);
      });
    } else {
      AppAlerts.displaySnackbar(context, 'Görev adı boş olamaz');
    }
  }
}
