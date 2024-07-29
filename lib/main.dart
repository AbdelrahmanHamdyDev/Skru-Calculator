import 'package:flutter/material.dart';
import 'package:skru/Theme.dart';

import 'package:skru/Hub.dart';

void main() {
  runApp(
    MaterialApp(
      theme: LightTheme,
      darkTheme: DarkTheme,
      home: const hub(),
    ),
  );
}
