// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$colorListHash() => r'3912b93d6f6bc87467d9ee5e00df85767031fb16';

/// See also [colorList].
@ProviderFor(colorList)
final colorListProvider = AutoDisposeProvider<List<Color>>.internal(
  colorList,
  name: r'colorListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$colorListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ColorListRef = AutoDisposeProviderRef<List<Color>>;
String _$widgetAppThemeHash() => r'7e48f69fad304fabc3d34ffef8aef1d3ebfec397';

/// See also [WidgetAppTheme].
@ProviderFor(WidgetAppTheme)
final widgetAppThemeProvider =
    AutoDisposeNotifierProvider<WidgetAppTheme, bool>.internal(
      WidgetAppTheme.new,
      name: r'widgetAppThemeProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$widgetAppThemeHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$WidgetAppTheme = AutoDisposeNotifier<bool>;
String _$selectedColorNotifierHash() =>
    r'd9b1d314279c14825a9310cdbd95e40a5480f8d5';

/// See also [SelectedColorNotifier].
@ProviderFor(SelectedColorNotifier)
final selectedColorNotifierProvider =
    AutoDisposeNotifierProvider<SelectedColorNotifier, int>.internal(
      SelectedColorNotifier.new,
      name: r'selectedColorNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$selectedColorNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedColorNotifier = AutoDisposeNotifier<int>;
String _$themeNotifierHash() => r'c54385fa0016d355507d7426181f2f6b440ea571';

/// See also [ThemeNotifier].
@ProviderFor(ThemeNotifier)
final themeNotifierProvider =
    AutoDisposeNotifierProvider<ThemeNotifier, AppTheme>.internal(
      ThemeNotifier.new,
      name: r'themeNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$themeNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ThemeNotifier = AutoDisposeNotifier<AppTheme>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
