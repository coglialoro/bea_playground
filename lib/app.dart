import 'package:bea_playground/features/home/home_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Bea Playground", home: HomeScreen());
  }
}
