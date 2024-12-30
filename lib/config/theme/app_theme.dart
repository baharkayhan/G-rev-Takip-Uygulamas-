//Uygulamanın renk şeması ve tema ayarlarını içerir.

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  // Uygulamanın açık tema ayarları
  static final light = FlexThemeData.light(
    scheme: FlexScheme.indigo, // Tema için indigo renk şemasını seçer.
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
    blendLevel: 40, // Renklerin karışım seviyesi
    appBarStyle: FlexAppBarStyle.primary, // Uygulamanın AppBar stili
    appBarOpacity: 0.95, // AppBar opaklığı
    appBarElevation: 0, // AppBar gölge yüksekliği
    transparentStatusBar: true, // StatusBar'ın (durum çubuğu) şeffaflığı
    tabBarStyle: FlexTabBarStyle.forBackground, // TabBar stili
    tooltipsMatchBackground:
        true, //true değeri, araç ipuçlarının(tooltip) arka planla uyumlu olmasını sağlar.
    swapColors:
        true, // Tema renklerinin yer değiştirilip değiştirilmemesini belirler. true değeri, belirli renklerin yer değiştirilmesini sağlar
    lightIsWhite: true, // true değeri, açık temanın beyaz olmasını sağlar.
    visualDensity:
        FlexColorScheme.comfortablePlatformDensity, // Görüntü yoğunluğu
    fontFamily: GoogleFonts.dekko()
        .fontFamily, // Uygulama için varsayılan yazı tipi ailesi (dekko)
    subThemesData: const FlexSubThemesData(
      // Uygulama için alt temalar
      useTextTheme:
          true, // true değeri, uygulama için metin temalarının kullanılmasını sağlar.
      fabUseShape:
          true, // true değeri, uygulama için FAB ( FloatingActionButton) şeklinin kullanılmasını sağlar.
      interactionEffects:
          true, // true değeri, etkileşim efektlerinin kullanılmasını sağlar.
      bottomNavigationBarElevation: 0, // BottomNavigationBar gölge  yüksekliği
      bottomNavigationBarOpacity: 1, // BottomNavigationBar opaklığı
      navigationBarOpacity: 1, // NavigationBar opaklığı
      navigationBarMutedUnselectedIcon:
          true, // true değeri, seçilmemiş simgelerin soluk olmasını sağlar.
      inputDecoratorIsFilled:
          true, // true değeri, giriş dekoratörünün doldurulmasını sağlar.
      inputDecoratorBorderType:
          FlexInputBorderType.outline, // Giriş dekoratörü kenar tipi
      inputDecoratorUnfocusedHasBorder:
          true, // true değeri, giriş dekoratörünün odaklanmamış durumda kenarlığa sahip olmasını sağlar.
      blendOnColors: true, // true değeri, renklerin karıştırılmasını sağlar.
      blendTextTheme:
          true, // true değeri, metin temalarının karıştırılmasını sağlar.
      popupMenuOpacity: 0.95, // PopupMenu opaklığı
    ),
  );
}
