import 'package:flutter/material.dart';
import 'package:ui_ux_app/app.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white70, 
      ),
    ),
    home: const App(),
  ));
}
