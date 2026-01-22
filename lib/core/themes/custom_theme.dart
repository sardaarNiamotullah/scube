import 'package:flutter/material.dart';

class CustomThemeData {
  final Color primary;
  final Color bgPrimary;
  final Color black;
  final Color greyDark;
  final Color cyan;

  CustomThemeData({
    required this.primary,
    required this.bgPrimary,
    required this.black,
    required this.greyDark,
    required this.cyan
  });
}

class CustomTheme extends InheritedWidget {
  final CustomThemeData customThemeData;

  const CustomTheme({
    super.key,
    required this.customThemeData,
    required super.child,
  });

  static CustomThemeData of(BuildContext context) {
    final CustomTheme? customTheme = context
        .dependOnInheritedWidgetOfExactType<CustomTheme>();
    return customTheme!.customThemeData;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}

// ::test to make theme accessing shorter and normal way insead of CustomTheme.of()
extension ThemeExtender on ThemeData {
  Color get myColor =>
      brightness == Brightness.dark ? Colors.black : Colors.white;
}
