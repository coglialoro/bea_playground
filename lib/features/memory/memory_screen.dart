import 'package:bea_playground/features/memory/memory_card.dart';
import 'package:bea_playground/features/memory/utils.dart';
import 'package:flutter/material.dart';

class MemoryScreen extends StatefulWidget {
  const MemoryScreen({super.key});

  @override
  State<MemoryScreen> createState() => _MemoryScreenState();
}

class _MemoryScreenState extends State<MemoryScreen> {
  final String cardBackPath = "images/back.png";
  List<MemoryCard> cards = [];

  @override
  void initState() {
    super.initState();

    cards = getRandomCards();

    cards = [...cards, ...cards];
    cards.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: cards
              .map((card) => card.matched
                  ? Image.asset(card.imagePath)
                  : Image.asset(cardBackPath))
              .toList(),
        ),
      ),
    );
  }
}
