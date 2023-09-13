import 'package:flutter/material.dart';
import 'package:ui_ux_app/data.dart';
import 'package:ui_ux_app/screens/home.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Home(document: Document());
  }
}