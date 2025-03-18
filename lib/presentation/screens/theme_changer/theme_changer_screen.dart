import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme-changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brightness = ref.watch(themeNotifierProvider).brightness;
    final isDarkMode = brightness == Brightness.dark;
    //final bool isDarkMode = ref.watch(widgetAppThemeProvider);
    // final theme = ref.watch(themeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
              color: Colors.primaries[0],
            ),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
              // ref.read(widgetAppThemeProvider.notifier).changeTheme();
            },
          ),
        ],
      ),
      body: _ThemeChangerView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    // final int selectedColor = ref.watch(selectedColorProvider);
    // final int selectedColor = ref.watch(selectedColorNotifierProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return ListTile(
          title: RadioListTile(
            title: Text('Este color', style: TextStyle(color: color)),
            subtitle: Text('Valor ${color.toARGB32()}'),
            activeColor: color,
            value: index,
            groupValue: selectedColor,
            onChanged: (value) {
              ref
                  .read(themeNotifierProvider.notifier)
                  .changeAppSelectedColor(value);

              // ref
              // .read(selectedColorNotifierProvider.notifier)
              // .changeSelectedColor(value);
            },
          ),
        );
      },
    );
  }
}
