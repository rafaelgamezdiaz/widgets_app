import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

part 'theme_provider.g.dart';

bool isDarkMode = false;

int selectedColor = 0;

@riverpod
class WidgetAppTheme extends _$WidgetAppTheme {
  @override
  bool build() => isDarkMode;

  void changeTheme() {
    state = !state;
  }
}

@riverpod
List<Color> colorList(Ref ref) {
  return appColorList;
}

@riverpod
class SelectedColorNotifier extends _$SelectedColorNotifier {
  @override
  int build() => selectedColor;

  void changeSelectedColor(value) {
    state = value;
  }
}
