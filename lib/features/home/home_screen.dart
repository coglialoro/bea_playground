import 'package:bea_playground/features/memory/memory_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Scegli il gioco",
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineLarge!
                  .copyWith(color: Colors.pink, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const MemoryScreen()),
                    );
                  },
                  icon: Image.asset(
                    "images/memory_icon.png",
                  ),
                  iconSize: 96.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
