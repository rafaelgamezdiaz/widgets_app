import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/providers/theme_provider.dart';

void main() {
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(widgetAppThemeProvider);
    final brigtness = isDarkMode ? Brightness.dark : Brightness.light;
    final selectedColor = ref.watch(selectedColorNotifierProvider);

    return MaterialApp.router(
      title: 'Widgets App',
      routerConfig: appRouter,
      theme:
          AppTheme(
            selectedColor: selectedColor,
            brightness: brigtness,
          ).getThemeData(),
      debugShowCheckedModeBanner: false,
    );
  }
}
