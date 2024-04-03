import 'package:appi_prueba/config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorListProvider = Provider((ref) => colorList);

final isDarkmodeProvider = StateProvider((ref) => true);

final selectecColorProvider = StateProvider((ref) => 5);

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toogleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
