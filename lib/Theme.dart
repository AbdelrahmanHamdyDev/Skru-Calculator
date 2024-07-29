import 'package:flutter/material.dart';

var texttheme = const TextTheme().copyWith(
  headlineLarge: const TextStyle(
    fontWeight: FontWeight.bold,
  ),
);

var KLightScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF131842),
);
ThemeData LightTheme = ThemeData().copyWith(
  colorScheme: KLightScheme,
  textTheme: texttheme,
);

var KDarkScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF240750),
  brightness: Brightness.dark,
);
ThemeData DarkTheme = ThemeData.dark().copyWith(
  colorScheme: KDarkScheme,
  textTheme: texttheme,
);
